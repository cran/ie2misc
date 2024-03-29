#' Root mean square error (RMSE)
#'
#' This function computes the root mean square error (RMSE).
#'
#' RMSE is expressed as
#'
#'	\deqn{\sqrt{n^{-1} \sum \limits_{i=1}^n{ \left| P_i - O_i \right|^2}}}
#'
#' \describe{
#'	\item{\emph{n}}{the number of observations}
#'	\item{\emph{P}}{the "model estimates or predictions"}
#'	\item{\emph{O}}{the "thought-to-be reliable and pairwise matched
#'   observations"}
#' }
#'
#' RMSE is fully discussed in the Willmott reference, including a comparison
#'   to mean-absolute error (MAE).
#'
#'
#' @param predicted numeric vector that contains the predicted data
#'   points (1st parameter)
#' @param observed numeric vector that contains the observed data
#'   points (2nd parameter)
#' @param na.rm logical vector that determines whether the missing
#'   values should be removed or not.
#'
#' @return mean absolute percent error (RMSE) as a numeric vector. The default
#'   choice is that any NA values will be kept (\code{na.rm = FALSE}). This can be
#'   changed by specifying \code{na.rm = TRUE}, such as \code{rmse(pre, obs, na.rm = TRUE)}.
#'
#'
#'
#'
#'
#'
#' @references
#' Cort J. Willmott and Kenji Matsuura, "Advantages of the mean-absolute error (MAE) over the root mean square error (RMSE) in assessing average model performance", \emph{Climate Research}, Vol. 30: 79-82, 2005, \url{https://web.archive.org/web/20230119121852/climate.geog.udel.edu/~climate/publication_html/Pdf/WM_CR_05.pdf}. Retrieved thanks to the Internet Archive: Wayback Machine
#'
#' @encoding UTF-8
#'
#'
#'
#'
#'
#' @seealso \code{\link{mape}} for mean absolute percent error (MAPE), \code{\link{mae}} for
#'  mean-absolute error (MAE), \code{\link{madstat}} for mean-absolute deviation (MAD), \code{\link{dr}}
#'  for "index of agreement (dr)", and \code{\link{vnse}} for
#'  Nash-Sutcliffe model efficiency (NSE).
#'
#'
#'
#'
#'
#'
#' @examples
#' library("ie2misc")
#' 
#' obs <- 1:10 # observed
#' pre <- 2:11 # predicted
#' rmse(pre, obs)
#'
#'
#' library("rando")
#' 
#' set_n(100) # makes the example reproducible
#' obs1 <- r_norm(.seed = 209) # observed
#' pre1 <- r_norm(.seed = 224) # predicted
#'
#'
#' # using the vectors pre1 and obs1
#' rmse(pre1, obs1)
#'
#'
#' # using a matrix of the numeric vectors pre1 and obs1
#' mat1 <- matrix(data = c(obs1, pre1), nrow = length(pre1), ncol = 2,
#'   byrow = FALSE, dimnames = list(c(rep("", length(pre1))),
#'   c("Predicted", "Observed")))
#' rmse(mat1[, 2], mat1[, 1])
#'
#' # mat1[, 1] # observed values from column 1 of mat1
#' # mat1[, 2] # predicted values from column 2 of mat1
#'
#'
#' # using a data.frame of the numeric vectors pre1 and obs1
#' df1 <- data.frame(obs1, pre1)
#' rmse(df1[, 2], df1[, 1])
#'
#' # df1[, 1] # observed values from column 1 of df1
#' # df1[, 2] # predicted values from column 2 of df1
#'
#'
#' library("data.table")
#' 
#' # using a data.table of the numeric vectors pre1 and obs1
#' df2 <- data.table(obs1, pre1)
#' rmse(df2[, 2, with = FALSE][[1]], df2[, 1, with = FALSE][[1]])
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
rmse <- function (predicted, observed, na.rm = FALSE) {

# The base::mean.default code has been helpful with regards to the treatment
# of non-numeric values

# The moments::kurtosis code has been helpful with regards to the treatment of
# na.rm

assert_that(!any(qtest(predicted, "N>1(,)") == FALSE), msg = "predicted is Inf, -Inf, a string, empty Or contains less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(!any(qtest(observed, "N>1(,)") == FALSE), msg = "observed is Inf, -Inf, a string, empty Or contains less less than 1 value or 1 value only. Please try again.")
# only process with finite values and provide a stop warning if not

assert_that(((length(predicted) != length(observed)) == FALSE), msg = "Check the length of the predicted and observed vectors since they don't match. Use a different set of values and then try again.")
# Source 1 / provide a stop warning if the length of the numeric vectors do not match


if (na.rm == TRUE) {

observed <- observed[!is.na(observed)]

predicted <- predicted[!is.na(predicted)]

n <- length(predicted)

error <- predicted - observed

sqrt((n ^ -1) * sum(abs(error) ^ 2, na.rm = na.rm))

} else {

n <- length(predicted)

error <- predicted - observed

sqrt((n ^ -1) * sum(abs(error) ^ 2, na.rm = na.rm))

}
}
