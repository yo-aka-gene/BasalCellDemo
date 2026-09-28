library(testthat)

test_that("sorted_setnames creates a properly ordered named vector", {
  df <- data.frame(
    sort_by = c("2", "1", "1", "3", "2", "4"),
    values = c("two", "one", "one", "three", "two", "four"),
    names = c("dos", "uno", "uno", "tres", "dos", "cuatro")
  )
  res <- sorted_setnames(df$values, df$names, df$sort_by)
  expected_vector <- setNames(
    c("one", "two", "three", "four"),
    c("uno", "dos", "tres", "cuatro")
  )
  expect_identical(res, expected_vector)
})

test_that("sorted_setnames handles character sorting correctly", {
  res <- sorted_setnames(
    values = c("two", "one", "three"),
    names = c("dos", "uno", "tres"),
    sort_by = c("B", "A", "C")
  )
  expected_vector <- setNames(
    c("one", "two", "three"),
    c("uno", "dos", "tres")
  )
  expect_identical(res, expected_vector)
})
