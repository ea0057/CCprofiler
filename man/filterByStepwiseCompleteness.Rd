% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/featureMethods.R
\name{filterByStepwiseCompleteness}
\alias{filterByStepwiseCompleteness}
\title{Filter co-elution feature table by stepwise completeness cutoffs}
\usage{
filterByStepwiseCompleteness(feature_table, min_subunits_annotated = 4,
  completeness_vector = c(0.75, 0.5), level = "hypothesis")
}
\arguments{
\item{feature_table}{data.table as reported by \code{\link[SECprofiler]{findComplexFeatures}}
or \code{\link[SECprofiler]{findProteinFeatures}}.}

\item{min_subunits_annotated}{Integer specifying the number of annotated hypothesis components (peptides / proteins).
This is the cutoff for using the two different completeness cutoffs as provided by the \code{completeness_vector}. Default is \code{4}.}

\item{completeness_vector}{Numeric vector of length 2. The first value is the completeness cutoff apllied to all hypotheses
with <= \code{min_subunits_annotated} subunits and the secind value is applied to all hypotheses
with more than \code{min_subunits_annotated} subunits. Default is \code{c(0.75,0.5)}}

\item{level}{Character string defining level of filterng, allowed values are "feature" or "hypothesis".
"feature" filters all features by their completeness. "hypothesis" filters by the completeness of the
of the largest feature within one hypothesis. Default is "hypothesis".}
}
\value{
The same feture table as teh input, but filtered according to the provided parameters.
}
\description{
Filter co-elution feature table by two consecutive completeness cutoffs
to treat small and large complexes differenetly.
}
\examples{
## Load example complex feature finding results:
complexFeatures <- exampleComplexFeatures
## Run summary function:
summarizeFeatures(complexFeatures)
## Filter complex features by a subunit cutoff of 4 and the completness cutoffs
## 0.75 for hypotheses <= 4 subunits and 0.5 for hypotheses with > 4 annotated subunits.
filteredComplexFeatures <- filterByStepwiseCompleteness(feature_table=complexFeatures,
                                          min_subunits_annotated=4,
                                          completeness_vector=c(0.75,0.5),
                                          level="hypothesis")
## Run summary function on filtered data:
summarizeFeatures(filteredComplexFeatures)
}
