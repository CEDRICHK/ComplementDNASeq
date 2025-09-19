#' Reverse complement a DNA sequence
#'
#' Converts a DNA sequence to its reverse complement using the mapping
#' A <-> T and C <-> G.
#'
#' @param seq A character string representing a DNA sequence composed of A, C, G, and T.
#' @return A character string containing the reverse complement of `seq`.
#' @examples
#' reverse_complement("ACGT")
#' reverse_complement("GATTACA")
#' @export
reverse_complement <- function(seq) {
  if (!is.character(seq) || length(seq) != 1) {
    stop("`seq` must be a single character string.")
  }

  # Propager NA tel quel (doit venir avant toupper/grepl/chartr)
  if (is.na(seq)) {
    return(NA_character_)
  }

  seq <- toupper(seq)

  if (grepl("[^ACGT]", seq)) {
    stop("`seq` may only contain the characters A, C, G, and T.")
  }

  complemented <- chartr("ACGT", "TGCA", seq)
  paste0(rev(strsplit(complemented, "")[[1]]), collapse = "")
}
