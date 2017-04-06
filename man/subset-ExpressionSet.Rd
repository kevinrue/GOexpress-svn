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
AnGO \code{\linkS4class{ExpressionSet}} object.
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

exprFile <- system.file("extdata", "alvmac_exprs.csv", package = "GOexpress")
pdataFile <- system.file("extdata", "alvmac_pdata.csv", package = "GOexpress")
exprsCSV <- as.matrix(read.csv(exprFile, row.names = 1))
pdataCSV <- read.csv(pdataFile, row.names = 1)
eset <- ExpressionSet(
    exprsCSV,
    AnnotatedDataFrame(pdataCSV)
)
fData(eset)[,'dummy'] <- sample(LETTERS, nrow(eset), TRUE)

# Example ----

subset(eset, Time == '2H')
subset(eset, feature = (dummy < 'N'))
subset(eset, pheno = (Time == '2H'), feature = (dummy < 'N'))
}

\keyword{ GOexpress }
