\name{smoothFeature}

\alias{smoothFeature}
\alias{smoothFeature,ExpressionSet-method}

\title{
\code{geom_smooth} layer of expression data
}

\description{
Displays expression data using a \code{smooth_geom}.

The resulting \code{\link[ggplot2:ggplot]{ggplot}} object can be modified
with additional layers and \code{\link[ggplot2:theme]{theme}} elements.
}

\usage{
    \S4method{smoothFeature}{ExpressionSet}(
        eset, x, group = NULL, ...,
        assay = "exprs", alpha = GeomSmooth$default_aes$alpha,
        scales = "fixed"
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
    \item{group}{
        \emph{(Optional)} Name of a column in \code{pData(eset)}.
        The associated data will be stored in the column \code{group} of the
        output \code{data.frame}.

        Aesthetic \code{aes(fill, colour)} are matched to \code{group}.
    }
    \item{\dots}{
        Additional arguments passed to \code{geom_smooth}.
    }
    \item{assay}{
        Name of a matrix in \code{assayData(eset)}.
        The associated data will be stored in the column \code{y} of the
        output \code{data.frame}.
    }
    \item{alpha}{
        Controls transparency of \code{geom_smooth} layer.
        Default to the value of \code{ggplot2::GeomSmooth$default_aes$alpha}.
    }
    \item{scales}{
        When multiple features are plotted in separate facets,
        controls whether scales be fixed (\code{"fixed"}, the default),
        free (\code{"free"}),
        or free in one dimension (\code{"free_x"}, \code{"free_y"}).
    }
}

\value{
A \code{ggplot} object.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    \code{\link[ggplot2:ggplot]{ggplot}},
    \code{\link{ggPheno}}.
}

\details{
If multiple feature identifiers are requested, they are displayed as
\code{\link[ggplot2:facet_wrap]{facet_wrap}}.
See \code{\link{ggPheno}} for examples to display them
as \code{\link[ggplot2:facet_grid]{facet_grid}}.
}

\examples{
# Example data ----

data(Bt.logCPM)
data(Bt.pheno)

Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Example ----

require(ggplot2)
smoothFeature(
    Bt.eset[1,],
    x = "Timepoint", group = "Infection",
    level = 0.5 # geom_smooth(level = ...)
) + theme_minimal()

smoothFeature(
    Bt.eset[1:2,],
    x = "Timepoint", group = "Infection", alpha = 0.3
)

smoothFeature(
    Bt.eset[1:2,],
    x = "Timepoint", group = "Infection",
    nrow = 1, scales = "free_y", alpha = 0.2
) + geom_point(
        aes(Timepoint, exprs, colour = Infection),
        position = position_dodge(width = 2)
    ) +
    theme_bw()
}

\keyword{ GOexpress }
