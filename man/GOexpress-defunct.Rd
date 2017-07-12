\name{GOexpress-defunct}
\alias{GOexpress-defunct}

\alias{GO_analyse}
\alias{cluster_GO}
\alias{expression_plot}
\alias{expression_plot_symbol}
\alias{expression_profiles}
\alias{expression_profiles_symbol}
\alias{heatmap_GO}
\alias{hist_scores}
\alias{list_genes}
\alias{overlap_GO}
\alias{plot_design}
\alias{pValue_GO}
\alias{quantiles_scores}
\alias{rerank}
\alias{subEset}
\alias{subset_scores}
\alias{table_genes}

\title{Defunct functions in package \sQuote{GOexpress}}

\description{
    These functions have been replaced by S4 versions to
    facilitate the support of data types, and no longer available..
}

\details{

    The following functions are defunct;
    please use the replacement indicated below, where applicable:
    \itemize{

        \item{\code{GO_analyse}:
        One of \code{\link[GOexpress:oneway.test]{oneway.test}} or
        \code{\link[GOexpress:randomForest]{randomForest}},
        followed by \code{\link{GOrank}}}

        \item{\code{cluster_GO}: No replacement yet}

        \item{\code{expression_plot}:
        Replaced by \code{\link[GOexpress:smoothFeature]{smoothFeature}}.
        }

        \item{\code{expression_plot_symbol}:
        Please use
        \code{\link[GOexpress:smoothFeature]{smoothFeature}}.
        }

        \item{\code{expression_profiles}: No replacement yet}

        \item{\code{expression_profiles_symbol}: No replacement yet}

        \item{\code{heatmap_GO}: No replacement yet}

        \item{\code{hist_scores}: No replacement yet}

        \item{\code{list_genes}: No replacement yet}

        \item{\code{plot_design}: No replacement yet}

        \item{\code{pValue_GO}: No replacement yet}

        \item{\code{quantiles_scores}: No replacement yet}

        \item{\code{rerank}: No replacement yet}

        \item{\code{subEset}:
        \code{\link[GOexpress:subset]{subset}}
        }

        \item{\code{subset_scores}: No replacement yet}

        \item{\code{table_genes}: No replacement yet}
    }

}
