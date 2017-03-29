\name{listMethods}

\alias{listMethods}
\alias{listMethods,ExpressionSet,factor-method}
\alias{listMethods,ExpressionSet,character-method}

\title{
Display a \code{data.frame} of upstream methods supported by
\code{GOexpress::GOllapse}.
}

\description{
Display the \code{name}, \code{package}, and \code{type} of functions
that are supported upstream of the (upcoming) \code{GOexpress::GOllapse}
method.
}

\usage{
listMethods(type = NULL)
}

\arguments{
    \item{type}{
    Subset the output \code{data.frame} to display only functions
    in this \code{character} vector of types. Current choices:
    \code{"Parametric"}, \code{"Machine learning"}.
    }
}

\value{
\code{data.frame} including \code{name}, \code{package}, and \code{type}
of functions that are supported upstream of the
(upcoming) \code{GOexpress::GOllapse} method.
}

\author{
    Kevin Rue-Albrecht
}

\seealso{
    Soon: \code{GOexpress::GOllapse} method.
}

\examples{
listMethods()
listMethods(type = "Parametric")
listMethods(type = "Machine learning")
}

\keyword{ GOexpress }
\keyword{ listMethods }
