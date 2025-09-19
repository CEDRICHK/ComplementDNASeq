## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# # install.packages("remotes")
# remotes::install_github("CEDRICHK/ComplementDNASeq")

## -----------------------------------------------------------------------------
library(ComplementDNASeq)
reverse_complement("GATTACA")

## ----error = TRUE-------------------------------------------------------------
try({
reverse_complement("GATUACA")
})

## -----------------------------------------------------------------------------
reverse_complement(NA_character_)

## -----------------------------------------------------------------------------
seqs <- c("ACTG", "TTTT", "CGCG")
vapply(seqs, reverse_complement, character(1))

