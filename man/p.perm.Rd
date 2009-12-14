\name{p.perm}
\alias{p.perm}
\title{ Permutation test for the significance of canonical correlation coefficients }
\description{
  This function runs a permutation test to assign the statistical significance 
  of canonical correlation coefficients.
  Wilks' Lambda, the Hotelling-Lawley Trace, the Pillai-Bartlett Trace, 
  or of Roy's Largest Root can be used as a test statistic.
}
\usage{
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Wilks")
}
\arguments{
  \item{X}{ array containing the independent variables, with \eqn{N} rows (number of observations) and \eqn{p} columns (number of independent variables). }
  \item{Y}{ array containing the dependent variables, with \eqn{N} rows (number of observations) and \eqn{q} columns (number of dependent variables). }
  \item{nboot}{ number of permutation resamples calculated. }
  \item{rhostart}{ index of the largest canonical correlation coefficient included in the calculation of the test statistic (see \eqn{Details}). }
  \item{type}{ test statistic to be used. One of "Wilks" (default), "Hotelling", "Pillai", or "Roy". }
}
\details{
  Permutation tests are based on resampling of the original data without replacement. To test the hypothesis of no correlation
  between two sets (X, Y) of variables, the values of one variable (Y) are randomly reassigned. Permutation tests do not require
  specific population distributions of the variables such as normal distribution. 
  Canonical correlation analysis (CCA) calculates \eqn{m = min(p,q)} correlation coefficients, see \code{\link{p.asym}}.
  The coefficients are arranged in descending order of magnitude: \eqn{rho[1] > rho[2] > rho[3] > ... > rho[m]}.
  In \code{p.perm}, the parameter \eqn{rhostart} determines how many correlation coefficients are included in the calculation
  of the test statistic: 
  choosing \eqn{rhostart=1}, all canonical correlations are included, 
  choosing \eqn{rhostart=2}, the biggest canonical correlation (\eqn{rho[1]}) is excluded,
  choosing \eqn{rhostart=3}, both \eqn{rho[1]} and \eqn{rho[2]} are excluded, etc.
  On principle, Roy's Largest Root takes only \eqn{rho[1]} into account, hence only \eqn{rhostart=1} can be chosen. 

}
\value{
  \item{stat0}{original value of the statistic (without resampling).}
  \item{stat}{\eqn{nboot} values of the statistic, one for each permutation resampling.}
  \item{nexcess}{number of permutation resamplings that resulted in a more extreme value of the statistic than \eqn{stat0}.} 
  \item{p.value}{p-value, derived from \eqn{nexcess}.} 
}
\references{
  Efron, B. and Tibshirani, R. J. (1994)
  \emph{An Introduction to the Bootstrap},
  Chapman & Hall, New York.

  Moore, D. S. amd McCabe, G. P. (2006)
  \emph{Introduction to the Practice of Statistics, Chapter 14}, 
  W. H. Freeman, New York.
}
\author{ Uwe Menzel  <uwemenzel@gmail.com>}
\note{ Permutation tests do not require a specific distribution of the variables.  
       Tests based on random resampling do generally not yield the same results when repeated.
       The canonical correlation coefficients are statistically significant
       if Wilks' Lambda is \emph{smaller} than a critical value.
}
\seealso{ See the function \code{\link{cancor}} or the \code{CCA} package for the calculation of canonical correlation coefficients. }
\examples{

## Load the CCP package:
library(CCP)


## Simulate example data:
X <- matrix(rnorm(150), 50, 3)
Y <- matrix(rnorm(250), 50, 5)



## Run permutation test using Wilks Lambda (default) as test statistic; include different numbers of canonical correlations:
p.perm(X, Y, nboot = 999, rhostart = 1)
p.perm(X, Y, nboot = 999, rhostart = 2)
p.perm(X, Y, nboot = 999, rhostart = 3)


## Run permutation tests based on different test statistics:
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Wilks")        
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Hotelling")
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Pillai")
p.perm(X, Y, nboot = 999, rhostart = 1, type = "Roy")

## Plot the permutation distribution, with the value of the original statistic marked:
out <- p.perm(X, Y, nboot = 999, rhostart = 3, type = "Hotelling")
plt.perm(out)
}
\keyword{ htest }
\keyword{ multivariate }
\keyword{ nonparametric }
