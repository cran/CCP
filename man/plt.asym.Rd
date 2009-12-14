\name{plt.asym}
\alias{plt.asym}
\title{ Plot asymptotic distributions for test statistics }
\description{
  This function plots asymptotic distributions used to test the statistical significance 
  of canonical correlation coefficients, see function \code{\link{p.asym}}.
}
\usage{
plt.asym(p.asym.out, rhostart = 1)
}
\arguments{
  \item{p.asym.out}{ output of \code{p.asym}, see example below. }
  \item{rhostart}{ index of the largest canonical correlation coefficient included in the 
   calculation of the test statistic, see function \code{\link{p.asym}}. }
}
\details{
   Depending on what type of statistic was chosen in \code{p.asym}, an F-approximation for this statistic is plotted. 
   The statistic is one of: Wilks' Lambda, Hotelling-Lawley Trace, Pillai-Bartlett Trace, or Roy's Largest Root.
   The value of the test statistic calculated from the canonical correlation coefficients is plotted as a vertical line;
   thus the area located below the curve and to the right of the vertical line corresponds to the p-value. 
   The vertical line is \emph{not} visible if the value of the test statistic is in the far tail of the distribution, 
   resulting in a p-value which is (close to) zero. The numerical value of the test statistic,
   the numerator and denominator degrees of freedom of the F-distribution, and the p-value are plotted on the bottom 
   of the figure.  
}
\author{ Uwe Menzel  <uwe.menzel@genpat.uu.se>}
\seealso{ See the function \code{\link{p.asym}} for the calculation of the p-values. }
\examples{

## Load the CCP package:
library(CCP)


## Load example data:
data(Xdata)     # independent variables
data(Ydata)     # dependent variables
X <- as.matrix(Xdata)
Y <- as.matrix(Ydata)


## Calculate canonical correlations, using the function "cancor" from the "stats" package:
rho <- cancor(X,Y)$cor

## Define number of observations, number of dependent variables, number of independent variables.
N = dim(X)[1]       
p = dim(X)[2]   
q = dim(Y)[2]


## Plot the F-approximation for Wilks' Lambda, considering 3, 2, or 1 canonical correlation(s):
res1 <- p.asym(rho, N, p, q)
plt.asym(res1,rhostart=1)
plt.asym(res1,rhostart=2)
plt.asym(res1,rhostart=3)


## Plot the F-approximation for the Hotelling-Lawley Trace, considering 3, 2, or 1 canonical correlation(s):
res2 <- p.asym(rho, N, p, q, tstat="Hotelling")
plt.asym(res2,rhostart=1)
plt.asym(res2,rhostart=2)
plt.asym(res2,rhostart=3)
}
\keyword{ htest }
\keyword{ multivariate }


