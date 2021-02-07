########################################
########## marginal likelihood를 미리 구해둔다.
########################################
rm(list = ls())

setwd("~/NAS/Research/KEPCO")



########## Load Library and Functions
# devtools::install_github("praster1/JSFunction", force=TRUE)
source("load_libraries.R", local=TRUE)
source("load_functions.R", local=TRUE)

numCores = detectCores()



########## Synthetic Data

### Model NS
saveResultDir = "./_resultSet_SyntheticData/NS/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))



### Model NS-1
saveResultDir = "./_resultSet_SyntheticData/NS-1/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))



### Model NS-2
saveResultDir = "./_resultSet_SyntheticData/NS-2/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-3
saveResultDir = "./_resultSet_SyntheticData/NS-3/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-4
# saveResultDir = "./_resultSet_SyntheticData/NS-4/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-5
# saveResultDir = "./_resultSet_SyntheticData/NS-5/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-6
# saveResultDir = "./_resultSet_SyntheticData/NS-6/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-7
# saveResultDir = "./_resultSet_SyntheticData/NS-7/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### with Structural Breaks

### Model S
# saveResultDir = "./_resultSet_SyntheticData/S/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-1
# saveResultDir = "./_resultSet_SyntheticData/S-1/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-2
# saveResultDir = "./_resultSet_SyntheticData/S-2/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-3
# saveResultDir = "./_resultSet_SyntheticData/S-3/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-4
# saveResultDir = "./_resultSet_SyntheticData/S-4/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-5
# saveResultDir = "./_resultSet_SyntheticData/S-5/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-6
# saveResultDir = "./_resultSet_SyntheticData/S-6/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-7
# saveResultDir = "./_resultSet_SyntheticData/S-7/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### Korea University
# saveResultDir = "./_resultSet_KoreaUniv/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### ENTSO-E
saveResultDir = "./_resultSet_ENTSO-E/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### KEPCO

# 2015
# saveResultDir = "./_resultSet_KEPCO_2015/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


# 2016
# saveResultDir = "./_resultSet_KEPCO_2016/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


# 2017
# saveResultDir = "./_resultSet_KEPCO_2017/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


# 2018
# saveResultDir = "./_resultSet_KEPCO_2018/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))












########## Synthetic Data

### Model NS
# saveResultDir = "./_resultSet_SyntheticData/NS/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-1
# saveResultDir = "./_resultSet_SyntheticData/NS-1/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-2
# saveResultDir = "./_resultSet_SyntheticData/NS-2/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-3
# saveResultDir = "./_resultSet_SyntheticData/NS-3/"
# obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
# res = readRDS(paste0(saveResultDir, "resultSet.RDS"))







##### ENTSO-E
filesDir = "./_dataset_ENTSO-E/"
listFiles = list.files(filesDir)

listFiles_ENTSOE = listFiles[grep("ENTSO-E", listFiles)]
len = length(listFiles_ENTSOE)

# obsDataVec = (as.numeric(as.matrix(data_ENTSOE[[1]])))[3000:(3099+partialLen - 1)]


name = c("AT", "BA", "BE", "BG", "CH", "CS", "CY", "CZ", "DE", "DK", "DK_W", "EE", "ES", "FI", "FR", "GB", "GR", "HR", "HU", "IE", "IS", "IT", "LT", "LU", "LV", "ME", "MK", "NI", "NL", "NO", "PL", "PT", "RO", "RS", "SE", "SI", "SK", "UA_W")
# data_ENTSOE = pbmclapply(1:len, readData, listFiles_ENTSOE, filesDir, mc.cores=numCores)
data_ENTSOE = pblapply(1:len, readData, listFiles_ENTSOE, filesDir)
tempData_ENTSOE = NULL
tempName = NULL


counter = 1
for (i in 1:len)
{
	if (i == 14) { next; }
	if (i == 36) { next; }
	
	tempData_ENTSOE[[counter]] = data_ENTSOE[[i]]
	tempName = c(tempName, name[counter])
	counter = counter + 1;
}


partialLen = 4*24*7
par(mfrow = c(9, 4))
for (i in 1:length(tempData_ENTSOE))
{	
	vec = as.numeric(as.matrix(tempData_ENTSOE[[i]]))
	plot(vec, xlab="t", ylab="kWh", type="l", main=name[i])
	
	if (i == 1)
	{
		vec = c(rep(0, 2999), vec[3000:(3099+partialLen - 1)])
		points(vec, xlab="t", ylab="kWh", type="l", main=name[i], col="red")
		vec = rep(0, 2999)
		points(vec, xlab="t", ylab="kWh", type="l", main=name[i], col="white")		
	}
}





