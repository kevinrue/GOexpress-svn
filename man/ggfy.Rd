\name{ggfy}

\alias{ggfy}
\alias{ggfy,ExpressionSet-method}

\title{
Prepare a ggplot-able \code{data.frame} from expression data
}

\description{
Assemble expression level, feature and samples identifiers,
along with \code{phenoData} and \code{featurData} information
from an \code{ExpressionSet}
as a \code{data.frame} ready for use by \code{ggplot} functions.
}

\usage{
    \S4method{ggfy}{ExpressionSet}(
        eset, pheno = NULL, feature = NULL, assay = "exprs",
        suffixes = c(".pheno",".feature")
    )
}

\arguments{
    \item{eset}{
    An \code{\linkS4class{ExpressionSet}}.
    }
    \item{pheno,feature}{
    Names of columns in \code{pData(eset)} and \code{fData(eset)},
    respectively (as \code{character} vectors).

    If \code{pheno} and \code{feature} overlap, the relevant names
    \code{suffixes} are applied where relevant.
    }
    \item{assay}{
    Name of a matrix in \code{assayData(eset)}.
    The associated data will be stored in the column \code{y} of the
    output \code{data.frame}.
    }
    \item{suffixes}{
    A \code{character} vector of length 2 specifying the suffixes to be used
    for making unique the names of columns fetched from both
    \code{phenoData} and \code{featureData}.
    }
}

\value{
A \code{data.frame} object.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[ggplot2:ggplot]{ggplot}}
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

fData(eset)[,"dummy"] <- as.factor(
    sample(LETTERS, size = nrow(eset), replace = TRUE))

# Example ----

# First feature
gg.df <- ggfy(eset[1,], pheno = c("Time"), feature = "dummy")

# First two features, in a subset of samples
gg.df <- ggfy(
    subset(eset[1:2,], Time == "2H" & Infection == "CN"),
    pheno = c("Time", "Infection")
)

require(ggplot2)
ggplot(ggfy(
    eset[1:2,],
    pheno = c("Timepoint", "Infection", "Animal"),
    feature = c("dummy")
)) +
    geom_line(
        aes(Timepoint, exprs, colour = Infection, group = Infection),
        alpha = 0.5
    ) +
    facet_grid(feature ~ Animal)

ggplot(ggfy(
    eset[1:2,],
    pheno = c("Timepoint", "Infection", "Animal"),
    feature = c("dummy")
)) +
    geom_line(
        aes(Timepoint, exprs, colour = Infection, group = Infection),
        alpha = 0.5
    ) +
    facet_grid(Animal ~ feature)
}

\keyword{ GOexpress }
