\name{bootstrap.p.value}

\alias{bootstrap.p.value}
\alias{bootstrap.p.value,GOSummarisedRank-method}

\title{
Estimate random chance of previously computed GO ranks
}

\description{
Assign to each Gene Ontology (GO) category a
permutation-based \emph{P}-value that estimates
the chance to reach their computed rank by chance.

This method permutes \code{n} times the previously computed rank of features
and recomputes the resulting summary rank of each associated GO category.
The \emph{P}-value indicates the proportion of permutations where the GO
category ranked \emph{better} than the original data set.
}

\usage{
\S4method{bootstrap.p.value}{GOSummarisedRank}(x, n = 1E3, ...)
}

\arguments{
    \item{x}{
    Object of one of any supported classes:
    \code{\linkS4class{GOSummarisedRank}}.
    }
    \item{n}{
    The number of permutations to perform.
    }
    \item{\dots}{
    Additional arguments passed to \code{GOrank}.
    }
}

\value{
A \code{\linkS4class{GOBootstrapRank}} object that contains the
\emph{P}-value and number of permutations performed.
}

\details{
This function is relatively time-consuming.

Its procedure can be divided in several
steps:

\enumerate{
    \item Assemble a copy of all genes used in the original scoring step.
    \item For each of the N permutations,
    \enumerate{
    \item permute the gene labels,
    \item calls \code{GOrank} to estimate the randomise GO rank,
    \item identifies whether the randomised rank is better (lower) than the
        original data.
    }
    \item return a \emph{P}-value as the proportion of permutations where
        each GO term ranked better (lower) than the original data.
}
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[GOexpress:GOrank]{GOrank}},
    \code{\link[GOexpress:GOBootstrapRank]{GOBootstrapRank}},
    \code{\link[GOexpress:GOSummarisedRank]{GOSummarisedRank}}.
}

\examples{
# Example data ----

data("Bt.GOMap")
data(Bt.logCPM)
data(Bt.pheno)

Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Preprocessing ----

# Test the first 50 features
ow <- oneway.test(Bt.eset[1:50,], "Infection")
gr <- GOrank(ow, Bt.GOMap)

# Example ----

\dontrun{
bootstrap.p.value(gr, n = 100)
}
}

\keyword{ GOexpress }
