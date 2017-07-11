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

data("Bt.GOMap")

data(Bt.logCPM)
data(Bt.pheno)

Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Preprocessing ----

# Test first 50 features
ow <- oneway.test(Bt.eset[1:50,], "Infection")
gr <- GOrank(ow, Bt.GOMap)

# Examples ----
gr
}
