#!/usr/bin/r

# The Exponential Distribution
# Description
# Density, distribution function, quantile function and random generation for the exponential distribution with rate rate (i.e., mean 1/rate).

# Usage
# dexp(x, rate = 1, log = FALSE)
# pexp(q, rate = 1, lower.tail = TRUE, log.p = FALSE)
# qexp(p, rate = 1, lower.tail = TRUE, log.p = FALSE)
# rexp(n, rate = 1)
# Arguments
# x, q	
# vector of quantiles.

# p	
# vector of probabilities.

# n	
# number of observations. If length(n) > 1, the length is taken to be the number required.

# rate	
# vector of rates.

# log, log.p	
# logical; if TRUE, probabilities p are given as log(p).

# lower.tail	
# logical; if TRUE (default), probabilities are P[X ≤ x], otherwise, P[X > x].

# Details
# If rate is not specified, it assumes the default value of 1.

# The exponential distribution with rate λ has density

# f(x) = λ {e}^{- λ x}

# for x ≥ 0.

# Value
# dexp gives the density, pexp gives the distribution function, qexp gives the quantile function, and rexp generates random deviates.

# The length of the result is determined by n for rexp, and is the maximum of the lengths of the numerical arguments for the other functions.

# The numerical arguments other than n are recycled to the length of the result. Only the first elements of the logical arguments are used.

# Note
# The cumulative hazard H(t) = - log(1 - F(t)) is -pexp(t, r, lower = FALSE, log = TRUE).

# Source
# dexp, pexp and qexp are all calculated from numerically stable versions of the definitions.

# rexp uses

# Ahrens, J. H. and Dieter, U. (1972). Computer methods for sampling from the exponential and normal distributions. Communications of the ACM, 15, 873–882.

# References
# Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole.

# Johnson, N. L., Kotz, S. and Balakrishnan, N. (1995) Continuous Univariate Distributions, volume 1, chapter 19. Wiley, New York.

# See Also
# exp for the exponential function.

# Distributions for other standard distributions, including dgamma for the gamma distribution and dweibull for the Weibull distribution, both of which generalize the exponential.

# Examples

m12 <- dexp(1) - exp(-1) #-> 0

## a fast way to generate *sorted*  U[0,1]  random numbers:
rsunif <- function(n) { n1 <- n+1
   cE <- cumsum(rexp(n1)); cE[seq_len(n)]/cE[n1] }
m13 <- plot(rsunif(1000), ylim=0:1, pch=".")
abline(0,1/(1000+1), col=adjustcolor(1, 0.5))