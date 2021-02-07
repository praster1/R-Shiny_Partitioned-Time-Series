makeModelNSData = function(i, params, dataLen, plot, return = "Data")
{
	mu_runif = FALSE
	if (i == 3 || i == 5 || i == 7 || i == 8)	{	mu_runif = TRUE	}
	
	Model_NS = NULL
	if(return == "Data")		{	Model_NS = synthetic_AR1_multi(initVal = 100, mu = params[[i]]$mu, mu_runif = mu_runif, sigma = params[[i]]$sigma, alpha = params[[i]]$alpha, dataLen = dataLen, plot=plot)$resData	}
	else							{	Model_NS = synthetic_AR1_multi(initVal = 100, mu = params[[i]]$mu, mu_runif = mu_runif, sigma = params[[i]]$sigma, alpha = params[[i]]$alpha, dataLen = dataLen, plot=plot)$params	}
	
	return(Model_NS)
}