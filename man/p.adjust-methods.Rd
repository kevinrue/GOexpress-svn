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

data(Bt.logCPM)
data(Bt.pheno)

Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Available phenoData columns
names(pData(Bt.eset))

# Test the first 10 features
ow <- oneway.test(Bt.eset[1:10,], "Infection")

ow <- p.adjust(ow)
}

\keyword{ GOexpress }
\keyword{ p.adjust }
