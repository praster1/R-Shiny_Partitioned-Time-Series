########################################
########## Raw Data를 처리가 편리한 데이터로 변환
########################################
rm(list = ls())

setwd("~/NAS/Research/KEPCO")


# devtools::install_github("praster1/JSFunction", force=TRUE)
source("load_libraries.R", local=TRUE)
source("load_functions.R", local=TRUE)

numCores = detectCores()








########## Synthetic Data
source("./_functions_makeSyntheticData/synthetic_AR1.R")
source("./_functions_makeSyntheticData/synthetic_AR1_multi.R")
dataLen = 1000

Model_NS = Model_NS_1 = Model_NS_2 = Model_NS_3 = Model_NS_4 = Model_NS_5 = Model_NS_6 = Model_NS_7 = NULL;
Model_S = Model_S_1 = Model_S_2 = Model_S_3 = Model_S_4 = Model_S_5 = Model_S_6 = Model_S_7 = NULL;



##### not with Structural Breaks
saveData_NS = function(modelDataList, saveDir)
{
	len = length(modelDataList$resData)
	for (i in 1:len)	{	write_feather(data.frame(data=modelDataList$resData[[i]]), paste0("./", saveDir, "/", i, ".feather"))	}
}

saveParameter_NS = function(modelDataList, saveDir)
{
	saveRDS(modelDataList$params, paste0("./", saveDir, "/params.RDS"))
}


### Model NS
mu = 0;		sigma = seq(0.2, 1, by=0.2);		alpha = 0.5
Model_NS = synthetic_AR1_multi(initVal = 0, mu = mu, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS"
saveData_NS(Model_NS, saveDir)
saveParameter_NS(Model_NS, saveDir)
rm(Model_NS)


### Model NS-1
mu = 0;		sigma = seq(1.2, 2, by=0.2);		alpha = 0.5
Model_NS_1 = synthetic_AR1_multi(initVal = 0, mu = mu, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS-1"
saveData_NS(Model_NS_1, saveDir)
saveParameter_NS(Model_NS_1, saveDir)
rm(Model_NS_1)


### Model NS-2
mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0);		sigma = 1;		alpha = 1
Model_NS_2 = synthetic_AR1_multi(initVal = 0, mu = mu, mu_runif=TRUE, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS-2"
saveData_NS(Model_NS_2, saveDir)
saveParameter_NS(Model_NS_2, saveDir)
rm(Model_NS_2)


### Model NS-3
mu = 0;		sigma = 1;		alpha = seq(0.2, 1, by=0.2)
Model_NS_3 = synthetic_AR1_multi(initVal = 0, mu = mu, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS-3"
saveData_NS(Model_NS_3, saveDir)
saveParameter_NS(Model_NS_3, saveDir)
rm(Model_NS_3)


### Model NS-4
mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0);		sigma = seq(1.2, 2, by=0.2);		alpha = 1
Model_NS_4 = synthetic_AR1_multi(initVal = 0, mu = mu, mu_runif=TRUE, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS-4"
saveData_NS(Model_NS_4, saveDir)
saveParameter_NS(Model_NS_4, saveDir)
rm(Model_NS_4)


### Model NS-5
mu = 0;		sigma = seq(1.2, 2, by=0.2);		alpha = seq(0.2, 1, by=0.2)
Model_NS_5 = synthetic_AR1_multi(initVal = 0, mu = mu, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS-5"
saveData_NS(Model_NS_5, saveDir)
saveParameter_NS(Model_NS_5, saveDir)
rm(Model_NS_5)


### Model NS-6
mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0);		sigma = 1;		alpha = seq(0.2, 1, by=0.2)
Model_NS_6 = synthetic_AR1_multi(initVal = 0, mu = mu, mu_runif=TRUE, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS-6"
saveData_NS(Model_NS_6, saveDir)
saveParameter_NS(Model_NS_6, saveDir)
rm(Model_NS_6)


### Model NS-7
mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0);		sigma = seq(1.2, 2, by=0.2);		alpha = seq(0.2, 1, by=0.2)
Model_NS_7 = synthetic_AR1_multi(initVal = 0, mu = mu, mu_runif=TRUE, sigma = sigma, alpha = alpha, dataLen = dataLen, plot=FALSE)
saveDir = "_dataset_SyntheticData/NS-7"
saveData_NS(Model_NS_7, saveDir)
saveParameter_NS(Model_NS_7, saveDir)
rm(Model_NS_7)





##### with Structural Breaks
source("./_functions_makeSyntheticData/synthetic_AR1_multi_with_structuralBreaks.R")


saveData_S = function(modelDataList, saveDir)
{
	len = length(modelDataList)
	for (i in 1:len)	{	write_feather(data.frame(data=modelDataList[[i]]$resData), paste0("./", saveDir, "/", i, ".feather"))	}
}

saveParameter_S = function(modelDataList, saveDir)
{
	len = length(modelDataList);	params = NULL
	for (i in 1:len)	{	params[[i]] = modelDataList[[i]]$params	}
	saveRDS(params, paste0("./", saveDir, "/params.RDS"))
}


### Model S
Model_S = NULL;

mu = list(c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0))
sigma = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))
alpha = list(c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5))

