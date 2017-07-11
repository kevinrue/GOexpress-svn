\name{ggPheno}

\alias{ggPheno}
\alias{ggPheno,ExpressionSet-method}

\title{
Prepare a ggplot-able \code{data.frame} from expression data
}

\description{
Assemble expression level, feature and samples identifiers,
along with \code{phenoData} information from an \code{ExpressionSet}
as a \code{data.frame} ready for use by \code{ggplot} functions.
}

\usage{
    \S4method{ggPheno}{ExpressionSet}(
        eset,
        x = NULL, assay = "exprs", group = NULL,
        colour = NULL, shape = NULL, fill = NULL, facet = NULL
    )
}

\arguments{
    \item{eset}{
    An \code{\linkS4class{ExpressionSet}}.
    }
    \item{x}{
    Name of a column in \code{pData(eset)}.
    The associated data will be stored in the column \code{x} of the
    output \code{data.frame}.
    }
    \item{assay}{
    Name of a matrix in \code{assayData(eset)}.
    The associated data will be stored in the column \code{y} of the
    output \code{data.frame}.
    }
    \item{group}{
    Name of a column in \code{pData(eset)}.
    The associated data will be stored in the column \code{group} of the
    output \code{data.frame}.
    }
    \item{colour}{
    Name of a column in \code{pData(eset)}.
    The associated data will be stored in the column \code{colour} of the
    output \code{data.frame}.
    }
    \item{shape}{
    Name of a column in \code{pData(eset)}.
    The associated data will be stored in the column \code{shape} of the
    output \code{data.frame}.
    }
    \item{fill}{
    Name of a column in \code{pData(eset)}.
    The associated data will be stored in the column \code{fill} of the
    output \code{data.frame}.
    }
    \item{facet}{
    Name of a column in \code{pData(eset)}.
    The associated data will be stored in the column \code{facet} of the
    output \code{data.frame}.
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

# Example ----

# First feature
gg.df <- ggPheno(eset[1,])

# First two features, in a subset of samples
gg.df <- ggPheno(
    subset(eset[1:2,], Time == "2H" & Infection == "CN"),
    x = "Time",
    colour = "Infection"
)

require(ggplot2)
ggplot(
    ggPheno(
        eset[1:2,],
        x = "Timepoint",
        facet = "Infection"
    )
) + facet_grid(feature ~ Infection, scales = "free_y") +
    geom_smooth(aes(Timepoint, exprs, fill = Infection, colour = Infection)) +
    theme_bw()
}

\keyword{ GOexpress }
