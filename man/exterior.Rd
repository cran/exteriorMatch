\name{exterior}
\alias{exterior}
\concept{Exterior match}
\concept{Second control group}
\concept{Observational study}
\concept{Matching}
\concept{Disparities}
\concept{Prod}
\concept{Causal inference}
\concept{Tapered matching}
\title{
Constructs the Exterior Match from Two Matched Control Groups
}
\description{
If one treated group is matched to one control reservoir
in two different ways to produce two sets of treated-control matched
pairs, then the two control groups may be entwined, in the sense that
some control individuals are in both control groups.  The exterior
match is used to compare the two control groups.
}
\usage{
exterior(id1, id2)
}
\arguments{
  \item{id1}{
id1 and id2 are vectors of the same length containing unique
identifiers for the controls in control group 1 and control
group 2.  The first treated individual is paired with control
id1[1] in the first control group, and with control id2[1] in
the second control group.  The ith treated individual is
paired with control id1[i] in the first control group and
with control id2[i] in the second control group, for
i = 1, 2, ..., length(id1).
}
  \item{id2}{
See id1.
}
}
\details{
The identifiers in id1 are unique, length(id1) == length(unique(id1)),
and the identifiers in id2 are unique, length(id2) == length(unique(id2));
however, some controls in id1 may also be in id2.  The exterior match
minimally adjusts the match to remove duplicates.  It is used to compare
the two control groups.  The exterior match was proposed in
Rosenbaum and Silber (2013), and the example below reproduces
the example in Figure 3 of that paper.
}
\value{
The value is a list containing a revised id1 and id2 with revised
pairing and the removal of duplicates.
}
\references{

Daniel, S.R., Armstrong, K., Silber, J.H. and Rosenbaum, P.R., 2008. An algorithm for optimal tapered matching, with application to disparities in survival. Journal of Computational and Graphical Statistics, 17(4), pp.914-924.

Pimentel, S.D., Small, D.S. and Rosenbaum, P.R., 2016. Constructed second control groups and attenuation of unmeasured biases. Journal of the American Statistical Association, 111(515), pp. 1157-1167.

Rosenbaum, P.R. and Silber, J.H., 2013. Using the exterior match to compare two entwined matched control groups. The American Statistician, 67(2), pp.67-75.

Silber, J.H., Rosenbaum, P.R., Clark, A.S., Giantonio, B.J., Ross, R.N., Teng, Y., Wang, M., Niknam, B.A., Ludwig, J.M., Wang, W. and Even-Shoshan, O., 2013. Characteristics associated with differences in survival among black and white women with breast cancer. JAMA, 310(4), pp.389-397.

Silber, J.H., Rosenbaum, P.R., Ross, R.N., Niknam, B.A., Ludwig, J.M., Wang, W., Clark, A.S., Fox, K.R., Wang, M., Even-Shoshan, O. and Giantonio, B.J., 2014. Racial disparities in colon cancer survival: a matched cohort study. Annals of Internal Medicine, 161(12), pp.845-854.

}
\author{
Paul R. Rosenbaum
}
\note{
If one treated group is matched to one control reservoir
in two different ways to produce two sets of treated-control matched
pairs, then the two control groups may be entwined, in the sense that
some control individuals are in both control groups.  The exterior
match is used to compare the two control groups.  The exterior match
minimally adjusts the original match to remove duplicates.
The exterior match
was proposed by Rosenbaum and Silber (2013) and was used to study
medical disparities in Silber et al. (2013, 2014).

An alternative to the exterior match is avoid duplicates when building
the match using tapered matching; see Daniel et al. (2008).  The
control reservoir needs to be fairly large to obtain close matches
without duplication.  Additionally, in tapered matching, each control
group alters or distorts the control population by removing controls
used by other control group, a sourse of concern in some applications.

The exterior match can be used to study disparities.  In Silber et al.
(2013), the US black population with breast cancer was matched to
several white groups with breast cancer.  One control group was
matched for age.  Another group was matched for age, cancer characteristics
such as stage and grade, and other health problems such as diabetes
and congestive heart failure.  Yet another control group matched
for all of these variables plus cancer treatment, surgery, chemo,
radiation.  The exterior match is a tool that aids in understanding
the extent to which the diparity changes as differences between
the white and black populations are removed.

The exterior match can be used when a second control group is
built with the hope of attenuating unmeasured biases; see
Pimentel et al. (2016).

Figure 3 in Rosenbaum and Silber (2013) is better than any verbal
description of the exterior match.  Technically, the exterior match
consists of the exterior nodes of the
connected components of a bipartite graph.
}




\examples{
#The example is Figure 3 in Rosenbaum and Silber (2013).
g1<-c("A", "C", "D", "E", "G", "H", "I", "K", "L")
g2<-c("B", "C", "E", "F", "H", "I", "J", "L", "K")
exterior(g1,g2)

## The function is currently defined as
function (id1, id2)
{
    stopifnot(is.vector(id1))
    stopifnot(is.vector(id2))
    stopifnot(length(id1) == length(id2))
    stopifnot(length(id1) == length(unique(id1)))
    stopifnot(length(id2) == length(unique(id2)))
    n <- length(id1)
    ident <- id1 == id2
    nident <- sum(ident)
    id1 <- id1[!ident]
    id2 <- id2[!ident]
    inter <- intersect(id1, id2)
    while (length(inter) >= 1) {
        dup <- inter[1]
        w1 <- which(id1 == dup)
        w2 <- which(id2 == dup)
        id1 <- c(id1[w2], id1[-c(w1, w2)])
        id2 <- c(id2[w1], id2[-c(w1, w2)])
        if (id1[1] == id2[1]) {
            id1 <- id1[-1]
            id2 <- id2[-1]
        }
        inter <- intersect(id1, id2)
    }
    o <- order(id1)
    id1 <- id1[o]
    id2 <- id2[o]
    list(id1 = id1, id2 = id2)
  }
}
\keyword{ utilities }
\keyword{ design }
\keyword{ manip }
