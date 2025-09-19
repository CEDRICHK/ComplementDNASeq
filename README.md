
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ComplementDNASeq

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

ComplementDNASeq provides a small set of utilities for working with DNA
sequences, starting with a robust implementation of a reverse-complement
helper. The package normalises input, validates characters, and returns
the expected Watson–Crick pairing for common workflows.

## Installation

You can install the development version of ComplementDNASeq from GitHub
with:

``` r
# install.packages("devtools")
devtools::install_github("cedrichk/ComplementDNASeq")
```

Alternatively, clone the repository locally and run
`devtools::load_all()` while developing.

## Example

The exported `reverse_complement()` function returns the reverse
complement of a DNA sequence while enforcing A/C/G/T input.

``` r
library(ComplementDNASeq)

reverse_complement("GATTACA")
#> [1] "TGTAATC"
#> [1] "TGTAATC"
```

Lowercase input is accepted and uppercased automatically.

``` r
reverse_complement("acgt")
#> [1] "ACGT"
#> [1] "ACGT"
```

## Testing

ComplementDNASeq uses the `testthat` framework. You can execute the test
suite with:

``` r
devtools::test()
```

Make sure the development dependencies (`testthat`, `waldo`, and a
recent `pkgload`) are installed before running the tests.
