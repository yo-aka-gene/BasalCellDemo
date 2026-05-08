#' Create a sorted and deduplicated named vector
#'
#' @description
#' Extracts unique name-value pairs from vectors, sorted by a reference vector.
#' This is particularly useful for generating clean, ordered color maps
#' (named vectors) for `ComplexHeatmap` annotations from a data frame.
#'
#' @param values  A vector of values for setNames (e.g., color hex codes).
#' @param names A vector of names for setNames.
#' @param sort_by A vector used to define the sorting order of the output.
#'
#' @return A named vector where elements are `values` and names are `names`,
#'   sorted by `sort_by` and deduplicated by `names`.
#'
#' @export
#'
#' @examples
#' df <- data.frame(
#'   leiden = c("2", "1", "1", "3", "2"),
#'   color = c("#00FF00", "#FF0000", "#FF0000", "#0000FF", "#00FF00"),
#'   celltype = c("B cell", "T cell", "T cell", "NK cell", "B cell")
#' )
#' # Create a color map for celltypes, ordered by leiden clusters
#' sorted_setnames(df$color, df$celltype, df$leiden)
sorted_setnames <- function(values, names, sort_by) {
  ordered_idx <- order(sort_by)
  ordered_values <- values[ordered_idx]
  ordered_names <- names[ordered_idx]

  unique_flags <- !duplicated(ordered_names)

  setNames(
    ordered_values[unique_flags],
    ordered_names[unique_flags]
  )
}
