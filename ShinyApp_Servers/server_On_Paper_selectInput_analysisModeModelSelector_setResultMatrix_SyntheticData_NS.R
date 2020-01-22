sketch = htmltools::withTags(table(
	class = 'display',
	thead(
		tr( th(rowspan = 2, 'Model'), th(rowspan = 2, 'Prior'), th(colspan = 3, 'Parameters'), th(colspan = 2, 'Independence_Test'), th(colspan = 2, 'Trend_Test'), th(colspan = 2, 'All') ),
		tr(  lapply(c("mu", "sigma", "alpha", 'Likelihood', 'Posterior', 'Likelihood', 'Posterior', 'Likelihood', 'Posterior'), th) )
	)
))

	
resParams = list_to_matrix(resParams, 3)



resMatrix = matrix(NA, nrow=nrow(resParams), ncol=11)

resMatrix[,1] = selectedModels
resMatrix[,2] = vec_prior
resMatrix[,3:5] = resParams
resMatrix[,6] = vec_likelihood_of_indep
resMatrix[,7] = vec_posterior_of_indep
resMatrix[,8] = vec_likelihood_of_trend
resMatrix[,9] = vec_posterior_of_trend
resMatrix[,10] = vec_likelihood_of_all
resMatrix[,11] = vec_posterior_of_all


colnames(resMatrix) = c(	"Model", "Parameter_mu", "Parameter_sigma", "Parameter_alpha", "Prior", 
									"Independence_Test.Likelihood", "Independence_Test.Posterior",
									"Trend_Test.Likelihood", "Trend_Test.Posterior", 
									"All.Likelihood", "All.Posterior")
									
cat("- resMatrix:\n")
print(t(resMatrix))
cat("\n")