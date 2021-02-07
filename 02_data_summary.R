########################################
########## 데이터 요약
########################################
rm(list = ls())

setwd("~/NAS/Research/KEPCO")


# devtools::install_github("praster1/JSFunction", force=TRUE)
source("load_libraries.R", local=TRUE)
source("load_functions.R", local=TRUE)

numCores = detectCores()







########## 데이터 불러오기
filesDir = "./_Dataset/"
listFiles = list.files(filesDir)


##### Korea University
listFiles_KoreaUniv = listFiles[grep("KoreaUniv", listFiles)]
listFiles_KoreaUniv = listFiles_KoreaUniv[grep(".QS", listFiles_KoreaUniv)]
listFiles_KoreaUniv = paste0(filesDir, listFiles_KoreaUniv)
len = length(listFiles_KoreaUniv)

data_KoreaUniv = pbmclapply(listFiles_KoreaUniv, qread, mc.cores=numCores)



##### ENTSO-E
data_ENTSOE = qread("./_Dataset/ENTSO-E.QS")
params_ENTSOE = qread("./_Dataset/ENTSO-E_pamams.QS")




##### KEPCO
listFiles_KEPCO = listFiles[grep("KEPCO", listFiles)]
listFiles_KEPCO = listFiles_KEPCO[grep(".QS", listFiles_KEPCO)]
listFiles_KEPCO = paste0(filesDir, listFiles_KEPCO)
len = length(listFiles_KEPCO)

data_KEPCO = pbmclapply(listFiles_KEPCO, qread, mc.cores=numCores)

for (i in 1:length(data_KEPCO))
{
	data_KEPCO[[i]]$ACT_PWR_QTY[which(is.na(data_KEPCO[[i]]$ACT_PWR_QTY))] = 0
	data_KEPCO[[i]]$ACT_PWR_QTY = as.numeric(data_KEPCO[[i]]$ACT_PWR_QTY)
}

temp = aggregate(ACT_PWR_QTY ~ SNOC + YearDate, data_KEPCO[[1]], sum)


getUniqSNOC = function(i)	
{
	res = as.character(as.matrix(unique(data_KEPCO[[i]][,2])))
	res = res[-1]
	return(res)	
}
uniq_SNOC = pbmclapply(1:len, getUniqSNOC, mc.cores=numCores)



years = c(2015:2018)

# 2015
yearIDX = 1
temp = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)

# 2016
yearIDX = 2
temp = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)

# 2017
yearIDX = 3
temp = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)

# 2018
yearIDX = 4
temp = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)





##### 요약은 진행중