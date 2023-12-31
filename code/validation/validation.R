library(SMHvalidation)
library(gh)

# check if submissions file
pr_files <- gh::gh(paste0("GET /repos/",
                          "midas-network/rsv-scenario-modeling-hub/", "pulls/",
                          Sys.getenv("GH_PR_NUMBER"),"/files"))

pr_files_name <- purrr::map(pr_files, "filename")
pr_sub_files <- grep(
  "model-output/.*/\\d{4}-\\d{2}-\\d{2}.+-.+(.gz|.pqt|.parquet)",
  pr_files_name, value = TRUE)
pop_path <- "auxiliary-data/location_census/locations.csv"
js_def_file <- "hub-config/tasks.json"

# Run validation on file corresponding to the submission file format
if (length(pr_sub_files) > 0) {
  # select submission files
  pr_sub_files_lst <- pr_files[purrr::map(
    pr_files, "filename") %in% pr_sub_files]
  # Prepare viz path if necessary
  if (!(dir.exists(paste0(getwd(), "/proj_plot"))))
    dir.create(paste0(getwd(), "/proj_plot"))
  # run validation and visualization
  test_tot <- lapply(seq_len(length(pr_sub_files_lst)), function(x) {
    # submission file
    url_link <- URLdecode(pr_sub_files_lst[[x]]$raw_url)
    # Run validation and visualization
    # validation and visualization for parquet file format
    if (grepl(".gz$|.parquet$|.pqt$", url_link)) {
      # download file
      download.file(url_link, basename(url_link))
      df <- arrow::read_parquet(basename(url_link))
      # generate visualization pdf
      if (any("quantile" %in% df$output_type)) {
        test_viz <- try(generate_validation_plots(
          path_proj = basename(url_link), lst_gs = NULL,
          save_path = paste0(getwd(), "/proj_plot"), y_sqrt = FALSE,
          plot_quantiles = c(0.025, 0.975)))
      } else {
        test_viz <- NA
      }
      # run validation
      test <- capture.output(try(validate_submission(
        basename(url_link), lst_gs = NULL, pop_path = pop_path,
        js_def = js_def_file, merge_sample_col = TRUE)))
    } else {
      test_viz <- NA
      test <- capture.output(cat(paste0(
        "\U000274c Error: The submission file format was not recognized.")))
    }
    # Remove visualization pdf if viz has an error
    if (class(test_viz) == "try-error")
      file.remove(dir(paste0(getwd(), "/proj_plot"), full.names = TRUE))

    # list of the viz and validation results
    test_tot <- list(valid = test, viz = test_viz)
    # returns all output
    return(test_tot)
  })
}  else {
  test_tot <-  list(list(
    valid = paste0(
      "No projection submission file in the standard SMH file ",
      "format found in the Pull-Request. No validation was run."),
    viz = NA
  ))
}

# Post validation results as comment on the open PR
test_valid <- purrr::map(test_tot, "valid")
message <- purrr::map(test_valid, paste, collapse = "\n")

lapply(seq_len(length(message)), function(x) {
  gh::gh(paste0("POST /repos/", "midas-network/rsv-scenario-modeling-hub/",
                "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
         body = message[[x]],
         .token = Sys.getenv("GH_TOKEN"))
})

# Post visualization results as comment on the open PR
test_viz <- purrr::map(test_tot, "viz")
if (any(!is.na(test_viz))) {
  message_plot <- paste0(
    "If the submission contains a projection file, a pdf containing the ",
    "visualization plots of the submission is available and downloadable ",
    "in the GitHub actions. Please click on 'details' on the right of the ",
    "'Validate submission' checks. The pdf is available in a ZIP file as ",
    "an artifact of the GH Actions. For more information, please see ",
    "[here](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts)")

  if (any(unlist(purrr::map(test_viz, class)) == "try-error")) {
    message_plot <- capture.output(
      paste0(message_plot, "\n\n\U000274c Error: ",
                 "The visualization encounters an issue and might not be available,",
                 " if the validation does not return any error, please feel free to ",
                 "tag `@LucieContamin` for any question."))
  }

  gh::gh(paste0("POST /repos/", "midas-network/rsv-scenario-modeling-hub/",
                "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
         body = message_plot,
         .token = Sys.getenv("GH_TOKEN"))
}

# Validate or stop the github actions
if (any(grepl("\U000274c Error", test_valid))) {
  stop("The submission contains one or multiple issues")
} else if (any(grepl("Warning", test_valid))) {
  warning(" The submission is accepted but contains some warnings")
}
