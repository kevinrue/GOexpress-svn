\name{GOrank}

\alias{GOrank}
\alias{GOrank,multiHtest,GOMap-method}
\alias{GOrank,randomForest,GOMap-method}

\title{
Average rank of features associated with GO categories
}

\description{
Assign to each Gene Ontology category the average rank of all
associated features.
}

\usage{
    \S4method{GOrank}{multiHtest,GOMap}(x, map, ...)
    \S4method{GOrank}{randomForest,GOMap}(x, map, ...)
}

\arguments{
    \item{x}{
    Object of one of any supported classes:
    \code{\linkS4class{multiHtest}},
    \code{\link[randomForest:randomForest]{randomForest}}.
    }
    \item{map}{
    \code{GOMap} object.
    }
    \item{\dots}{
    Additional arguments passed to and from other methods.
    }
}

\value{
A \code{\linkS4class{GOSummarisedRank}} object that contains the average rank
of each Gene Ontology category.
}

\details{
    The average rank strongly favor GO terms associated with
    fewer genes at the top of the ranking. This bias may actually be seen as
    a valuable feature which enables the user to browse through GO terms of
    increasing "granularity", \emph{i.e.} associated with increasingly
    large sets of genes,
    although consequently being increasingly vague and blurry (\emph{i.e.}
    "protein binding" molecular function associated with over 6,000 genes).
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[GOexpress:oneway.test]{oneway.test}},
    \code{\link[randomForest:randomForest]{randomForest}},
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

# Example ----

GOrank(ow, Bt.GOMap)
}

\keyword{ GOexpress }
