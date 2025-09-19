test_that("reverse_complement handles standard sequences", {
  expect_equal(reverse_complement("ACGT"), "ACGT")
  expect_equal(reverse_complement("GATTACA"), "TGTAATC")
})

test_that("reverse_complement normalises lower case input", {
  expect_equal(reverse_complement("acgt"), "ACGT")
})

test_that("reverse_complement validates inputs", {
  expect_error(reverse_complement("ACGN"), "may only contain")
  expect_error(reverse_complement(character(0)), "must be a single")
  expect_error(reverse_complement(c("A", "C")), "must be a single")
})

test_that("reverse_complement rejects non-ATGC characters with clear message", {
  expect_error(
    reverse_complement("ARGC"),
    "`seq` may only contain the characters A, C, G, and T.",
    fixed = TRUE
  )
})

test_that("reverse_complement errors on extra arguments", {
  # Le message dépend de la langue de R ("unused argument" vs "arguments inutilisés").
  expect_error(
    reverse_complement("ATGC", "NNNN", NA),
    regexp = "unused argument|arguments inutilisés"
  )
})

test_that("reverse_complement handles NA and length-1 contract", {
  expect_equal(reverse_complement(NA_character_), NA_character_)
  expect_error(reverse_complement(c("ATGC","TTTT")), "must be a single", ignore.case = TRUE)
})