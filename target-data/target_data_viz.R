#' Create a faceted plot of a specific target and age group per location
#'
#' From a data frame in the hub format, output a faceted plot of a specific
#' target and age group per location. The filtering of the specific target
#' needs to be done before using the visualization function
#'
#' @param df data frame containing the information to plot. The data frame
#' should contains the columns: `age_group`, `location`, columns from the
#' parameters `x_col`and `y_col`
#' @param x_col name of the column used for the x-axis information. By default
#' "date"
#' @param y_col name of the column used for the x-axis information. By default
#' "value"
#' @param agegroup age group to subset the inputted data frame. By default,
#' "0-130"
#' @param color color of the plot line. By default, "blue"
#' @param legend legend name. By default, "Hospitalization"
#' @param facet_ncol number of columns in the faceted plot. By default 5.
#' @param y_title name of the y-axis. By default, "Weekly Hospitalizations"
#' @param title title to which the `agegroup` information will be appended. By
#' default "RSV-NET".
#'
#' @importFrom ggplot2 ggplot geom_line geom_vline labs scale_color_manual
#'  facet_wrap theme ggtitle
#'
#' @examples
#' # Load and filter target data
#' hosp <- read.csv("./target-data/rsvnet_hospitalization.csv")
#' inc_hosp_data <- dplyr::filter(hosp, target == "inc hosp")
#' weekly_hosp_state(inc_hosp_data)
#'
weekly_hosp_state <- function(
    df, x_col = "date", y_col = "value", agegroup = "0-130",
    color = "blue", legend = "Hospitalization", facet_ncol = 5,
    y_title = "Weekly Hospitalizations", title = "RSV-NET") {
  # Prerequisite
  colors <- setNames(color, legend)
  # Plot
  plot <- ggplot2::ggplot(subset(df, age_group == agegroup)) +
    geom_line(aes(as.Date(.data[[x_col]]), .data[[y_col]], color = legend),
              lwd = 0.8) +
    geom_vline(xintercept = seq(as.Date("2017-01-01"),
                                as.Date("2024-01-01"), 365),
               lty = 1,color = "grey") +
    labs(x = "Date", y = y_title, color = "Legend") +
    scale_color_manual(values = colors) +
    facet_wrap(~location, scales = "fixed", ncol = facet_ncol) +
    theme(legend.position = c(0.8, 0.05)) +
    ggtitle(paste0(title, ", ", agegroup, " years"))

  return(plot)
}
