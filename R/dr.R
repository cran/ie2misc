#' Index of agreement (dr)
#'
#' This function computes the "index of agreement (dr)".
#'
#' dr is expressed as
#'
#' \deqn{d_{r} = 1 - \frac{\sum \limits_{i=1}^n{\left|P_i - O_i\right|}}{c \sum \limits_{i=1}^n{\left|O_i - \bar{O}\right|}}, \: when \: \sum \limits_{i=1}^n{\left|P_i - O_i\right|} \leq c \: \sum \limits_{i=1}^n{\left|O_i - \bar{O}\right|}}
#'
#' \deqn{d_{r} = \frac{{c \sum \limits_{i=1}^n{\left|O_i - \bar{O}\right|}}}{\sum \limits_{i=1}^n{\left|P_i - O_i\right|}} - 1, \: when \: \sum \limits_{i=1}^n{\left|P_i - O_i\right|} > c \: \sum \limits_{i=1}^n{\left|O_i - \bar{O}\right|}}
#'
#' \describe{
#'	\item{\emph{\eqn{d_r}}}{the "index of agreement (dr)"}
#'	\item{\emph{n}}{the number of observations}
#'	\item{\emph{P}}{the "model estimates or predictions"}
#'	\item{\emph{O}}{the "pairwise-matched observations that are judged to
#'   be reliable"}
#'	\item{\emph{\eqn{\bar{O}}}}{the "true" mean of the observations}
#' }
#'
#' 	Note: Both P and O should have the same units.
#'
#'	The "index of agreement (dr)" is fully discussed in the Willmott reference.
#'
#'
#' @param predicted numeric vector that contains the predicted data
#'	points (1st parameter)
#' @param observed numeric vector that contains the observed data
#'	points (2nd parameter)
#' @param na.rm logical vector that determines whether the missing
#'	values should be removed or not.
#'
#' @return "index of agreement (dr)" as a numeric vector. The default choice
#'	is that any NA values will be kept (na.rm = FALSE). This can be
#'	changed by specifying \code{na.rm = TRUE}, such as \code{dr(pre, obs, na.rm = TRUE)}.
#'
#'
#'
#'
#'
#'
#' @references
#' Cort J. Willmott, Scott M. Robeson, and Kenji Matsuura, "A refined index of model performance", \emph{International Journal of Climatology}, Volume 32, Issue 13, pages 2088-2094, 15 November 2012, article from ResearchGate: \url{https://www.researchgate.net/publication/235961403_A_refined_index_of_model_performance}.
#'
#'
#' @encoding UTF-8
#'
#'
#'
#'
#'
#'
#' @seealso \code{\link{mape}} for mean absolute percent error (MAPE), \code{\link{mae}} for
#'  mean-absolute error (MAE), \code{\link{madstat}} for mean-absolute deviation (MAD), \code{\link{vnse}}
#'  for Nash-Sutcliffe model efficiency (NSE), and \code{\link{rmse}} for root mean square error (RMSE).
#'
#'
#'
#'
#'
#'
#'
#' @examples
#' 
#' library("ie2misc")
#' 
#' obs <- 1:10 # observed
#' pre <- 2:11 # predicted
#' dr(pre, obs)
#'
#'
#' library("rando")
#' 
#' set_n(100) # makes the example reproducible
#' obs1 <- r_norm(.seed = 400) # observed
#' pre1 <- r_norm(.seed = 500) # predicted
#'
#'
#' # using the vectors pre1 and obs1
#' dr(pre1, obs1)
#'
#'
#' # using a matrix of the numeric vectors pre1 and obs1
#' mat1 <- matrix(data = c(obs1, pre1), nrow = length(pre1), ncol = 2,
#' byrow = FALSE, dimnames = list(c(rep("", length(pre1))),
#' c("Predicted", "Observed")))
#' dr(mat1[, 2], mat1[, 1])
#'
#' # mat1[, 1] # observed values from column 1 of mat1
#' # mat1[, 2] # predicted values from column 2 of mat1
#'
#'
#' # using a data.frame of the numeric vectors pre1 and obs1
#' df1 <- data.frame(obs1, pre1)
#' dr(df1[, 2], df1[, 1])
#'
#' # df1[, 1] # observed values from column 1 of df1
#' # df1[, 2] # predicted values from column 2 of df1
#'
#'
#' library("data.table")
#' 
#' # using a data.table of the numeric vectors pre1 and obs1
#' df2 <- data.table(obs1, pre1)
#' dr(df2[, 2, with = FALSE][[1]], df2[, 1, with = FALSE][[1]])
#'
#' # df2[, 1, with = FALSE][[1]] # observed values from column 1 of df2
#' # df2[, 2, with = FALSE][[1]] # predicted values from column 2 of df2
#'
#'
#' @importFrom assertthat assert_that
#' @importFrom checkmate qtest
#'
#' @export
dr <- function (predicted, observed, na.rm = FALSE) {

# The base::mean.default code has been helpful with regards to the treatment
# of non-numeric values

assert_that(!any(qtest(predicted, "N>1(,)") == FALSE), msg = "predicted is Inf, -Inf, a string, empty Or contains less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(!any(qtest(observed, "N>1(,)") == FALSE), msg = "observed is Inf, -Inf, a string, empty Or contains less less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(((length(predicted) != length(observed)) == FALSE), msg = "Check the length of the predicted and observed vectors since they don't match. Use a different set of values and then try again.")
# Source 1 / provide a stop warning if the length of the numeric vectors do not match


  c <- 2

if (na.rm == TRUE) {

if (sum(abs(predicted - observed), na.rm = na.rm) <=
(c * sum(abs(observed - mean(observed, na.rm = na.rm)), na.rm = na.rm))) {

  1 - (sum(abs(predicted - observed), na.rm = na.rm) /
  (c * sum(abs(observed - mean(observed, na.rm = na.rm)), na.rm = na.rm)))

} else {

  ((c * sum(abs(observed - mean(observed, na.rm = na.rm)), na.rm = na.rm)) /
  sum(abs(predicted - observed), na.rm = na.rm)) - 1

} }

else {

if (anyNA(predicted) | anyNA(observed)) {

NA

} else {

if (sum(abs(predicted - observed), na.rm = na.rm) <=
(c * sum(abs(observed - mean(observed, na.rm = na.rm)), na.rm = na.rm))) {

  1 - (sum(abs(predicted - observed), na.rm = na.rm) /
  (c * sum(abs(observed - mean(observed, na.rm = na.rm)), na.rm = na.rm)))

} else {

  ((c * sum(abs(observed - mean(observed, na.rm = na.rm)), na.rm = na.rm)) /
  sum(abs(predicted - observed), na.rm = na.rm)) - 1

} }


}
}
