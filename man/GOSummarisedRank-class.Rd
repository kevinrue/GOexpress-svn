\name{GOSummarisedRank-class}
\docType{class}

% Class
\alias{GOSummarisedRank}
\alias{class:GOSummarisedRank}
\alias{GOSummarisedRank-class}

\title{GOSummarisedRank class objects}

\description{
The \code{GOSummarisedRank} class stores the summarised rank of features
associated with GO categories.
}

\author{
Kevin Rue-Albrecht
}

\seealso{
    \code{\link{GOrank}}.
}

\examples{
# Example data ----

exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")
exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)

data("Bt.GOMap")

# Preprocessing ----

ow <- oneway.test(eset, "Treatment")
gr <- GOrank(ow, Bt.GOMap)

# Examples ----
gr
}
