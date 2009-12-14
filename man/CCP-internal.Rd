\name{CCP-internal}
\alias{Hotelling.stat}
\alias{HotellingLawleyTrace}
\alias{p.Roy}
\alias{Pillai.stat}
\alias{PillaiBartlettTrace}
\alias{RaoF.stat}
\alias{WilksLambda}
\title{ Internal functions for CCP package }
\description{
  Internal functions for CCP package
}
\usage{
Hotelling.stat(rho, N, p, q)
HotellingLawleyTrace(rho, p, q)
p.Roy(rho, N, p, q)
Pillai.stat(rho, N, p, q)
PillaiBartlettTrace(rho, p, q)
RaoF.stat(rho, N, p, q)
WilksLambda(rho, p, q)
}
\arguments{
  \item{rho}{ vector containing the canonical correlation coefficients. }
  \item{N}{ number of observations for each variable. }
  \item{p}{ number of independent variables. }
  \item{q}{ number of dependent variables. }
}
\details{
These functions are not intended to be called by the user.
}



