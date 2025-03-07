% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write.R
\name{write-this}
\alias{write-this}
\alias{write_union}
\alias{write_over}
\title{Write into or over a file}
\usage{
write_union(path, lines, quiet = FALSE)

write_over(path, lines, quiet = FALSE)
}
\arguments{
\item{path}{Path to target file. It is created if it does not exist, but the
parent directory must exist.}

\item{lines}{Character vector of lines. For \code{write_union()}, these are lines
to add to the target file, if not already present. For \code{write_over()},
these are the exact lines desired in the target file.}

\item{quiet}{Logical. Whether to message about what is happening.}

\item{contents}{Character vector of lines.}
}
\value{
Logical indicating whether a write occurred, invisibly.
}
\description{
Helpers to write into or over a new or pre-existing file. Designed mostly for
for internal use. File is written with UTF-8 encoding.
}
\section{Functions}{
\itemize{
\item \code{write_union()}: writes lines to a file, taking the union of what's
already there, if anything, and some new lines. Note, there is no explicit
promise about the line order. Designed to modify simple config files like
\code{.Rbuildignore} and \code{.gitignore}.

\item \code{write_over()}: writes a file with specific lines, creating it if
necessary or overwriting existing, if proposed contents are not identical
and user is available to give permission.

}}
\examples{
\dontshow{
.old_wd <- setwd(tempdir())
}
write_union("a_file", letters[1:3])
readLines("a_file")
write_union("a_file", letters[1:5])
readLines("a_file")

write_over("another_file", letters[1:3])
readLines("another_file")
write_over("another_file", letters[1:3])
\dontrun{
## will error if user isn't present to approve the overwrite
write_over("another_file", letters[3:1])
}

## clean up
file.remove("a_file", "another_file")
\dontshow{
setwd(.old_wd)
}
}
\keyword{internal}