for (i in 1:length(mu))
{
	Model_S[[i]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																									sigma1 = sigma[[i]][1], sigma2 = sigma[[i]][2], sigma3 = sigma[[i]][3], sigma4 = sigma[[i]][4],
																									alpha1 = alpha[[i]][1], alpha2 = alpha[[i]][2], alpha3 = alpha[[i]][3], alpha4 = alpha[[i]][4],
																									dataLen = dataLen, plot=FALSE)
}
saveDir = "_dataset_SyntheticData/S"
saveData_S(Model_S, saveDir)
saveParameter_S(Model_S, saveDir)
rm(Model_S)



### Model S-1
Model_S_1 = NULL;

mu = list(c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0))
sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6))
alpha = list(c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5))

for (i in 1:length(mu))
{
	Model_S_1[[i]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																										sigma1 = sigma[[i]][1], sigma2 = sigma[[i]][2], sigma3 = sigma[[i]][3], sigma4 = sigma[[i]][4],
																										alpha1 = alpha[[i]][1], alpha2 = alpha[[i]][2], alpha3 = alpha[[i]][3], alpha4 = alpha[[i]][4],
																										dataLen = dataLen, plot=FALSE)
}
saveDir = "_dataset_SyntheticData/S-1"
saveData_S(Model_S_1, saveDir)
saveParameter_S(Model_S_1, saveDir)
rm(Model_S_1)



### Model S-2
Model_S_2 = NULL;

mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5))
sigma = list(c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0))
alpha = list(c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0))

for (i in 1:length(mu))
{
	Model_S_2[[i]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																										sigma1 = sigma[[i]][1], sigma2 = sigma[[i]][2], sigma3 = sigma[[i]][3], sigma4 = sigma[[i]][4],
																										alpha1 = alpha[[i]][1], alpha2 = alpha[[i]][2], alpha3 = alpha[[i]][3], alpha4 = alpha[[i]][4],
																										dataLen = dataLen, plot=FALSE)
}
saveDir = "_dataset_SyntheticData/S-2"
saveData_S(Model_S_2, saveDir)
saveParameter_S(Model_S_2, saveDir)
rm(Model_S_2)


### Model S-3
Model_S_3 = NULL;

mu = list(c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0))
sigma = list(c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0))
alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))

for (i in 1:length(mu))
{
	Model_S_3[[i]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																										sigma1 = sigma[[i]][1], sigma2 = sigma[[i]][2], sigma3 = sigma[[i]][3], sigma4 = sigma[[i]][4],
																										alpha1 = alpha[[i]][1], alpha2 = alpha[[i]][2], alpha3 = alpha[[i]][3], alpha4 = alpha[[i]][4],
																										dataLen = dataLen, plot=FALSE)
}
saveDir = "_dataset_SyntheticData/S-3"
saveData_S(Model_S_3, saveDir)
saveParameter_S(Model_S_3, saveDir)
rm(Model_S_3)


