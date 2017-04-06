\name{p.adjust-methods}

\alias{p.adjust}
\alias{p.adjust,multiHtest-method}

\title{
Wrapper around the \code{stats::p.adjust} function for \code{multiHtest}
objects.
}

\description{
Calls the \code{stats::p.adjust} method on a \code{multiHtest}.
}

\usage{
    \S4method{p.adjust}{multiHtest}(x, method = p.adjust.methods, ...)
}

\arguments{
    \item{x}{
    \code{multiHtest} object (produced by the
    \code{\link[GOexpress:oneway.test]{oneway.test}} method).
    }
    \item{method}{
    Correction method. Can be abbreviated.
    }
    \item{\dots}{
    Additional arguments passed on to the
    \link[stats:p.adjust]{p.adjust} method.
    }
}

\value{
Input \code{multiHtest} object with an additional column \code{p.adjust}
in the \code{table} slot.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[stats:p.adjust]{p.adjust}}.
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

ow <- oneway.test(eset, "Infection")
ow <- p.adjust(ow)
}

\keyword{ GOexpress }
\keyword{ p.adjust }
