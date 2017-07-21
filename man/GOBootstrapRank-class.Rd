\name{GOBootstrapRank-class}
\docType{class}

% Class
\alias{GOBootstrapRank}
\alias{class:GOBootstrapRank}
\alias{GOBootstrapRank-class}

\title{GOBootstrapRank class objects}

\description{
The \code{GOBootstrapRank} class stores the summarised rank
and estimated \emph{P}-value
computed from the features associated with GO categories.
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
bootstrap.p.value(gr, n = 1)
}