### Model S-4
Model_S_4 = NULL;

mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5))
sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6))
alpha = list(c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0))

modelCounter = 1
for (i in 1:length(mu))
{
	for (j in 1:length(sigma))
	{
		Model_S_4[[modelCounter]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																															sigma1 = sigma[[j]][1], sigma2 = sigma[[j]][2], sigma3 = sigma[[j]][3], sigma4 = sigma[[j]][4],
																															alpha1 = alpha[[i]][1], alpha2 = alpha[[i]][2], alpha3 = alpha[[i]][3], alpha4 = alpha[[i]][4],
																															dataLen = dataLen, plot=FALSE)
		modelCounter = modelCounter + 1;
	}
}
saveDir = "_dataset_SyntheticData/S-4"
saveData_S(Model_S_4, saveDir)
saveParameter_S(Model_S_4, saveDir)
rm(Model_S_4)


### Model S-5
Model_S_5 = NULL;

mu = list(c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0))
sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6))
alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))

modelCounter = 1
for (i in 1:length(sigma))
{
	for (j in 1:length(alpha))
	{
		Model_S_5[[modelCounter]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																															sigma1 = sigma[[i]][1], sigma2 = sigma[[i]][2], sigma3 = sigma[[i]][3], sigma4 = sigma[[i]][4],
																															alpha1 = alpha[[j]][1], alpha2 = alpha[[j]][2], alpha3 = alpha[[j]][3], alpha4 = alpha[[j]][4],
																															dataLen = dataLen, plot=FALSE)
		modelCounter = modelCounter + 1;
	}
}
saveDir = "_dataset_SyntheticData/S-5"
saveData_S(Model_S_5, saveDir)
saveParameter_S(Model_S_5, saveDir)
rm(Model_S_5)


### Model S-6
Model_S_6 = NULL;

mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5))
sigma = list(c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0))
alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))

modelCounter = 1
for (i in 1:length(mu))
{
	for (j in 1:length(alpha))
	{
		Model_S_6[[modelCounter]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																															sigma1 = sigma[[j]][1], sigma2 = sigma[[j]][2], sigma3 = sigma[[j]][3], sigma4 = sigma[[j]][4],
																															alpha1 = alpha[[j]][1], alpha2 = alpha[[j]][2], alpha3 = alpha[[j]][3], alpha4 = alpha[[j]][4],
																															dataLen = dataLen, plot=FALSE)
		modelCounter = modelCounter + 1;
	}
}
saveDir = "_dataset_SyntheticData/S-6"
saveData_S(Model_S_6, saveDir)
saveParameter_S(Model_S_6, saveDir)
rm(Model_S_6)


### Model S-7	#
Model_S_7 = NULL;

mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5))
sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6))
alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))

modelCounter = 1
for (i in 1:length(mu))
{
	for (j in 1:length(alpha))
	{
		for (k in 1:length(alpha))
		{
			Model_S_7[[modelCounter]] = synthetic_AR1_multi_with_structuralBreaks(initVal = 0,	mu1 = mu[[i]][1], mu2 = mu[[i]][2], mu3 = mu[[i]][3], mu4 = mu[[i]][4],
																														sigma1 = sigma[[j]][1], sigma2 = sigma[[j]][2], sigma3 = sigma[[j]][3], sigma4 = sigma[[j]][4],
																														alpha1 = alpha[[k]][1], alpha2 = alpha[[k]][2], alpha3 = alpha[[k]][3], alpha4 = alpha[[k]][4],
																														dataLen = dataLen, plot=FALSE)
			modelCounter = modelCounter + 1;
		}
	}
}
saveDir = "_dataset_SyntheticData/S-7"
saveData_S(Model_S_7, saveDir)
saveParameter_S(Model_S_7, saveDir)
rm(Model_S_7)










########## KEPCO
filesDir = "./_dataset_KEPCO/1_hv_lp_Backup/"
years = c(2015:2018)
IDX = 1:length(years)


