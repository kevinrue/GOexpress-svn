\name{head-methods}

\alias{head,multiHtest-method}
\alias{tail,multiHtest-method}

\title{
Return the First or Last Part of an multiHtest object
}

\description{
Wrapper around the \code{utils::head} and \code{utils::tail} methods.
}

\usage{
    \S4method{head}{multiHtest}(
        x, n, ...)
    \S4method{tail}{multiHtest}(
        x, n, ...)
}

\arguments{
    \item{x}{
    An object. Currently supported: \code{multiHtest}.
    }
    \item{n}{
    A single integer. If positive, size for the resulting object: number of
    elements for a vector (including lists), rows for a matrix or data frame or
    lines for a function. If negative, all but the n last/first number of
    elements of x.
    }
    \item{\dots}{
    Additional arguments passed on to the
    \link[utils:head]{head} or \link[utils:head]{head} method.
    }
}

\value{
An object (usually) like \code{x} but generally smaller.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[utils:head]{head}} and \code{\link[utils:head]{head}}
    functions.
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

ow <- oneway.test(eset, "Treatment")

head(ow, n = 3)
tail(ow, n = 3)
}

\keyword{ GOexpress }
\keyword{ head }