##### ENTSO-E
saveResultDir = "./_resultSet_ENTSO-E/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))



getAllRes = function(subRes, signIfQuantile)
{
	modelLen = length(subRes)
	unlistAll = as.numeric(unlist(subRes))
	unlistAll = unlistAll[which(!is.na(unlistAll))]

	result = NULL
	for (i in 1:modelLen)
	{
		if (i == 14) { next; }
		if (i == 36) { next; }
		
		tempRes = subRes[[i]]
		tempRes = tempRes[which(!is.na(tempRes))]
		
		len = length(tempRes)
		likelihood = sum((tempRes < as.numeric(quantile(unlistAll, signIfQuantile))) * 1)/len		# likelihood
		prior = 1/modelLen
		posterior = likelihood * prior
		
		result = rbind(result, c(prior, likelihood, posterior))
	}
	
	colnames(result) = c("prior", "likelihood", "posterior")
	return(result)
}




getAllRes_stat = function(subRes, signIfQuantile, trendRes)
{
	signIfQuantile = 1 - signIfQuantile
	modelLen = length(subRes)
	unlistAll = as.numeric(unlist(subRes))
	unlistAll = unlistAll[which(!is.na(unlistAll))]

	result = NULL
	for (i in 1:modelLen)
	{
		if (i == 14) { next; }
		if (i == 36) { next; }
		
		tempRes = subRes[[i]];
		tempTrendRes = trendRes[[i]]
		len = length(tempRes)
		likelihood_test = tempRes > as.numeric(quantile(unlistAll, signIfQuantile))		# likelihood
		likelihood_trend = tempTrendRes < 0.5														# likelihood
		likelihood = rbind(likelihood_test, likelihood_trend)
		likelihood = sum((apply(likelihood*1, 2, sum)==2) * 1)/len
		prior = 1/modelLen
		posterior = likelihood * prior
		
		result = rbind(result, c(prior, likelihood, posterior))
	}
	
	colnames(result) = c("prior", "likelihood", "posterior")
	return(result)
}



signif = 0.1
# getAllRes(res$res_Euclidean, signif)
# getAllRes(res$res_L1Norm, signif) 
round(getAllRes(res$res_L2Norm, signif), 5)
round(getAllRes(res$res_manhattan, signif), 5)
round(getAllRes(res$res_chebyshev, signif), 5)

round(getAllRes(res$res_sorensen, signif), 5)
round(getAllRes(res$res_gower, signif), 5)
round(getAllRes(res$res_soergel, signif), 5)
round(getAllRes(res$res_kulczynski_d, signif), 5)
round(getAllRes(res$res_canberra, signif), 5)
round(getAllRes(res$res_lorentzian, signif), 5)

round(getAllRes(res$res_intersection, signif), 5)
round(getAllRes(res$res_non_intersection, signif), 5)
round(getAllRes(res$res_wavehedges, signif), 5)
round(getAllRes(res$res_czekanowski, signif), 5)
round(getAllRes(res$res_motyka, signif), 5)
round(getAllRes(res$res_kulczynski_s, signif), 5)
# getAllRes(res$res_tanimoto, signif)
# getAllRes(res$res_ruzicka, signif)

round(getAllRes(res$res_inner_product, signif), 5)
round(getAllRes(res$res_harmonic_mean, signif), 5)
round(getAllRes(res$res_cosine, signif), 5)
round(getAllRes(res$res_hassebrook, signif), 5)
# getAllRes(res$res_jaccard, signif)
round(getAllRes(res$res_dice, signif), 5)

round(getAllRes(res$res_squared_euclidean, signif), 5)
round(getAllRes(res$res_pearson, signif), 5)
round(getAllRes(res$res_neyman, signif), 5)
round(getAllRes(res$res_squared_chi, signif), 5)
round(getAllRes(res$res_prob_symm, signif), 5)
round(getAllRes(res$res_divergence, signif), 5)
round(getAllRes(res$res_clark, signif), 5)

round(getAllRes(res$res_avg, signif), 5)

# Entropy Family
# getAllRes(res$res_maximum, signif)
round(getAllRes(res$res_Wasserstein, signif), 5)

round(getAllRes_stat(res$res_ksTest, signif, res$res_CoxStuartTest), 5)
round(getAllRes_stat(res$res_runsTest, signif, res$res_CoxStuartTest), 5)
# getAllRes_stat(res$res_CoxStuartTest, signif)

