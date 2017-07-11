\name{subset-ExpressionSet}

\alias{subset-methods}
\alias{subset}
\alias{subset,ExpressionSet-method}

\title{
Subsetting ExpressionSet objects
}

\description{
An implementation of the
\code{\link[BiocGenerics:subset]{subset}} method
for \code{ExpressionSet} objects.
}

\usage{
    \S4method{subset}{ExpressionSet}(x, pheno, feature, ...)
}

\arguments{
    \item{x}{
    An \code{\linkS4class{ExpressionSet}}.
    }
    \item{pheno}{
    logical expression applied to the \code{phenoData} slot of \code{x}
    indicating samples to keep.
    }
    \item{feature}{
    logical expression applied to the \code{featureData} slot of \code{x}
    indicating features to keep.
    }
    \item{\dots}{
    further arguments to be passed to or from other methods.
    }
}

\value{
A new, subsetted, \code{\linkS4class{ExpressionSet}} object.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\linkS4class{ExpressionSet}},
    \code{\link[BiocGenerics:subset]{subset}}.
}

\examples{
# Example data ----

data(Bt.logCPM)
data(Bt.pheno)

Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

fData(Bt.eset)[,'dummy'] <- sample(LETTERS, nrow(Bt.eset), TRUE)

# Example ----

subset(Bt.eset, Timepoint == '2H')

subset(Bt.eset, feature = (dummy < 'N'))

subset(
    Bt.eset,
    pheno = (Timepoint == '2H' & Infection != 'CN'),
    feature = (dummy > 'E' & dummy < 'N')
)
}

\keyword{ GOexpress }
