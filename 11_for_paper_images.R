rm(list = ls())
set.seed(1)

require(parallel);		require(pbmcapply);	require(pbapply);

setwd("~/NAS/Research/KEPCO")

numCores <- detectCores()


### Image001
plotJS = function(x, y=NULL, col="black", main=NULL, type=NULL, pch=NULL, lwd=NULL, bg=NULL, xlim=NULL, ylim=NULL, xaxes=TRUE, yaxes=TRUE, xlab=NULL, ylab=NULL, xcex=NA, ycex=NA)
{
	par(bg=bg)
	plot(x, y, pch=pch, type=type, col=col, yaxt="n", xlab="", ylab="", axes=F, main=main, lwd=lwd, xlim=xlim, ylim=ylim)
	
	if(xaxes)	{	axis(side=1)	}
	if(yaxes)	{	axis(side=2)	}
	
	mtext(ylab, side=2, line=2.5, at=0, cex=xcex, font=2)
	mtext(xlab, side=4, line=2.5, at=100, cex=ycex, font=2)
	par(bg="white")
}


source("./_functions_makeSyntheticData/synthetic_AR1.R")
source("./_functions_makeSyntheticData/synthetic_AR1_multi.R")


set.seed(123)
modelData = synthetic_AR1_multi(initVal = 0, mu = 1, mu_runif=FALSE, sigma = 1, alpha = 1, dataLen = 100, plot=FALSE)
par(mfrow = c(3, 1))
plotJS(unlist(modelData$resData[[1]]), type="n", bg="white", col="black", lwd=2, yaxes=FALSE, xcex=1.5, xlab="t")
points(unlist(modelData$resData[[1]][1:30]), type="l", lwd=2)





### Image002
plotJS(unlist(modelData$resData[[1]]), type="n", bg="white", col="black", lwd=2, yaxes=FALSE)
points(unlist(modelData$resData[[1]][1:30]), type="l", lwd=2)
points(30:100, unlist(modelData$resData[[1]][30:100]), type="l", lwd=2, col="red")

modelData = readRDS("./ShinyApp_dataset_SyntheticData/Model_S_2.rds");
plotJS(unlist(modelData[[1]][1:100]$resData), type="l", bg="white", col="black", lwd=2, yaxes=FALSE)
plotJS(unlist(modelData[[3]][1:100]$resData), type="l", bg="white", col="black", lwd=2, yaxes=FALSE)
plotJS(unlist(modelData[[5]][1:100]$resData), type="l", bg="white", col="black", lwd=2, yaxes=FALSE)





### Image004

# NOT RUN {
require(graphics)

plot(stl(nottem, "per"))
plot(stl(nottem, s.window = 7, t.window = 50, t.jump = 1))

plot(stllc <- stl(log(co2), s.window = 21))
summary(stllc)
## linear trend, strict period.
plot(stl(log(co2), s.window = "per", t.window = 1000))

## Two STL plotted side by side :
        stmd <- stl(mdeaths, s.window = "per") # non-robust
summary(stmR <- stl(mdeaths, s.window = "per", robust = TRUE))





### Image005
set.seed(123)
par(mfrow = c(1, 1))
A = synthetic_AR1(initVal = 0, coef=1, mean = 1, sd = 1, length = 20) 
B = synthetic_AR1(initVal = A[20], coef=1, mean = -1, sd = 1, length = 20) 
C = synthetic_AR1(initVal = B[20], coef=1, mean = 1, sd = 1, length = 20) 
plot(c(A, 50, B, -50, C[1:2]), type="l", lwd=3, xlab="t", ylab="Y")





### From this post: http://stats.stackexchange.com/q/232959/67822
dataLen = 10

set.seed(0)
n = 100 #No. test points
Xtest = seq(-5, 5, length.out = n)   #Test points: 50 points between -5 and +5: -5, -4.79, -4.59,..., 4.59, 4.79, 5

kernel = function(a,b, param){                                   # Defining a function the Gaussian process is exp{-1/2 abs(x_1 - x_2)^2}
  #GP squared exponential kernel:
  #Leaving aside the abs value, (x_1 - x_2)^2 = a^2 + b^2 - 2 ab. And making the matrices congruous:
  sqdist = outer(a^2,b^2,FUN=`+`) - 2 * (a %*% t(b))
  exp(-.5 * (1/param) * sqdist) # This is the kernel: when distance is inf. the exponential becomes 1/e^inf =0, when dist=0, k =1
}
  
param = 0.1                                        
K_test = kernel(Xtest, Xtest, param)                       #Kernel at test points: all the points against each other.
  
  # Draw samples from the prior at our test points:
  
Ch_test = chol(K_test + 1e-15 * diag(n)) # Square root of the kernel values (the Cholesky)
# m = matrix(rnorm(n * dataLen), ncol = dataLen)
m = matrix(rnorm(n * 3), ncol = 3)
f_prior = t(m) %*% Ch_test # Generating multivariate normals through the Cholesky representing the kernels


plot(Xtest,f_prior[1,], type="l", col='darkorange', ylim=c(-2.2,2.2), lwd = 2,	xlab ="", ylab ="")
title(main="Three samples from the GP Prior", cex.main=0.85)
abline(h = 0)
colors=getColorList()
# for(i in 2:dataLen){	lines(Xtest, f_prior[i,], type = 'l', col=colors[i], lwd=2) }	# Plotting
for(i in 2:3){	lines(Xtest, f_prior[i,], type = 'l', col=colors[i], lwd=2) }	# Plotting








### 
require(MASS)
require(reshape2)
require(ggplot2)
x_predict <- seq(-5,5,len=50)
l <- 1
SE <- function(Xi,Xj, l) exp(-0.5 * (Xi - Xj) ^ 2 / l ^ 2)
cov <- function(X, Y) outer(X, Y, SE, l)
COV <- cov(x_predict, x_predict)
values <- mvrnorm(10, rep(0, length=length(x_predict)), COV)
dat <- data.frame(x=x_predict, t(values))
dat <- melt(dat, id="x")
head(dat)
fig2a <- ggplot(dat,aes(x=x,y=value)) +
  geom_rect(xmin=-Inf, xmax=Inf, ymin=-2, ymax=2, fill="grey80") +
  geom_line(aes(group=variable)) +   theme_bw() +
  geom_line(aes(color=variable)) + #REPLICATES
  scale_y_continuous(lim=c(-3,3), name="output, f(x)") +
  xlab("input, x")
fig2a




### Random Histogram
# x <- rnorm(1000)
x <- rbeta(1000, 0.5, 0.65)
h = hist(x)
plot(h, col="red", main=NULL)