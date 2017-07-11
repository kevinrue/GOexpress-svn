\name{multiHtest-class}
\docType{class}

% Class
\alias{class:multiHtest}
\alias{multiHtest-class}

% Constructors/Methods:
\alias{multiHtest}
\alias{multiHtest-methods}
\alias{initialize,multiHtest-method}

% Accessor methods:

% Other methods / functions
\alias{head,multiHtest-method}
\alias{tail,multiHtest-method}

\title{multiHtest class objects}

\description{
The \code{multiHtest} class stores the output of
\link[stats:oneway.test]{oneway.test} post-processed
by the \link[broom:tidy]{tidy} method.
}

\section{Accessor methods}{
In the following code snippets \code{x} is a \code{GOMap} object.
\describe{
    \item{\code{head(x, n = 6L, ...)}, \code{tail(x, n = 6L, ...)}}{
    Return a \code{multiHtest} object with the \code{table} slot
    subsetted to the first or last \code{n} rows.
    }
}
}

\author{
Kevin Rue-Albrecht
}

\seealso{
\code{\link[GOexpress:oneway.test]{oneway.test}},
\code{\link[utils:head]{head}},
\code{\link[utils:head]{head}}.
}

\examples{
# Example data ----

data(Bt.logCPM)
data(Bt.pheno)

Bt.eset <- ExpressionSet(Bt.logCPM, AnnotatedDataFrame(Bt.pheno))

# Available phenoData columns
names(pData(Bt.eset))

# Test the first 10 features
ow <- oneway.test(Bt.eset[1:10,], "Infection")

head(ow, n = 3)
tail(ow, n = 3)
}

\keyword{ GOexpress }
\keyword{ head }
\keyword{ tail }

