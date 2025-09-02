# ie2misc 0.9.2 (2 September 2025)

* Received an e-mail issue from Kurt Hornik on 23 July 2025 regarding the check results issues for this package. Specifically, the use of Rd files with "\link{} targets missing package anchors in the 'Rd cross-references' check". Updated the madstat.Rd file to properly link to `data.table`. Also, there was an issue with the missing Authors@R field in the DESCRIPTION file. The DESCRIPTION file has been updated.
* Made revisions to the README file.
* Changed all library("package") calls to library(package) in all examples in the function files and README, as needed.



# ie2misc 0.9.1 (19 September 2023)

* Received an e-mail issue from Kurt Hornik on 19 August 2023 regarding the use of "@docType package" which is no longer valid. Replaced the ie2misc.R file with ie2misc-package.R to reflect the requested change.
* Added `spelling` to the Suggests
* Made slight revisions to the README


# ie2misc 0.9.0 (24 November 2022)

* Changed all import statements to importFrom statements after an issue was filed by Toby Dylan Hocking for my `iemisc` package about `data.table` and `zoo` conflicts
* Revised some of the function examples
* Revised URLs that were broken
* Now using the try function for examples that may possibly fail (source references are in the function source declarations)


# ie2misc 0.8.9 (1 March 2022)

* Replaced set.seed and rnorm from `stats` with set_n and r_norm from `rando` in the examples
* Added `rando` to the Suggests


# ie2misc 0.8.8 (21 January 2022)

* Removed the | file LICENSE statement from the DESCRIPTION file as it was not needed
* Received an e-mail stating that the calculated value from the vnse function does not match the calculated value from the equation provided in the reference. Revised the vnse function.
* Added `assertthat` and `checkmate` as Imported packages to simplify the internal testing of the package functions (previously if-else statements were used). Made revisions to all of the functions to use the newly imported packages.


# ie2misc 0.8.6 (April 2020)

* Changed maintainer electronic mail address
* Changed Web site domain to gitlab.com from github.com for the package, including issues
* Removed `Rcpp` as a Suggests package
* Removed `qdap` as an Imported package and replaced it with `mgsub` package (thanks to pull request filed by Tyler Rinker)
* Removed Rtools and system PATH for Microsoft Windows users
* Pull request from Michael Chirico to have `data.table` as Imports rather than Depends


# ie2misc 0.8.5

* Updated README.md with information on Rtools and system PATH for Microsoft Windows users
* Changed all documentation with inside.org to rdocumentation.org


# ie2misc 0.8.0

* Initial release
