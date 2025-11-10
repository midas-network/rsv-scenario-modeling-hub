read_config_val <- function(hub_path, config = "validation") {
  path <- paste0(hub_path, "/hub-config/", config, ".json")
  if (file.exists(path)) {
    file <- jsonlite::read_json(path, simplifyVector = TRUE)
  } else {
    message("Validation config file not found")
  }
}

validate_subm <- function(x, ...) {
  msg <- quiet_val_log(x, ...)
  check_res <- unique(purrr::map_vec(purrr::map(msg$result,
                                                ~attr(.x, "class")), 1))
  check_res <- any(c("check_failure", "check_error") %in% check_res)
  check_res2 <- grepl("Error|Warning", c(msg$warnings, msg$messages))
  check_err <- any(c(check_res, check_res2))
  out_res <- paste(msg$output, msg$messages,
                   SMHvalidation::store_msg_val(msg$result), msg$warnings,
                   sep = "\n")
  list(msg = out_res, err = check_err)
}

process_test <- function(test, file_path, section = "Model Output") {
  msg <- paste(paste0("#### ", section, "\n",
                      " --- ", file_path, " ---"),
               SMHvalidation::store_msg_val(test), sep = "\n\n")
  err <- unique(purrr::map_vec(purrr::map(test, ~ attr(.x, "class")), 1))
  err <- any(c("check_failure", "check_error") %in% err)
  list(err = err, msg = msg)
}

extract_files <- function(list_files, folder, commit = FALSE) {
  files <- select_files(list_files, commit = commit)
  files <- purrr::keep(files, ~ grepl(folder, .x))
  files <- purrr::map(files, ~ gsub(paste0(folder, "(/)?"), "", .x))
}

post_message <- function(res_list, repo_name, gh_pr_number, gh_token) {
  lst_msg <- unlist(purrr::map(res_list, "msg"), FALSE)
  purrr::map(lst_msg,
             ~gh::gh(paste0("POST /repos/", repo_name, "/issues/", gh_pr_number,
                            "/comments"), body = .x,
                     .token = gh_token))
}

validate_model_output <- function(x, repo_name, gh_pr_number, gh_token,
                                  hub_path = ".", post_msg = TRUE) {
  # prerequisite
  val_param <- read_config_val(hub_path)
  round_id <- stringr::str_extract(x, "\\d{4}-\\d{2}-\\d{2}")
  if (!(round_id %in% names(val_param))) {
    msg <- paste0("The round id in the submission file was not recognized, ",
                  "please verify")
    if (post_msg) post_message(list("msg" = msg), repo_name, gh_pr_number,
                               gh_token)
    stop(msg)
  }
  if (grepl("Ensemble", x)) {
    return(list(err = FALSE,
                msg = paste0(basename(x), " seems to be an Ensemble file",
                             " - validation not run")))
  }

  val_param <- val_param[[round_id]]
  # partition validation
  if (length(unlist(strsplit(x, "/"))) > 2) {
    if (!"partition" %in% names(val_param)) {
      msg <- paste0("The model output file seems to be partitioned, partition",
                    "not accepted for this round, please verify")
      if (post_msg) post_message(list("msg" = msg), repo_name, gh_pr_number,
                                 gh_token)
      stop(msg)
    }
    test_mod_files <-
      SMHvalidation::validate_part_file(".", x, val_param$partition) |>
      process_test(file_path = x)
    test_mod_content <- do.call(validate_subm,
                                c(val_param, x = x, hub_path = hub_path,
                                  round_id = round_id))
  } else {
    if ("partition" %in% names(val_param)) val_param$partition <- NULL
    # simple validation
    test_mod_files <- hubValidations::validate_model_file(".", x) |>
      process_test(file_path = x)
    test_mod_content <- do.call(validate_subm, c(val_param, x = x,
                                                 hub_path = hub_path))
  }
  # output
  list(err =
         unlist(purrr::map(list(test_mod_files, test_mod_content), "err")) |>
         any(),
       msg = paste(purrr::map(list(test_mod_files, test_mod_content), "msg"),
                   collapse = "\n \n---\n \n"))
}

select_files <- function(files_list, commit = FALSE) {
  if (commit) files_list <- files_list$files
  pr_filenames <- purrr::map_vec(files_list, "filename")
  pr_filenames <- pr_filenames[!"removed" == purrr::map(files_list, "status")]
}

quiet_val_log <- purrr::quietly(SMHvalidation::validate_submission)


pr_validate <- function(repo_name, gh_pr_number, gh_commit_sha, hub_path,
                        gh_token, post_msg = TRUE) {
  # Files
  if (nchar(gh_commit_sha) > 1) {
    pr_files <- gh::gh(paste0("GET /repos/", repo_name, "/commits/",
                              gh_commit_sha), .token = gh_token)
    if (grepl("Merge .+ '.+/main'", pr_files$commit$message)) {
      pr_files <- pr_filenames <- NULL
    }
    commit <- TRUE
  } else {
    pr_files <- gh::gh(paste0("GET /repos/", repo_name, "/pulls/", gh_pr_number,
                              "/files"), .token = gh_token)
    commit <- FALSE
  }
  if (!is.null(pr_files))
    pr_filenames <- select_files(pr_files, commit = commit)
  # Metadata
  if (any(grepl("model-metadata/", unique(pr_filenames)))) {
    meta_files <- extract_files(pr_files, "model-metadata/", commit = commit)
    test_meta <-
      purrr::map(meta_files,
                 ~ hubValidations::validate_model_metadata(hub_path = hub_path,
                                                           .x) |>
                   process_test(file_path = .x, section = "Model Metadata"))
  } else {
    test_meta <-  list(err = FALSE, msg = "No metadata files update")
  }
  if (post_msg) post_message(test_meta, repo_name, gh_pr_number, gh_token)
  # Model output
  if (any(grepl("model-output/", unique(pr_filenames)))) {
    mod_files <- extract_files(pr_files, "model-output/", commit = commit)
    test_mod <-
      purrr::map(mod_files,
                 ~ validate_model_output(.x, repo_name, gh_pr_number, gh_token,
                                         hub_path = hub_path,
                                         post_msg = post_msg))
  } else {
    test_mod <- list(err = FALSE,
                     msg = "No model output submission files update")
  }
  if (post_msg) post_message(test_mod, repo_name, gh_pr_number, gh_token)
  # Results
  if (any(unlist(purrr::map(c(test_mod, test_meta), "err")))) {
    stop("The submission contains one or multiple issues or warnings.")
  } else {
    message("Validation success")
  }
  list("meta" = test_meta, "mod_out" = test_mod)
}
