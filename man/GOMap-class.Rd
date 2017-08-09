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
\alias{GOMap.biomart}
\alias{nrow,GOMap-method}
\alias{subset,GOMap-method}

\title{GOMap class objects}

\description{
The \code{GOMap} class stores mapping between Gene Ontology categories
and arbitrary features (\emph{e.g.}, genes, proteins).

The \code{GOMap.biomart} function builds a \code{GOMap} object from
the Ensembl BioMart.
}

\usage{
GOMap(table, source = NA_character_)

GOMap.biomart(
    dataset, feature = "ensembl_gene_id", ..., go = "go_id",
    host = "www.ensembl.org", biomart = "ENSEMBL_MART_ENSEMBL"
)
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

\section{Subsetting}{
In the following code snippets \code{x} is a \code{GOMap} object.
\describe{
    \item{}{
    \code{subset(x, go, feature)}:
    Return a new \code{GOMap} object using:
    \describe{
        \item{go}{character vector of category identifier(s)}
        \item{feature}{character vector of feature identifier(s)}
      }
    Typically, only one of \code{go} or \code{feature} would be used.
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
    \item{dataset}{
    Dataset of the Ensembl Biomart to access.
    See \link[biomaRt:useMart]{useMart}
    }
    \item{feature}{
    Feature identifier to retrieve. See \link[biomaRt:getBM]{getBM}
    }
    \item{\dots}{
    Additional arguments passed to \code{useMart}.
    }
    \item{go}{
    Name of the GO category field to retrieve from the Ensembl BioMart.
    See \link[biomaRt:getBM]{getBM}
    }
    \item{host}{
    Ensembl BioMart host to connect to.
    See \link[biomaRt:useMart]{useMart}
    }
    \item{biomart}{
    Ensembl BioMart database to connect to.
    See \link[biomaRt:useMart]{useMart}
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
\code{\link[biomaRt:getBM]{getBM}},
\code{\link[biomaRt:useMart]{useMart}}.
}

\examples{
# Constructors ----

df <- data.frame(paste0("GO:000", 1:9), sample(LETTERS[1:2], 9, TRUE))

gm <- GOMap(df, "dummy")

\dontrun{
GOMap.biomart("btaurus_gene_ensembl", host = "feb2014.archive.ensembl.org")
}

# Accessors ----

nrow(gm)

# Subsetting ----

subset(gm, go = c("GO:0001", "GO:0002"))
}

\keyword{ GOexpress }
\keyword{ GOMap }
