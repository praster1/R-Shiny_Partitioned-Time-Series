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
dataLen = 1000


##### not with Structural Breaks
params_NS = list(	list(mu = 0,	sigma = seq(0.2, 1, by=0.2),	alpha = 0.5),
									list(mu = 0,	sigma = seq(1.2, 2, by=0.2),	alpha = 0.5),
									list(mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0),	sigma = 1,	alpha = 1),
									list(mu = 0,	sigma = 1,	alpha = seq(0.2, 1, by=0.2)),
									list(mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0),	sigma = seq(1.2, 2, by=0.2),	alpha = 1),
									list(mu = 0,	sigma = seq(1.2, 2, by=0.2),	alpha = seq(0.2, 1, by=0.2)),
									list(mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0),	sigma = 1,	alpha = seq(0.2, 1, by=0.2)),
									list(mu = c(0.5, 1.0, 2.0, -0.5, -1.0, -2.0),	sigma = seq(1.2, 2, by=0.2),	alpha = seq(0.2, 1, by=0.2))
						)

data_modelNS = pbmclapply(1:length(params_NS), makeModelNSData, params_NS, dataLen, FALSE, "Data")
params_modelNS = pbmclapply(1:length(params_NS), makeModelNSData, params_NS, dataLen, FALSE, "Params")
for (i in 1:length(params_modelNS))
{
	params_modelNS[[i]] = list_to_matrix(lapply(params_modelNS[[i]], unlist), 3)
}

qsave(data_modelNS, "./_Dataset/Synthetic_ModelNS.QS")
qsave(params_modelNS, "./_Dataset/Synthetic_ModelNS_params.QS")


##### with Structural Breaks
params_S = list(	list(	mu = list(c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0)),
												sigma = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6)),
												alpha = list(c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5))
							),
						list(	mu = list(c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0), c(0, 0, 0, 0)),
									alpha = list(c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5), c(0.5, 0.5, 0.5, 0.5))
									sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6)),
							),
						list(	mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5)),
									sigma = list(c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0)),
									alpha = list(c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0))
							),
						list(	mu = list(c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0)),
									sigma = list(c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0)),
									alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))
							),
						list(	mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5)),
									sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6)),
									alpha = list(c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0))
							),
						list(	mu = list(c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0), c(0.0, 0.0, 0.0, 0.0)),
									sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6)),
									alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))
							),
						list(	mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5)),
									sigma = list(c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0), c(1.0, 1.0, 1.0, 1.0, 1.0, 1.0)),
									alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))
							),
						list(	mu = list(c(0.5, 1.0, 2.0, -0.5),	c(1.0, 2.0, -0.5, -1.0),	c(2.0, -0.5, -1.0, -2.0),	c(-0.5, 2.0, 1.0, 0.5),	c(-1.0, -0.5, 2.0, 1.0),	c(-1.0, -0.5, 2.0, 1.0),	c(-2.0, -1.0, 2.0, 1.0),	c(0.5, -2.0, -1.0, -0.5)),
									sigma = list(c(1.2, 1.4, 1.6, 1.8),	c(1.4, 1.6, 1.8, 2.0),	c(1.6, 1.8, 2.0, 1.2),	c(1.8, 1.6, 1.4, 1.2),	c(2.0, 1.8, 1.6, 1.4),	c(1.2, 2.0, 1.8, 1.6)),
									alpha = list(c(0.2, 0.4, 0.6, 0.8),	c(0.4, 0.6, 0.8, 1.0),	c(0.6, 0.8, 1.0, 0.2),	c(0.8, 0.6, 0.4, 0.2),	c(1.0, 0.8, 0.6, 0.4),	c(0.2, 1.0, 0.8, 0.6))
							)
					)

data_modelS = pbmclapply(1:length(params_S), makeModelSData, params_S, dataLen, FALSE, "Data")
params_modelS = pbmclapply(1:length(params_S), makeModelSData, params_S, dataLen, FALSE, "Params")
for (i in 1:length(params_modelS))
{
	params_modelS[[i]] = list_to_matrix(lapply(params_modelS[[i]], unlist), 12)
}

