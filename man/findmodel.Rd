% Generated by roxygen2 (4.0.1): do not edit by hand
\name{findmodel}
\alias{findmodel}
\title{Create a model-type vector template}
\usage{
findmodel(thres)
}
\arguments{
\item{thres}{An numeric matrix which contains the threshold parameter for each item. NA is allowed - in fact expected!}
}
\description{
This is a small helper function which creates a vector template for the \code{PPall()} function quick and easily. Modify this template as you like.
}
\details{
This function tries to guess the model which was applied to each item by using the matrix of threshold parameters. It only discriminates between gpcm and 4pl model, and returns a character vector which length equals the number of items, which contains \code{GPCM} or \code{4PL} depending on the structure of the thres matrix.
}
\examples{
################# GPCM  and 4PL mixed #########################################

# some threshold parameters
THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
# slopes
sl     <- c(0.5,1,1.5,1.1,1,0.98)

THRESx <- THRES
THRESx[2,1:3] <- NA

# for the 4PL item the estimated parameters are submitted, 
# for the GPCM items the lower asymptote = 0 
# and the upper asymptote = 1.
la     <- c(0.02,0.1,0,0,0,0)
ua     <- c(0.97,0.91,1,1,1,1)

awmatrix <- matrix(c(1,0,1,0,1,1,1,0,0,1
                     ,2,0,0,0,0,0,0,0,0,1
                     ,1,2,2,1,1,1,1,0,0,1),byrow=TRUE,nrow=5)

# create model2est
# this function tries to help finding the appropriate 
# model by inspecting the THRESx.
model2est <- findmodel(THRESx)


# MLE estimation
respmixed_mle <- PPall(respm = awmatrix,thres = THRESx, 
                     slopes = sl,lowerA = la, upperA=ua,type = "mle",
                     model2est=model2est)
# WLE estimation
respmixed_wle <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua,type = "wle",
                    model2est=model2est)
# MAP estimation
respmixed_map <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua, type = "map",
                    model2est=model2est)

# EAP estimation
respmixed_eap <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua, type = "eap",
                    model2est=model2est)

# Robust estimation
respmixed_rob <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua, type = "robust",
                    model2est=model2est)


# summary to summarize the results
summary(respmixed_mle)
summary(respmixed_wle)
summary(respmixed_map)
summary(respmixed_eap)
summary(respmixed_rob)

}
\author{
Manuel Reif
}
\seealso{
\link{PPall}
}
\keyword{Parameters}
\keyword{Person}

