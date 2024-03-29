#' Mean absolute percent error (MAPE)
#'
#' This function computes the mean absolute percent error (MAPE).
#'
#' MAPE is expressed as
#'
#' 	\deqn{\frac{1}{n} \sum \limits_{i=1}^n{ 100 \frac{\left| X_i - Y_i \right|} {X_i}}}
#'
#' \describe{
#'	\item{\emph{n}}{the number of observations}
#'	\item{\emph{X}}{the observations}
#'	\item{\emph{Y}}{the predictions}
#' }
#'
#'
#' 	Below are some points to remember about MAPE from the Ji reference:
#' \enumerate{
#'    \item MAPE is "a measure to validate forecast models",
#'    \item MAPE is "a standardized value and is independent of the unit of
#'      the measurement",
#'    \item MAPE is "meaningful only if all \eqn{X_i} values are positive",
#'    \item MAPE is "unstable when \eqn{X_i} values are near zero", and
#'    \item "If X and Y are interchanged, the MAPE will result in a
#'      different value."
#' }
#'
#'
#' @param predicted numeric vector that contains the predicted data
#'        points (1st parameter)
#' @param observed numeric vector that contains the observed data
#'        points (2nd parameter)
#' @param na.rm logical vector that determines whether the missing
#'        values should be removed or not.
#'
#' @return mean absolute percent error (MAPE) as a numeric vector. The default
#'         choice is that any NA values will be kept (\code{na.rm = FALSE}). This can be
#'         changed by specifying \code{na.rm = TRUE}, such as \code{mape(pre, obs, na.rm = TRUE)}.
#'
#'
#'
#'
#'
#'
#'
#' @references
#' Lei Ji and Kevin Gallo, "An Agreement Coefficient for Image Comparison", \emph{Photogrammetric Engineering & Remote Sensing}, Vol. 72, No. 7, July 2006, p. 823-8335, \url{https://www.ingentaconnect.com/content/asprs/pers/2006/00000072/00000007/art00006}.
#'
#' @encoding UTF-8
#'
#'
#'
#'
#'
#' @seealso \code{\link{mae}} for mean-absolute error (MAE), \code{\link{madstat}} for
#'  mean-absolute deviation (MAD), \code{\link{dr}} for "index of agreement (dr)", \code{\link{vnse}}
#'  for Nash-Sutcliffe model efficiency (NSE), and \code{\link{rmse}} for
#'  root mean square error (RMSE).
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
#' mape(pre, obs)
#'
#'
#' library("rando")
#' 
#' set_n(100) # makes the example reproducible
#' obs1 <- r_norm(.seed = 109) # observed
#' pre1 <- r_norm(.seed = 124) # predicted
#'
#'
#' # using the vectors pre1 and obs1
#' mape(pre1, obs1)
#'
#'
#' # using a matrix of the numeric vectors pre1 and obs1
#' mat1 <- matrix(data = c(obs1, pre1), nrow = length(pre1), ncol = 2,
#'         byrow = FALSE, dimnames = list(c(rep("", length(pre1))),
#'         c("Predicted", "Observed")))
#' mape(mat1[, 2], mat1[, 1])
#'
#' # mat1[, 1] # observed values from column 1 of mat1
#' # mat1[, 2] # predicted values from column 2 of mat1
#'
#'
#' # using a data.frame of the numeric vectors pre1 and obs1
#' df1 <- data.frame(obs1, pre1)
#' mape(df1[, 2], df1[, 1])
#'
#' # df1[, 1] # observed values from column 1 of df1
#' # df1[, 2] # predicted values from column 2 of df1
#'
#'
#' library("data.table")
#' 
#' # using a data.table of the numeric vectors pre1 and obs1
#' df2 <- data.table(obs1, pre1)
#' mape(df2[, 2, with = FALSE][[1]], df2[, 1, with = FALSE][[1]])
#'
#' # df2[, 1, with = FALSE][[1]] # observed values from column 1 of df2
#' # df2[, 2, with = FALSE][[1]] # predicted values from column 2 of df2
#'
#'
#'
#' @importFrom checkmate qtest
#' @importFrom assertthat assert_that
#'
#' @export
mape <- function (predicted, observed, na.rm = FALSE) {

# The base::mean.default code has been helpful with regards to the treatment
# of non-numeric values

# The moments::kurtosis code has been helpful with regards to the treatment of
# na.rm

assert_that(!any(qtest(predicted, "N>1(,)") == FALSE), msg = "predicted is Inf, -Inf, a string, empty Or contains less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(!any(qtest(observed, "N>1(,)") == FALSE), msg = "observed is Inf, -Inf, a string, empty Or contains less less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(((any(observed) == 0) == FALSE), msg = "observed is 0. Use a different set of values and then try again.")
# Source 1 / provide a stop warning if the length of one of the vectors is 0

assert_that(((length(predicted) != length(observed)) == FALSE), msg = "Check the length of the predicted and observed vectors since they don't match. Use a different set of values and then try again.")
# Source 1 / provide a stop warning if the length of the numeric vectors do not match


if (na.rm == TRUE) {

  observed <- observed[!is.na(observed)]

  predicted <- predicted[!is.na(predicted)]

  n <- length(predicted)

  (1 / n) * (sum(100 * (abs((observed - predicted) / observed)), na.rm = na.rm))

} else {

  n <- length(predicted)

  (1 / n) * (sum(100 * (abs((observed - predicted) / observed)), na.rm = na.rm))

}
}
