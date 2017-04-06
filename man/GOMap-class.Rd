\name{GOMap-class}
\docType{class}

% Class
\alias{class:GOMap}
\alias{GOMap-class}

% Constructors/Methods:
\alias{GOMap}
\alias{GOMap-methods}
\alias{initialize,GOMap-method}

% Accessor methods:

% Other methods / functions
\alias{nrow,GOMap-method}

\title{GOMap class objects}

\description{
The \code{GOMap} class stores mapping between Gene Ontology categories
and arbitrary features (\emph{e.g.}, genes, proteins).
}

\usage{
GOMap(table, source = NA_character_)
}

\section{Accessor methods}{
In the following code snippets \code{x} is a \code{GOMap} object.
\describe{
    \item{\code{table(x)}, \code{table(x) <- value}}{
    Gets or sets the \code{data.frame} that maps Gene Ontology categories
    to arbitrary features.
    }
    \item{\code{nrow(x)}}{
    Number of annotations between Gene Ontology categories and features.
    }
}
}

\arguments{
    \item{table}{
    A 2-column \code{data.frame} that maps Gene Ontology categories
    to arbitrary features. First column must be GO category identifiers;
    second column must be feature identifiers present in
    the expression data set.
    }
    \item{source}{
    Currently, a free-form \code{character} vector where users may store
    information about the source of the mapping table
    (\emph{e.g.},
    \code{c("biomaRt", "hsapiens_gene_ensembl", "feb2014.archive.ensembl.org")}
    ).
    }
}

\value{
A \code{GOMap} object that that maps Gene Ontology categories
to arbitrary features.
}

\author{
Kevin Rue-Albrecht
}

\seealso{
\code{\link[biomaRt:getBM]{getBM}}.
}

\examples{
# Constructors ----

df <- data.frame(paste0("GO:000", 1:9), sample(LETTERS[1:2], 9, TRUE))

gm <- GOMap(df, "dummy")

# Accessors ----

nrow(gm)
}

\keyword{ GOexpress }
\keyword{ GOMap }