qsave(data_modelS, "./_Dataset/Synthetic_ModelS.QS")
qsave(params_modelS, "./_Dataset/Synthetic_ModelS_params.QS")





########## KEPCO
filesDir = "./_Dataset/_Backup_KEPCO/1_hv_lp/"
years = c(2015:2018)
IDX = 1:length(years)


##### 데이터 불러오기
readData = function(i)
{
	year = years[i]

	readData = qread(paste0(filesDir, year, ".QS"))
	readData = as_tibble(readData)
	readData = data.table(YearDate = strptime(paste0(readData$MR_YMD, readData$MR_HHMI, "00"), format='%Y%m%d%H%M%S'), readData[,-c(1:2)])

	return(readData)
}

data = pbmclapply(IDX, readData, mc.cores=numCores)


##### 1월 1일 0시 0분부터 12월 31일 23시 45분까지로 변환
seqAllDatetime = function(i)
{
	year = years[i]

	allDatetime = data.table(YearDate = as.character(seqDateVec(year)))

	tempData = data[[i]]
	tempData$YearDate = as.character(tempData$YearDate)

	resData = left_join(allDatetime, tempData, by="YearDate")
	return(resData)
}


##### 파일로 저장
for (i in 1:length(IDX))
{
	resData = seqAllDatetime(i)
	qsave(resData, paste("./_Dataset/KEPCO_HV_", years[i], ".QS", sep=""))
}





########## Korea University
filesDir = "./_Dataset/_Backup_KoreaUniv/"
buildings = c("녹지캠", "인문대", "창의관", "하나과학관")
IDX = 1:length(buildings)


##### 데이터 불러오기
read_CSV = function(i)
{
	building = buildings[i]

	readData = fread(paste(filesDir, "data_", building, "_15min.csv", sep=""))
	readData = as.data.table(readData)

	return(readData)
}

data = pbmclapply(IDX, read_CSV, mc.cores=numCores)


##### 파일로 저장
for (i in 1:length(IDX))
{
	qsave(data[[i]], paste("./_Dataset/KoreaUniv_", buildings[i], ".QS", sep=""))
}





########## ENTSO-E
### 데이터 출처: https://www.entsoe.eu/data/data-portal/?fbclid=IwAR3OF_cAHJN4Xbg2C54j_gvMflY42oS-Liijqye64lpdq1D-8nZSaFeaXgI
### 2006년 1월 1일 1시 1분부터 2015년 12월 31일까지, 1시간 단위
data = read.csv("./_Dataset/_Backup_ENTSO-E/ENTSO-E_Monthly-hourly-load-values_2006-2015.csv")



# AT BA BE BG CH CS CY CZ DE DK DK_W EE ES FI FR GB GR HR HU IE IS IT LT LU LV ME MK NI NL NO PL PT RO RS SE SI SK UA_W
uniq = unique(data[,1]);
modelLen = length(uniq)		# 모델 갯수
# saveRDS(uniq, paste("./ShinyApp_dataset_ENTSO-E/uniq.rds", sep=""))	### uniq를 파일로 저장



getDataVec = function(i, data, uniq)	{	resDataVec = data[data[,1] == uniq[i],]
resDataVec = as.numeric(t(as.matrix(resDataVec[,6:29])));	return(resDataVec)	}
dataVec = mclapply(1:length(uniq), getDataVec, data, uniq, mc.cores = numCores)


# Imputation: 0값을 전부 NA으로 대체
getDataVecItem =  function(i){	return(dataVec[[i]])}
NAto0 = function(i)	{	tempVec = getDataVecItem(i);	NAIdx = which(tempVec == 0);	tempVec[NAIdx] = NA;		return(tempVec);	}
dataVec = mclapply(1:length(uniq), NAto0, mc.cores = numCores)


### 파일로 저장
# saveFile_dataVec = function(i)	{ write_feather(as.data.frame(dataVec[[i]]), paste("./_dataset_ENTSO-E/ENTSO-E_", uniq[i], ".feather", sep=""))	}
# pblapply(1:length(dataVec), saveFile_dataVec)

qsave(dataVec, "./_Dataset/ENTSO-E.QS")
qsave(uniq, "./_Dataset/ENTSO-E_pamams.QS")
