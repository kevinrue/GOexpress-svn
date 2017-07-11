\name{topFeatures-methods}

\alias{topFeatures}
\alias{topFeatures,randomForest-method}

\title{
Extract the most interesting features for supervised classification
}

\description{
For \code{randomForest}, returns the \code{importance} matrix ordered
by any one column (default: \code{"MeanDecreaseGini"}).
}

\usage{
    \S4method{topFeatures}{randomForest}(
        x, n = 6L, value = "MeanDecreaseGini")
}

\arguments{
    \item{x}{
    an object among the following classes:
    \code{\link[randomForest:randomForest]{randomForest}}.
    }
    \item{n}{
    a single integer; , number of rows to return.
    }
    \item{value}{
    For \code{\link[randomForest:randomForest]{randomForest}} objects:
    name of a column in \code{importance(x)}.
    }
}

\value{
For \code{\link[randomForest:randomForest]{randomForest}} objects,
the \code{importance} matrix, ordered by the selected decreasing value
(default: \code{"MeanDecreaseGini"}).
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[randomForest:importance]{importance}}.
}

\examples{
# Example data ----

data(Bt.logCPM)
data(Bt.pheno)

Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Available phenoData columns
names(pData(Bt.eset))

# Test the first 20 features
rf <- topFeatures(Bt.eset[1:20,], "Infection")
plot(rf)
}

\keyword{ GOexpress }
\keyword{ topFeatures }
