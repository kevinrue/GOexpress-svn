\name{randomForest-methods}

\alias{randomForest}
\alias{randomForest,ExpressionSet,factor-method}
\alias{randomForest,ExpressionSet,character-method}

\title{
Wrapper around the \code{randomForest} package for \code{ExpressionSet}.
}

\description{
Calls the \code{randomForest::randomForest} method on an \code{ExpressionSet}
taking either a \code{factor} or the name of a \code{phenoData} field to
drive the supervised learning.
}

\usage{
    \S4method{randomForest}{ExpressionSet,factor}(
        x, pheno, ..., do.trace = 100)
    \S4method{randomForest}{ExpressionSet,character}(
        x, pheno, ..., do.trace = 100)
}

\arguments{
    \item{x}{
    An \code{\linkS4class{ExpressionSet}}.
    }
    \item{pheno}{
    Either the name of a column in the \code{phenoData} slot,
    or a \code{factor} vector of length equal to the number of samples
    used as the grouping factor for the analysis.
    }
    \item{\dots}{
    Additional arguments passed on to the
    \link[randomForest:randomForest]{randomForest} method.
    }
    \item{do.trace}{
    Argument to the \link[randomForest:randomForest]{randomForest} method.
    }
}

\value{
The output of the \link[randomForest:randomForest]{randomForest} method.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[randomForest:randomForest]{randomForest}}.
}

\examples{
# Example data ----

# Example ExpressionSet
exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")

exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)

# Available phenoData columns
names(pData(eset))

rf <- randomForest(eset, "Infection")
plot(rf)
}

\keyword{ GOexpress }
\keyword{ randomForest }
