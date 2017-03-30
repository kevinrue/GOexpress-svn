\name{Bt.GOMap.ex}

\alias{Bt.GOMap}

\docType{data}

\title{
\code{GOMap} object assembled from Ensembl Biomart.
}

\description{
An example \code{GOMap} that maps Ensembl gene identifiers to gene
ontology identifiers, compatible with the example
\code{ExpressionSet} supplied in this package.
}

\usage{
data(Bt.GOMap)
}

\value{
\code{GOMap} object with two slots:
\describe{
    \item{table}{\code{data.frame} that maps GO identifiers to Ensembl gene
    identifiers.
    }
    \item{source}{\code{character} vector that describes the source of the
    \code{table} slot.
    }
}
}

\details{
The \code{\link[biomaRt:getBM]{getBM}} function was used to query
the \code{"feb2014.archive.ensembl.org"} archive of the Ensembl BioMart,
to retrieve mappings between \code{"go_id"} and \code{"ensembl_gene_id"}.
}

\source{
\url{http://feb2014.archive.ensembl.org}
}

\examples{
# Load the data
data(Bt.GOMap)

# Display
GOMap

# Dimensions (rows, columns)
dim(Bt.GOMap@table)
}

\keyword{datasets}
\keyword{GOexpress}