##### 데이터 불러오기 
read_RDS = function(i)
{
	year = years[i]
	
	readData = readRDS(paste(filesDir, year, ".rds", sep=""))
	readData = as.data.frame(readData)
	temp = strptime(paste(readData[,1], readData[,2], "00", sep=""), format='%Y%m%d%H%M%S')
	readData = readData[,-c(1:2)]
	readData = cbind(temp, readData)
	colnames(readData)[1] = "YearDate"
	
	return(readData)
}

data = pbmclapply(IDX, read_RDS, mc.cores=numCores)


##### 1월 1일 0시 0분부터 12월 31일 23시 45분까지로 변환
seqAllDatetime = function(i)
{
	year = years[i]

	allDatetime = seqDateVec(year)
	allDatetime = POSIXct2Character(allDatetime)
	allDatetime = as.data.frame(as.matrix(allDatetime))
	colnames(allDatetime) = "YearDate"

	tempData = data[[i]]
	dataDatetime = POSIXct2Character(tempData[,1])
	tempData[,1] = dataDatetime
	tempData = as.data.frame(tempData)
	
	resData = left_join(allDatetime, tempData, by="YearDate")
	return(resData)
}


##### 파일로 저장
for (i in 1:length(IDX))
{
	resData = seqAllDatetime(i)
	write_feather(resData, paste("./_dataset_KEPCO/KEPCO_HV", years[i], ".feather", sep=""))
}










########## Korea University
filesDir = "./_dataset_KoreaUniv/Backup/"
buildings = c("녹지캠", "인문대", "창의관", "하나과학관")
IDX = 1:length(buildings)


##### 데이터 불러오기 
read_CSV = function(i)
{
	building = buildings[i]
	
	readData = fread(paste(filesDir, "data_", building, "_15min.csv", sep=""))
	readData = as.data.frame(readData)
	
	return(readData)
}

data = pbmclapply(IDX, read_CSV, mc.cores=numCores)


##### 파일로 저장
for (i in 1:length(IDX))
{
	write_feather(data[[i]], paste("./_dataset_KoreaUniv/KoreaUniv_", buildings[i], ".feather", sep=""))
}










########## ENTSO-E
### 데이터 출처: https://www.entsoe.eu/data/data-portal/?fbclid=IwAR3OF_cAHJN4Xbg2C54j_gvMflY42oS-Liijqye64lpdq1D-8nZSaFeaXgI
### 2006년 1월 1일 1시 1분부터 2015년 12월 31일까지, 1시간 단위
data = read.csv("./_dataset_ENTSO-E/Backup/ENTSO-E_Monthly-hourly-load-values_2006-2015.csv")



# AT BA BE BG CH CS CY CZ DE DK DK_W EE ES FI FR GB GR HR HU IE IS IT LT LU LV ME MK NI NL NO PL PT RO RS SE SI SK UA_W
uniq = unique(data[,1]);
modelLen = length(uniq)		# 모델 갯수
# saveRDS(uniq, paste("./ShinyApp_dataset_ENTSO-E/uniq.rds", sep=""))	### uniq를 파일로 저장



getDataVec = function(i, data, uniq)	{	resDataVec = data[data[,1] == uniq[i],];	resDataVec = as.numeric(t(as.matrix(resDataVec[,6:29])));	return(resDataVec)	}
dataVec = mclapply(1:length(uniq), getDataVec, data, uniq, mc.cores = numCores)


# Imputation: NA값을 전부 0으로 대체
getDataVecItem =  function(i){	return(dataVec[[i]])}	
NAto0 = function(i)	{	tempVec = getDataVecItem(i);	NAIdx = which(is.na(tempVec));	tempVec[NAIdx] = 0;		return(tempVec);	}
dataVec = mclapply(1:length(uniq), NAto0, mc.cores = numCores)


### 파일로 저장
saveFile_dataVec = function(i)	{ write_feather(as.data.frame(dataVec[[i]]), paste("./_dataset_ENTSO-E/ENTSO-E_", uniq[i], ".feather", sep=""))	}
pblapply(1:length(dataVec), saveFile_dataVec)