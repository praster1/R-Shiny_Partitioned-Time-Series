sketch = htmltools::withTags(table(
	class = 'display',
	thead(
		tr( th(rowspan = 2, 'Model'), th(rowspan = 2, 'Prior'), th(colspan = 3, 'Parameters 1/4'), th(colspan = 3, 'Parameters 2/4'), th(colspan = 3, 'Parameters 3/4'), th(colspan = 3, 'Parameters 4/4'), th(colspan = 2, 'Independence_Test'), th(colspan = 2, 'Trend_Test'), th(colspan = 2, 'All') ),
		tr(  lapply(c("mu1/4", "sigma1/4", "alpha1/4", "mu2/4", "sigma2/4", "alpha2/4", "mu3/4", "sigma3/4", "alpha3/4", "mu4/4", "sigma4/4", "alpha4/4", 'Likelihood', 'Posterior', 'Likelihood', 'Posterior', 'Likelihood', 'Posterior'), th) )
	)
))


getResParams = function(i, resParams)
{
	return(c(t(resParams[[i]])))
}

resParams = list_to_matrix(pbmclapply(1:length(resParams), getResParams, resParams, mc.cores=numCores), 12)
print("***** resParams *****")
print(resParams)



resMatrix = matrix(NA, nrow=nrow(resParams), ncol=20)


print(resParams)
# print(getResParams(modelLen, resParams))

resMatrix[,1] = selectedModels
resMatrix[,2] = vec_prior
resMatrix[,3:14] = resParams
resMatrix[,15] = vec_likelihood_of_indep
resMatrix[,16] = vec_posterior_of_indep
resMatrix[,17] = vec_likelihood_of_trend
resMatrix[,18] = vec_posterior_of_trend
resMatrix[,19] = vec_likelihood_of_all
resMatrix[,20] = vec_posterior_of_all


colnames(resMatrix) = c(	"Model", "Parameter_mu1/4", "Parameter_sigma1/4", "Parameter_alpha1/4", 
										"Parameter_mu2/4", "Parameter_sigma2/4", "Parameter_alpha2/4", 
										"Parameter_mu3/4", "Parameter_sigma3/4", "Parameter_alpha3/4", 
										"Parameter_mu4/4", "Parameter_sigma4/4", "Parameter_alpha4/4", 
										"Prior", 
										"Independence_Test.Likelihood", "Independence_Test.Posterior",
										"Trend_Test.Likelihood", "Trend_Test.Posterior", 
										"All.Likelihood", "All.Posterior")

cat("- resMatrix:\n")
print(t(resMatrix))
cat("\n")