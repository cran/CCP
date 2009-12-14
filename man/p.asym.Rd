\name{p.asym}
\alias{p.asym}
\title{ Asymptotic tests for the statistical significance of canonical correlation coefficients }
\description{
  This function runs asymptotic tests to assign the statistical significance 
  of canonical correlation coefficients.
  F-approximations of Wilks' Lambda, the Hotelling-Lawley Trace,
  the Pillai-Bartlett Trace, or of Roy's Largest Root can be used as a test statistic.
}
\usage{
p.asym(rho, N, p, q, tstat = "Wilks")
}
\arguments{
  \item{rho}{ vector containing the canonical correlation coefficients. }
  \item{N}{ number of observations for each variable. }
  \item{p}{ number of independent variables. }
  \item{q}{ number of dependent variables. }
  \item{tstat}{ test statistic to be used. One of "Wilks" (default), "Hotelling", "Pillai", or "Roy". }
}
\details{
  Canonical correlation analysis (CCA) measures the degree of linear relationship between two sets of variables.
  The number of correlation coefficients calculated in CCA is equal to the number of variables in the smaller set: \eqn{m = min(p,q)}.
  The coefficients are arranged in descending order of magnitude: \eqn{rho[1] > rho[2] > rho[3] > ... > rho[m]}.
  Except for \code{tstat = "Roy"}, the function \code{p.asym} calculates \eqn{m} p-values for each test statistic:
  the first p-value is calculated including \emph{all} canonical correlation coefficients,
  the second p-value is calculated by excluding \eqn{rho[1]}, 
  the third p-value is calculated by excluding \eqn{rho[1]} and \eqn{rho[2]} etc., 
  therewith allowing assessment of the statistical significance of each individual correlation coefficient. 
  On principle, Roy's Largest Root takes only \eqn{rho[1]} into account, hence one p-value is calculated only. 
}
\value{
  \item{stat}{value of the statistic, i.e. the value of either Wilks' Lambda, the Hotelling-Lawley Trace, the Pillai-Bartlett Trace, or Roy's Largest Root.}
  \item{approx}{value of the corresponding F-approximation for the statistic.}
  \item{df1}{numerator degrees of freedom for the F-approximation.} 
  \item{df2}{denominator degrees of freedom for the F-approximation.}
  \item{p.value}{p-value}  
}
\references{
  Wilks, S. S. (1935)
  On the independence of \eqn{k} sets of normally distributed statistical variables.
  \emph{Econometrica}, \bold{3} 309--326.  
 
  Rao, C. R. (1973)
  \emph{Linear Statistical Inference and It's Applications (2nd ed.).}
  John Wiley and Sons, New York, 533--543, 555--556.

  Pillai, K. C. W. (1956)
  On the distribution of the largest or the smallest root of a matrix in multivariate analysis.
  \emph{Biometrika}, \bold{43} 122--127.

  Muller, K. E. and Peterson B. L. (1984)
  Practical Methods for computing power in testing the multivariate general linear hypothesis.
  \emph{Computational Statistics & Data Analysis}, \bold{2} 143--158.

  Anderson, T. W. (1984)
  \emph{An introduction to Multivariate Statistical Analysis.} 
  John Wiley and Sons, New York.

}
\author{ Uwe Menzel  <uwemenzel@gmail.com>}
\note{ Usage of asymptotic approximations requires multivariate normality of the variables, 
       or a large number of observations. Canonical correlation is sensitive to outliers.
       The F-approximation for Roy's Largest Root is an upper bound, and the significance level is therefore 
       optimistically small. The canonical correlation coefficients are statistically significant
       if Wilks' Lambda is \emph{smaller} than a critical value.
}
\seealso{ See the function \code{\link{cancor}} or the \code{CCA} package for the calculation of canonical correlation coefficients. }
\examples{

## Load the CCP package:
library(CCP)



## Simulate example data:
X <- matrix(rnorm(150), 50, 3)
Y <- matrix(rnorm(250), 50, 5)



## Calculate canonical correlations ("cancor" is part of the stats-package):
rho <- cancor(X,Y)$cor

## Define number of observations, number of dependent variables, number of independent variables.
N = dim(X)[1]       
p = dim(X)[2]   
q = dim(Y)[2]

## Calculate p-values using the F-approximations of different test statistics:
p.asym(rho, N, p, q, tstat = "Wilks")
p.asym(rho, N, p, q, tstat = "Hotelling")
p.asym(rho, N, p, q, tstat = "Pillai")
p.asym(rho, N, p, q, tstat = "Roy")

## Plot the F-approximation for Wilks' Lambda, considering 3, 2, or 1 canonical correlation(s):
res1 <- p.asym(rho, N, p, q)
plt.asym(res1,rhostart=1)
plt.asym(res1,rhostart=2)
plt.asym(res1,rhostart=3)
}
\keyword{ htest }
\keyword{ multivariate }


