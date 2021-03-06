% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rocSibPepCorr.R
\name{rocSibPepCorr}
\alias{rocSibPepCorr}
\title{ROC.SibPepCorr}
\usage{
rocSibPepCorr(traces, fdr_type = "protein", FFT = 1,
  stepsize = 0.001, plot = TRUE, PDF = FALSE, CSV = FALSE,
  name = "SibPepCorr_ROC")
}
\arguments{
\item{traces}{An object of type \code{traces.obj}.}

\item{FFT}{Numeric specifying the fraction of false targets (FFT). Default is 1.}

\item{stepsize}{Numeric specifying the number of steps for calculating ROC characteristics. Default is 0.001.}

\item{plot}{Logical, whether to generate a plot. Default is \code{TRUE}.}

\item{PDF}{Logical, whether to save plot as PDF. Default is \code{FALSE}.}

\item{CSV}{Logical, whether to save ROC characteristics in a CSV file. Default is \code{FALSE}.}

\item{name}{Character string with the name of the saved PDF or CSV file.
Only used if PDF or CSV is set to \code{TRUE}. Default is "SibPepCorr_ROC".}
}
\value{
A data.table containing ROC characteristics.
}
\description{
Calculate ROC characteristics based on sibling peptide correlation.
}
\examples{
# Load example data
tracesRaw <- examplePeptideTraces
## Calculate the sibPepCorr
tracesRawSpc <- calculateSibPepCorr(traces = tracesRaw,
                                      plot = TRUE)
## Calculate protein FDR at different correllation cutoffs
fdrTable <- rocSibPepCorr(traces = tracesRawSpc,
                          plot = TRUE,
                          fdr_type = "protein")

head(fdrTable)
}
