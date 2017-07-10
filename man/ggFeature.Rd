\name{ggFeature}

\alias{ggFeature}
\alias{ggFeature,ExpressionSet-method}

\title{
Prepare a ggplot-able \code{data.frame} from expression data
}

\description{
Assemble expression level, feature and samples identifiers in a
\code{data.frame} ready for use by \code{ggplot} functions.
}

\usage{
    \S4method{ggFeature}{ExpressionSet}(
        eset, feature,
        x = NULL, assay = "exprs", group = NULL,
        colour = NULL, shape = NULL, fill = NULL, facet = NULL
    )
}

\arguments{
    \item{eset}{
    An \code{\linkS4class{ExpressionSet}}.
    }
    \item{feature}{
    A \code{character} vector of feature identifiers present in
    \code{featureNames(eset)}.

    Multiple features can be given (\emph{e.g.}, for later faceting).
    In that case, the \code{assay} matrix is
    \code{\link[reshape2:melt]{melted}} and stored in columns
    \code{feature}, \code{sample}, and \code{y}
    of the output \code{data.frame}.
    See \code{assay} below for more information.
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

geneId <- head(featureNames(eset), 1)
geneIds <- head(featureNames(eset), 2)

gg.df <- ggFeature(eset, feature = geneId)

gg.df <- ggFeature(
    subset(eset, Time == "2H" & Infection == "CN"),
    feature = geneIds,
    x = "Time", colour = "Infection"
)

require(ggplot2)
ggplot(
    ggFeature(
        eset, geneIds,
        x = "Timepoint",
        facet = "Infection"
    )
) + facet_grid(feature ~ facet, scales = "free_y") +
    geom_smooth(aes(x, y, fill = facet, colour = facet)) +
    labs(
        x = "Timepoint",
        y = "exprs",
        fill = "Infection", colour = "Infection"
    ) +
    theme_bw()
}

\keyword{ GOexpress }
