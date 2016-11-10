\name{exteriorMatch-package}
\alias{exteriorMatch-package}
\alias{exteriorMatch}
\concept{Exterior match}
\concept{Second control group}
\concept{Observational study}
\concept{Matching}
\concept{Disparities}
\concept{Prod}
\concept{Causal inference}
\concept{Tapered matching}
\docType{package}
\title{
\packageTitle{exteriorMatch}
}
\description{
\packageDescription{exteriorMatch}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{exteriorMatch}
\packageIndices{exteriorMatch}

}
\author{
\packageAuthor{exteriorMatch}

Maintainer: \packageMaintainer{exteriorMatch}
}
\references{
Rosenbaum, P.R. and Silber, J.H., 2013. Using the exterior match to compare
two entwined matched control groups. The American Statistician, 67(2), pp.67-75.
}
\keyword{ package }
\keyword{ utilities }
\keyword{ design }
\keyword{ manip }
\examples{
#The example is Figure 3 in Rosenbaum and Silber (2013).
g1<-c("A", "C", "D", "E", "G", "H", "I", "K", "L")
g2<-c("B", "C", "E", "F", "H", "I", "J", "L", "K")
exterior(g1,g2)
}
