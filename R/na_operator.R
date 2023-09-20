#' \%+na\%
#'
#' This function "defines a dyadic operator that will behave differently than
#' 	the "+" operator with regards to missing values". (Quote by 42- in Source
#'   1 below). In this case, add \code{x} and \code{y} so that \code{NA} is ignored
#'   when \code{x} is a number and \code{x = NA} when \code{x = 0}.
#'
#'
#' @param x numeric vector that does not contain any \code{NA} values
#' @param y numeric vector which contains at least one \code{NA} value
#'
#' @return numeric vector resulting from the \code{sum} of \code{x} and \code{y}
#'
#'
#'
#'
#' @source
#' \enumerate{
#'    \item Using `:=` in data.table to sum the values of two columns in R, ignoring NAs - Stack Overflow answered by 42- on Oct 28 2012. See \url{https://stackoverflow.com/questions/13106645/using-in-data-table-to-sum-the-values-of-two-columns-in-r-ignoring-nas}.
#'    \item R - merge unequal regular (15 min intervals) and irregular time series within 10 minutes - Stack Overflow asked by iembry on Jan 12 2015 and edited by iembry on Feb 2 2015. See \url{https://stackoverflow.com/questions/27911643/r-merge-unequal-regular-15-min-intervals-and-irregular-time-series-within-10}.
#'    \item r - How to not run an example using roxygen2? - Stack Overflow answered and edited by samkart on Jul 9 2017. (Also see the additional comments in response to the answer.) See \url{https://stackoverflow.com/questions/12038160/how-to-not-run-an-example-using-roxygen2}.
#'    \item devtools - Issues in R package after CRAN asked to replace dontrun by dontrun - Stack Overflow answered by Hong Ooi on Sep 1 2020. (Also see the additional comments in response to the answer.) See \url{https://stackoverflow.com/questions/63693563/issues-in-r-package-after-cran-asked-to-replace-dontrun-by-dontrun}.
#' }
#'
#'
#' @encoding UTF-8
#'
#'
#'
#' @examples
#' 
#' library("ie2misc")
#' 
#' a <- 1:10
#' b <- c(98:106, NA)
#'
#' a %+na% b
#'
#'
#' \dontrun{
#' # See Source 3 and Source 4
#' # Note that if the vector with the NA value(s) is first, then an error
#' # message will be displayed as now there are checks for both x and y.
#' 
#' a <- 1:10
#' b <- c(98:106, NA)
#' 
#' try(b %+na% a)
#' }
#'
#'
#' a1 <- 1:12
#' b1 <- c(98:106, rep(NA, 3))
#'
#' a1 %+na% b1
#'
#'
#' # using a matrix of the numeric vectors a and b
#' mat1 <- matrix(data = c(a, b), nrow = length(b), ncol = 2, byrow = FALSE,
#'         dimnames = list(c(rep("", length(b))), c("a", "b")))
#' mat1[, 1] %+na% mat1[, 2]
#'
#'
#' # using a data.frame of the numeric vectors a and b
#' df1 <- data.frame(a, b)
#' df1[, 1] %+na% df1[, 2]
#'
#'
#' library("data.table")
#' 
#' # using a data.table of the numeric vectors a and b
#' 
#' a <- 1:10
#' b <- c(98:106, NA)
#' 
#' df2 <- data.table(a, b)
#' df2[, 1, with = FALSE][[1]] %+na% df2[, 2, with = FALSE][[1]]
#'
#'
#' @importFrom assertthat assert_that
#' @importFrom checkmate qtest testScalarNA
#'
#' @export
"%+na%" <- function(x, y) {

# Check
assert_that(qtest(x, "N+(,)"), msg = "Either x is NA, NaN, Inf, -Inf, empty, or a string. Please try again.")
# only process with finite values and provide an error message if the check fails

# Check
assert_that(any(unlist(lapply(y, testScalarNA))), msg = "Either x is NA, NaN, Inf, -Inf, empty, or a string. Please try again.")
# only process with finite values and provide an error message if the check fails


ifelse (x == 0 & is.na(y) == TRUE, NA,
ifelse (x != 0 & is.na(y) == TRUE, x, x + y))
# Source 1 and 2

}
