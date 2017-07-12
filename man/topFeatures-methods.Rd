\name{topFeatures-methods}

\alias{topFeatures}
\alias{topFeatures,randomForest-method}
\alias{topFeatures,multiHtest-method}

\title{
Extract the most interesting features for supervised classification
}

\description{
For \code{randomForest}, returns the \code{importance} matrix, retyped
as a \code{data.frame}, and ordered by any one column in decreasing order
(default: \code{"MeanDecreaseGini"}).

For \code{randomForest}, returns the \code{importance} matrix ordered
by the \code{"statistic"} column in decreasing order.
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

    Not applicable for the following signatures:
    \code{"multiHtest"}.
    }
}

\value{
For \code{\link[randomForest:randomForest]{randomForest}} objects,
the \code{importance} matrix, retyped as a \code{data.frame},
and ordered by the selected decreasing value
(default: \code{"MeanDecreaseGini"}).

For \code{\link{multiHtest}} objects,
the \code{table} data-frame, ordered by decreasing \code{"statistic"} value.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[GOexpress:randomForest]{randomForest}},
    \code{\link[GOexpress:oneway.test]{oneway.test}}
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
rf <- randomForest(Bt.eset[1:20,], "Infection")

topFeatures(rf)
}

\keyword{ GOexpress }
\keyword{ topFeatures }
