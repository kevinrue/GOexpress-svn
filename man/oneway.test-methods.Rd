\name{oneway.test-methods}

\alias{oneway.test}
\alias{oneway.test,ExpressionSet,character-method}

\title{
Test for Equal Means of Expression in a One-Way Layout
}

\description{
Calls the \code{\link[stats:oneway.test]{oneway.test}} method
on each row of an \code{ExpressionSet},
taking the name of a column in the \code{phenoData} slot as grouping factor.
}

\usage{
\S4method{oneway.test}{ExpressionSet,character}(
    x, pheno, ..., p.adjust = "BH")
}

\arguments{
    \item{x}{
    An \code{\linkS4class{ExpressionSet}}.
    }
    \item{pheno}{
    The name of a column in the \code{phenoData} slot;
    used as the grouping factor for the analysis.
    }
    \item{\dots}{
    Additional arguments passed on to the
    \link[stats:oneway.test]{oneway.test} method.
    }
    \item{p.adjust}{
    correction method. Can be abbreviated.
    }
}

\value{
A \code{multiHtest} object that contains the output of
\link[stats:oneway.test]{oneway.test} post-processed
by the \link[broom:tidy]{tidy} method.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[stats:oneway.test]{oneway.test}},
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
}

\keyword{ GOexpress }
\keyword{ oneway.test }
