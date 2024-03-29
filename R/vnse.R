#' Nash-Sutcliffe model efficiency (NSE)
#'
#' This function computes the Nash-Sutcliffe model efficiency (NSE) or
#' 	"Nash and Sutcliffe’s coefficient of efficiency (E)".
#'
#' NSE or E is expressed as
#'
#' 	\deqn{E = 1 - \frac{\sum \limits_{i=1}^n{\left(P_i - O_i\right)^2}}{\sum \limits_{i=1}^n{\left(O_i - \bar{O}\right)^2}}}
#'
#' \describe{
#'	\item{\emph{E}}{"Nash and Sutcliffe’s coefficient of efficiency (E)"}
#'	\item{\emph{n}}{the number of observations}
#'	\item{\emph{P}}{the "model estimates or predictions"}
#'	\item{\emph{O}}{the "pairwise-matched observations that are judged to
#'   be reliable"}
#'	\item{\emph{\eqn{\bar{O}}}}{the "true" mean of the observations}
#' }
#'
#' 	Note: Both P and O should have the same units.
#'
#'	"Nash and Sutcliffe’s coefficient of efficiency (E)" and other
#'   "dimensionless measures of average error" are fully discussed in the
#'   Willmott reference.
#'
#'
#' @param predicted numeric vector that contains the model predicted
#'   data points (1st parameter)
#' @param observed numeric vector that contains the observed data
#'   points (2nd parameter)
#' @param na.rm logical vector that determines whether the missing
#'   values should be removed or not.
#'
#' @return Nash-Sutcliffe model efficiency (NSE) as a numeric vector. The
#'   default choice is that any NA values will be kept (\code{na.rm = FALSE}). This can
#'   be changed by specifying \code{na.rm = TRUE}, such as \code{vnse(pre, obs, na.rm = TRUE)}.
#'
#'
#'
#'
#'
#'
#' @references
#' Cort J. Willmott, Scott M. Robeson, and Kenji Matsuura, "A refined index of model performance", \emph{International Journal of Climatology}, Volume 32, Issue 13, pages 2088-2094, 15 November 2012, article from ResearchGate: \url{https://www.researchgate.net/publication/235961403_A_refined_index_of_model_performance}.
#'
#' @encoding UTF-8
#'
#'
#'
#'
#'
#' @seealso \code{\link{mape}} for mean absolute percent error (MAPE), \code{\link{mae}} for
#'  mean-absolute error (MAE), \code{\link{madstat}} for mean-absolute deviation (MAD), \code{\link{dr}}
#'  for "index of agreement (dr)", and \code{\link{rmse}} for root mean square error (RMSE).
#'
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
#' vnse(pre, obs)
#'
#'
#' library("rando")
#' 
#' set_n(100) # makes the example reproducible
#' obs1 <- r_norm(.seed = 609) # observed
#' pre1 <- r_norm(.seed = 624) # predicted
#'
#'
#' # using the vectors pre1 and obs1
#' vnse(pre1, obs1)
#'
#'
#' # using a matrix of the numeric vectors pre1 and obs1
#' mat1 <- matrix(data = c(obs1, pre1), nrow = length(pre1), ncol = 2,
#'    byrow = FALSE, dimnames = list(c(rep("", length(pre1))),
#'    c("Predicted", "Observed")))
#' vnse(mat1[, 2], mat1[, 1])
#'
#' # mat1[, 1] # observed values from column 1 of mat1
#' # mat1[, 2] # predicted values from column 2 of mat1
#'
#'
#' # using a data.frame of the numeric vectors pre1 and obs1
#' df1 <- data.frame(obs1, pre1)
#' vnse(df1[, 2], df1[, 1])
#'
#' # df1[, 1] # observed values from column 1 of df1
#' # df1[, 2] # predicted values from column 2 of df1
#'
#'
#' library("data.table")
#' 
#' # using a data.table of the numeric vectors pre1 and obs1
#' df2 <- data.table(obs1, pre1)
#' vnse(df2[, 2, with = FALSE][[1]], df2[, 1, with = FALSE][[1]])
#'
#' # df2[, 1, with = FALSE][[1]] # observed values from column 1 of df2
#' # df2[, 2, with = FALSE][[1]] # predicted values from column 2 of df2
#'
#'
#'
#'
#'
#' @importFrom checkmate qtest
#' @importFrom assertthat assert_that
#'
#' @export
vnse <- function(predicted, observed, na.rm = FALSE) {

# The base::mean.default code has been helpful with regards to the treatment
# of non-numeric values

assert_that(!any(qtest(predicted, "N>1(,)") == FALSE), msg = "predicted is Inf, -Inf, a string, empty Or contains less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(!any(qtest(observed, "N>1(,)") == FALSE), msg = "observed is Inf, -Inf, a string, empty Or contains less less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(((any(observed) == 0) == FALSE), msg = "observed is 0. Use a different set of values and then try again.")
# Source 1 / provide a stop warning if the length of one of the vectors is 0

assert_that(((length(predicted) != length(observed)) == FALSE), msg = "Check the length of the predicted and observed vectors since they don't match. Use a different set of values and then try again.")
# Source 1 / provide a stop warning if the length of the numeric vectors do not match


if (na.rm) {

num <- sum((predicted - observed) ^ 2, na.rm = na.rm)

denom <- sum((observed - mean(observed, na.rm = na.rm)) ^ 2, na.rm = na.rm)

1 - (num / denom)

} else {

num <- sum((predicted - observed) ^ 2, na.rm = na.rm)

denom <- sum((observed - mean(observed, na.rm = na.rm)) ^ 2, na.rm = na.rm)

1 - (num / denom)

}
}
