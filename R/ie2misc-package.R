#' ie2misc: Irucka Embry's miscellaneous USGS functions
#'
#' ie2misc provides many functions that will be useful to people within the
#'  USGS, while other functions will be useful for others. Functions are
#'  included for statistical errors (RMSE, NSE, dr, MAPE, MAE, MAD),
#'  processing .exp and .psf files, a "+" dyadic operator for use with NA,
#'  and making it easier to view USGS ADAPS and QW files within a spreadsheet
#'  application.
#'
#'
#' @importFrom lubridate guess_formats ymd dmy mdy ymd_hm dmy_hm mdy_hm ymd_hms dmy_hms mdy_hms
#' @importFrom readxl read_excel excel_sheets
#' @importFrom mgsub mgsub
#' @importFrom reader get.delim
#' @importFrom stringi stri_trim_both stri_trans_toupper stri_detect_fixed stri_replace_all_fixed
#' @importFrom data.table data.table copy setDT setcolorder set setnames rbindlist fread is.data.table ":="
#' @importFrom openxlsx createWorkbook addWorksheet writeData setColWidths saveWorkbook writeDataTable
#' @importFrom tcltk tk_choose.files tclvalue tkgetSaveFile tk_choose.dir
#' @importFrom gWidgets2 gconfirm guiToolkit
#' @importFrom utils read.table write.csv
#' @importFrom tools file_path_sans_ext
#' @importFrom assertthat assert_that
#' @importFrom checkmate testFileExists qtest testScalarNA
#'
#'

#' @docType package
#' @name ie2misc
#' @keywords internal 
"_PACKAGE"

NULL
