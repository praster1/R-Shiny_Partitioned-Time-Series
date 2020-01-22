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



##### Korea University
filesDir = "./_dataset_KoreaUniv/"
listFiles = list.files(filesDir)

listFiles_KoreaUniv = listFiles[grep("KoreaUniv", listFiles)]
len = length(listFiles_KoreaUniv)


data_KoreaUniv = pbmclapply(1:len, readData, listFiles_KoreaUniv, filesDir, mc.cores=numCores)



##### ENTSO-E
filesDir = "./_dataset_ENTSO-E/"
listFiles = list.files(filesDir)

listFiles_ENTSOE = listFiles[grep("ENTSO-E", listFiles)]
len = length(listFiles_ENTSOE)


data_ENTSOE = pbmclapply(1:len, readData, listFiles_ENTSOE, filesDir, mc.cores=numCores)




##### KEPCO
filesDir = "./_dataset_KEPCO/"
listFiles = list.files(filesDir)

listFiles_KEPCO = listFiles[grep("KEPCO", listFiles)]
len = length(listFiles_KEPCO)


### List로 저장되어있으며, 각각 2015, 2016, 2017, 2018년 데이터
data_KEPCO = pbmclapply(1:len, readData, listFiles_KEPCO, filesDir, mc.cores=numCores)

# dim(unique(data_KEPCO[[1]][,2]))		# SNOC
# [1] 488   1
# dim(unique(data_KEPCO[[1]][,3]))		# METER_ID
# [1] 465   1

# dim(unique(data_KEPCO[[2]][,2]))		# SNOC
# [1] 1126    1
# dim(unique(data_KEPCO[[2]][,3]))		# METER_ID
# [1] 920   1

# dim(unique(data_KEPCO[[3]][,2]))		# SNOC
# [1] 1267    1
# dim(unique(data_KEPCO[[3]][,3]))		# METER_ID
# [1] 1234    1

# dim(unique(data_KEPCO[[4]][,2]))		# SNOC
# [1] 1229    1
# dim(unique(data_KEPCO[[4]][,3]))		# METER_ID
# [1] 1222    1


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