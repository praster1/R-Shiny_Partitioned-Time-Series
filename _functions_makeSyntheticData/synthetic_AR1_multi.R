require(compiler)

synthetic_AR1_multi = function(initVal, mu, mu_runif=FALSE, sigma, alpha, dataLen, plot = TRUE, modelName = "Model-NS")
{
	chars = toupper(big_letters(999))
	
	params = NULL;
	resModel = NULL;
	
	modelCounter = 1
	len = length(mu) * length(sigma) * length(alpha)
	
	for (i in mu)
	{
		for (j in sigma)
		{
			for (k in alpha)
			{
				if (mu_runif) {
					resModel[[modelCounter]] = synthetic_AR1(initVal = initVal, coef=k, mean = i, sd = sqrt(j), length = dataLen)
				} else {
					if (mu < 0) {
						resModel[[modelCounter]] = synthetic_AR1(initVal = initVal, coef=k, mean = runif(1, i, 0), sd = sqrt(j), length = dataLen)
					} else {
						resModel[[modelCounter]] = synthetic_AR1(initVal = initVal, coef=k, mean = runif(1, 0, i), sd = sqrt(j), length = dataLen)
					}
				}
				
				print(paste("mu = ", i, " / sigma = ", j, " / alpha = ", k, sep=""))
				params[[modelCounter]] = c(i, j, k)
				
				if (plot)
				{
					plot(resModel[[modelCounter]], type="l", main=paste(modelName, "-",chars[modelCounter], " / ", params[[modelCounter]], sep=""), ylab="y_t", xlab="t", cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5)
				}
				
				
				modelCounter = modelCounter + 1
			}
		}
	}
	
	res = list(resData = resModel, params = params)
	return(res)
}


synthetic_AR1_multi = cmpfun(synthetic_AR1_multi)