\name{plt.perm}
\alias{plt.perm}
\title{ Plot permutation distributions for test statistics }
\description{
  This function plots permutation distributions for test statistics that are used to assign the statistical significance 
  of canonical correlation coefficients, see function \code{\link{p.perm}}.
}
\usage{
plt.perm(p.perm.out)
}
\arguments{
  \item{p.perm.out}{ output of \code{p.perm}, see example below. }
}
\details{
   Depending on what type of statistic was chosen in \code{p.perm}, 
   a permutation distribution of this statistic is shown. 
   The statistic is one of: Wilks' Lambda, Hotelling-Lawley Trace, Pillai-Bartlett Trace, or Roy's Largest Root.
   These test statistics can be used to assign significance levels to canonical correlation coefficients, 
   for details see \code{\link{p.perm}}.
   The value corresponding to the "original" test statistic 
   (calculated using the canonical correlation coefficients resulting from unpermuted data ) 
   is plotted as a red, dotted vertical line;
   thus the area of the histogram outside this line determines the approximate p-value. 
   The vertical line is \emph{not} visible if the value corresponding to the original test statistic 
   is in the far tail of the histogram, yielding a p-value which is (close to) zero. 
   The numerical value corresponding to the original test statistic is plotted in the subtitle of the graph, 
   as well as the calculated p-value.
   The grey vertical line represents the mean of the permutation distribution. 
}
\author{ Uwe Menzel  <uwemenzel@gmail.com>}
\note{
In contradiction to \code{plt.asym}, the parameter \code{rhostart} cannot be chosen when running \code{pltperm}, , 
because it has already been determined in \code{\link{p.perm}}.  
}
\seealso{ See the function \code{\link{p.perm}} for the calculation of the p-values. }
\examples{

## Load the CCP package:
library(CCP)



## Simulate example data:
X <- matrix(rnorm(150), 50, 3)
Y <- matrix(rnorm(250), 50, 5)



## Calculate canonical correlations:
rho <- cancor(X,Y)$cor

## Define number of observations, number of dependent variables, number of independent variables.
N = dim(X)[1]       
p = dim(X)[2]   
q = dim(Y)[2]


# plot the permutation distribution of an F approximation for Wilks' Lambda, considering 3 and 2 canonical correlations:
out1 <- p.perm(X, Y, nboot = 999, rhostart = 1)  
plt.perm(out1)    
out2 <- p.perm(X, Y, nboot = 999, rhostart = 2)  
plt.perm(out2) 


# plot the permutation distribution of an F approximation for the Pillai-Bartlett Trace, considering 3, 2, and 1 canonical correlation(s):
res1 <- p.perm(X, Y, nboot = 999, rhostart = 1, type = "Pillai")  
plt.perm(res1)    
res2 <- p.perm(X, Y, nboot = 999, rhostart = 2, type = "Pillai")  
plt.perm(res2) 
res3 <- p.perm(X, Y, nboot = 999, rhostart = 3, type = "Pillai")  
plt.perm(res3)

}
\keyword{ htest }
\keyword{ multivariate }
\keyword{ nonparametric }

