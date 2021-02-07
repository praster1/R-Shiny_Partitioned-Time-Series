makeModelSData = function(m, params, dataLen, plot, return = "Data")
{
	mu = params[[m]]$mu
	sigma = params[[m]]$sigma
	alpha = params[[m]]$alpha
	
	modelCounter = 1
	res = NULL
	for (i in 1:length(mu))
	{
		for (j in 1:length(sigma))
		{
			for (k in 1:length(alpha))
			{
				res[[modelCounter]] = synthetic_AR1_multi_with_structuralBreaks(	initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																															sigma1 = sigma[[j]][1], sigma2 = sigma[[j]][2], sigma3 = sigma[[j]][3], sigma4 = sigma[[j]][4],
																															alpha1 = alpha[[k]][1], alpha2 = alpha[[k]][2], alpha3 = alpha[[k]][3], alpha4 = alpha[[k]][4],
																															dataLen = dataLen, plot=FALSE)
				if (return == "Data") {
					res[[modelCounter]] = res[[modelCounter]]$resData
				} else {
					res[[modelCounter]] = res[[modelCounter]]$params
				}
				
				modelCounter = modelCounter + 1;
			}
		}
	}
	
	return(res)
}
