% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expFileOutput.R
\encoding{UTF-8}
\name{expFileOutput}
\alias{expFileOutput}
\alias{expFileOutputBATCH}
\title{expFileOutput and expFileOutputBATCH}
\source{
\enumerate{
   \item r - How can I check if a file is empty? - Stack Overflow answered by Konrad Rudolph and edited by Geekuna Matata on Apr 23 2014. See \url{https://stackoverflow.com/questions/23254002/how-can-i-check-if-a-file-is-empty}.
   \item r - Better error message for stopifnot? - Stack Overflow answered by Andrie on Dec 1 2011. See \url{https://stackoverflow.com/questions/8343509/better-error-message-for-stopifnot}.
   \item RDocumentation: TclInterface {tcltk}. See \url{https://www.rdocumentation.org/packages/tcltk/versions/3.3.1}.
   \item James Wettenhall & Philippe Grosjean, File Open/Save dialogs in R tcltk, December 01, 2015. See \url{https://web.archive.org/web/20160521051207/http://www.sciviews.org/recipes/tcltk/TclTk-file-open-save-dialogs/}. Retrieved thanks to the Internet Archive: Wayback Machine
   \item r - read csv files and perform function, then bind together - Stack Overflow answered by bjoseph on Jan 8 2015. See \url{https://stackoverflow.com/questions/27846715/read-csv-files-and-perform-function-then-bind-together}.
   \item r - Convert column classes in data.table - Stack Overflow answered by Matt Dowle on Dec 27 2013. See \url{https://stackoverflow.com/questions/7813578/convert-column-classes-in-data-table}.
   \item r - Transpose rows to columns and remove only NAs in resulting columns - Stack Overflow answered by David Arenburg on April 22, 2014. See \url{https://stackoverflow.com/questions/23225977/transpose-rows-to-columns-and-remove-only-nas-in-resulting-columns}.
   \item r - Add a Column to a Dataframe From a List of Values - Stack Overflow answered by Matthew Plourde on Jun 21 2012. See \url{https://stackoverflow.com/questions/11130037/add-a-column-to-a-dataframe-from-a-list-of-values/11130178}.
   \item r - Why does is.vector() return TRUE for list? - Stack Overflow answered by Andrie on May 17 2011. See \url{https://stackoverflow.com/questions/6032772/why-does-is-vector-return-true-for-list/6032909}.
   \item warnings - How do I get rid of the NOTE's generated by R CMD check when using for example ddply in my package? - Stack Overflow answered by shadow on Mar 4 2015 and edited by shadow on Mar 5 2015. See \url{https://stackoverflow.com/questions/28851812/how-do-i-get-rid-of-the-notes-generated-by-r-cmd-check-when-using-for-example-d}.
   \item multiple output filenames in R - Stack Overflow asked and edited by Gabelins on Feb 1 2013. See \url{https://stackoverflow.com/questions/14651594/multiple-output-filenames-in-r}.
   \item r - Regex return file name, remove path and file extension - Stack Overflow answered and edited by Ananda Mahto on Feb 25 20134. See \url{https://stackoverflow.com/questions/15073753/regex-return-file-name-remove-path-and-file-extension/15073919}.
}
}
\usage{
expFileOutput(
  file = tk_choose.files(default = "", caption =
    "Select file(s) to open & hold down Ctrl to choose more than 1 file", multi = TRUE,
    filters = matrix(c("Text file", ".exp", "Text file", ".EXP"), 4, 2, byrow = TRUE)),
  output = c("csv", "xlsx", "both"),
  overwrite = TRUE
)

expFileOutputBATCH(
  path = tk_choose.dir(caption = "Select the directory with the .exp files"),
  output = c("csv", "xlsx", "both"),
  overwrite = TRUE
)
}
\arguments{
\item{file}{Input .exp file(s), using a file dialog, to obtain 1) the
goodness-of-fit and trend results & 2) the exceedance probability values.}

\item{output}{The exported format for each set of results (options are .csv,
.xlsx, and both file types).}

\item{overwrite}{logical vector that determines whether the existing
should be overwritten or not.}

\item{path}{Directory path of .exp files, to be selected through a directory
dialog, to obtain 1) the goodness-of-fit and trend results & 2) the
exceedance probability values. The user will be asked where to find the
.exp files & then the user will be asked where to save the results files.}
}
\value{
.csv, .xlsx, or both file types with 1) the goodness-of-fit and
  trend results & 2) the exceedance probability values for individual sites
  in separate files. Currently, in the BATCH mode, all stations in the given
  directory are combined in a single data.frame with both 1) and 2).
}
\description{
expFileOutput and expFileOutputBATCH process raw .exp files generated by the
USGS PeakFQ program (\url{http://water.usgs.gov/software/PeakFQ/}). The .exp
output file from running PeakFQ is a shortened version of the longer
narrative .prt file, more suitable for tabulating the model results than the
.prt file; however, the information must be changed to a fixed field format.
}
\details{
expFileOutput converts the user-selected .exp file to 1) a tab-delimited
.csv file for a single station with the goodness-of-fit and trend results
(all station information exists in a single row) and 2) a tab-delimited .csv
file for a single station with the exceedance probability values on each row.
For the .xlsx file, tab 1 contains the goodness-of-fit and trend results and
tab 2 contains the exceedance probability values.

expFileOutputBATCH converts the user-selected directory of .exp files into
1) a tab-delimited .csv file as a single table, with one record for each
station, with the goodness-of-fit and trend results and 2) a tab-delimited
.csv file as a single table, with a set of records for each station, with the
exceedance probability values on each row. For the .xlsx file, tab 1
contains the goodness-of-fit and trend results and tab 2 contains the
exceedance probability values.

In the Examples section, there is R code for the user to view the example
  .exp file.
}
\examples{

\dontrun{
# Example to check the input file format
library("ie2misc")

# Copy and paste the following code into the R console if you
# wish to see the .exp input file format.
# Note the number of lines and the row headings.
file.show(system.file("extdata", "01110000_PEAK_WATSTORE.EXP",
  package = "ie2misc"), title = paste("01110000_PEAK_WATSTORE.EXP"))
# opens the .exp file using the default text editor or within RStudio


# Examples to show you different output cases
expFileOutput(output = "csv") # returns .csv files
# Follow the file dialog instructions

expFileOutput(output = "xlsx") # returns .xlsx files
# Follow the file dialog instructions

expFileOutput(output = "both") # returns .csv and .xlsx files
# Follow the file dialog instructions




# Examples to show you different output cases (BATCH)
expFileOutputBATCH(output = "csv") # returns .csv files
# Follow the file dialog instructions

expFileOutputBATCH(output = "xlsx") # returns .xlsx files
# Follow the file dialog instructions

expFileOutputBATCH(output = "both") # returns .csv and .xlsx files
# Follow the file dialog instructions
}

}
\author{
Irucka Embry, Anne Hoos
}
