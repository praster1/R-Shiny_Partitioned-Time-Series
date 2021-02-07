########################################
########## partial data를 미리 저장해둔다.
########################################
rm(list = ls())

setwd("~/NAS/Research/KEPCO")


########## Load Library and Functions
# devtools::install_github("praster1/JSFunction", force=TRUE)
source("load_libraries.R", local=TRUE)
source("load_functions.R", local=TRUE)

numCores = detectCores()



########## 데이터 불러오기
filesDir = "./_Dataset/"
listFiles = list.files(filesDir)




##### Synthetic Data
data_modelNS = qread("./_Dataset/Synthetic_ModelNS.QS")
data_modelNS_params = qread("./_Dataset/Synthetic_ModelNS_params.QS")
data_modelS = qread("./_Dataset/Synthetic_ModelNS.QS")
data_modelS_params = qread("./_Dataset/Synthetic_ModelS_params.QS")


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





saveDir = "_Dataset_PartialData"

########## Synthetic Data
readData_SynthetidData = function(saveDir)
{
	saveDir = paste0("./", saveDir)
	listFiles = list.files(saveDir)
	listFiles = listFiles[grep("feather", listFiles)]
	
	func_readData = function(i)	{	return(read_feather(paste0(saveDir, "/", listFiles[i])))		}
	resData = pbmclapply(1:length(listFiles), func_readData, mc.cores=numCores)
	return(resData)
}


saveShinyData = function(inputDataList, saveDir)
{
	len = length(inputDataList)
	for (i in 1:len)
	{
		print(paste(i, "/", len))
		
		resSaveDir = paste0("./", saveDir, "/", i, ".feather")
		print(resSaveDir)
		write_feather(as.data.frame(inputDataList[[i]]), resSaveDir)
		# Sys.sleep(1)
	}
}


savePartialData = function(inputDataList, saveDir, partialLen =  100, skipVal = "none")
{
	len = length(inputDataList)
	for (i in 1:len)
	{
		print(paste(i, "/", len))
		resPartialData = getPartialData(dataVec=as.numeric(as.matrix(inputDataList[[i]])), partialLength=partialLen, 
														stepSize=1, skipVal = skipVal,
														fileProcess=FALSE, print=FALSE, printStep=1000,
														tempFolderName = "temp",	multicore=FALSE, numCores=NULL)
		# resSaveDir = paste0("./", saveDir, "/", i, ".RDS")
		resSaveDir = paste0("./", saveDir, "/", i, ".QS")
		print(resSaveDir)
		# saveRDS(resPartialData, resSaveDir)
		qsave(resPartialData, resSaveDir)
	}
}





##### Korea University
getkWh_KoreaUniv = function(i)
(
	return(data_KoreaUniv[[i]][,c(2, 3, 4)])
)
data_KoreaUniv = pbmclapply(1:length(data_KoreaUniv) , getkWh_KoreaUniv, mc.cores=numCores)

# temp_none = checkPartialData(inputDataList=data_KoreaUniv, partialLen=96, skipVal = "none")
# temp_NA = checkPartialData(inputDataList=data_KoreaUniv, partialLen=96, skipVal = "NA")


saveShinyData(inputDataList=data_KoreaUniv, saveDir="ShinyApp_dataset_KoreaUniv")
# savePartialData(inputDataList=data_KoreaUniv, saveDir="_partialDataset_KoreaUniv", partialLen=96)
# saveRDS(temp_none[[1]], "_partialDataset_KoreaUniv/1.RDS")
# saveRDS(temp_NA[[2]], "_partialDataset_KoreaUniv/2.RDS")
# saveRDS(temp_NA[[3]], "_partialDataset_KoreaUniv/3.RDS")
# saveRDS(temp_none[[4]], "_partialDataset_KoreaUniv/4.RDS")
# qsave(temp_none[[1]], "_partialDataset_KoreaUniv/1.QS")
# qsave(temp_NA[[2]], "_partialDataset_KoreaUniv/2.QS")
# qsave(temp_NA[[3]], "_partialDataset_KoreaUniv/3.QS")
# qsave(temp_none[[4]], "_partialDataset_KoreaUniv/4.QS")


### for Check
fileDir_partial = "./_partialDataset_KoreaUniv/"
listFiles_partial = list.files(fileDir_partial)
partialData = readRDS(paste0(fileDir_partial, listFiles_partial[2]))
str(partialData)










##### ENTSO-E
temp_none = checkPartialData(inputDataList=data_ENTSOE, partialLen=4*24*7, skipVal = "none")
temp_NA = checkPartialData(inputDataList=data_ENTSOE, partialLen=4*24*7, skipVal = "NA")

getLength = function(i, inputList)
{
	return(length(inputList[[i]]$data))
}
unlist(pbmclapply(1:length(temp_none), getLength, temp_none, mc.cores=numCores))
unlist(pbmclapply(1:length(temp_NA), getLength, temp_NA, mc.cores=numCores))


### scaling
# data_ENTSOE = pbmclapply(data_ENTSOE, scale, mc.cores=numCores)
# data_ENTSOE = pbmclapply(data_ENTSOE, as.numeric, mc.cores=numCores)


saveShinyData = function(inputDataList, saveDir)
{
	len = length(inputDataList)
	for (i in 1:len)
	{
		print(paste(i, "/", len))
		
		resSaveDir = paste0("./", saveDir, "/", i, ".feather")
		print(resSaveDir)
		write_feather(as.data.frame(as.numeric(scale(inputDataList[[i]]))), resSaveDir)
		# write_feather(as.data.frame(inputDataList[[i]]), resSaveDir)
		# Sys.sleep(1)
	}
}


savePartialData = function(inputDataList, saveDir, partialLen =  100, skipVal = "none")
{
	len = length(inputDataList)
	for (i in 1:len)
	{
		print(paste(i, "/", len))
		resPartialData = getPartialData(dataVec=as.numeric(scale(as.matrix(inputDataList[[i]]))), partialLength=partialLen, 
																stepSize=1, skipVal = skipVal,
																fileProcess=FALSE, print=FALSE, printStep=1000,
																tempFolderName = "temp",	multicore=FALSE, numCores=NULL)
		# resPartialData = getPartialData(dataVec=as.numeric(as.matrix(inputDataList[[i]])), partialLength=partialLen, 
														# stepSize=1, skipVal = skipVal,
														# fileProcess=FALSE, print=FALSE, printStep=1000,
														# tempFolderName = "temp",	multicore=FALSE, numCores=NULL)
		# resSaveDir = paste0("./", saveDir, "/", i, ".RDS")
		resSaveDir = paste0("./", saveDir, "/", i, ".QS")
		print(resSaveDir)
		# saveRDS(resPartialData, resSaveDir)
		qsave(resPartialData, resSaveDir)
	}
}




saveShinyData(inputDataList=data_ENTSOE, saveDir="ShinyApp_dataset_ENTSO-E")
savePartialData(inputDataList=data_ENTSOE, saveDir="_partialDataset_ENTSO-E", partialLen=4*24*7)


### for Check
# fileDir_partial = "./_partialDataset_ENTSO-E/"
# listFiles_partial = list.files(fileDir_partial)

# partialData = readRDS(paste0(fileDir_partial, listFiles_partial[2]))
# str(partialData)






getPWRQTY = function(SNOC_IDX)
{
	whichIDX = which(uniq_SNOC[[yearIDX]][SNOC_IDX] == data_KEPCO[[yearIDX]][,2])
	tempData = data_KEPCO[[yearIDX]][whichIDX,]
	
	res = seqAllDatetime_KEPCO(years[yearIDX], tempData)
	res = res[,c(1, 4)]
	return(res)
}


##### KEPCO
getkWh_KEPCO = function(i, inputData)
(
	return(inputData[[i]][,2])
)
data_KEPCO_2015 = pbmclapply(1:length(data_KEPCO_2015) , getkWh_KEPCO, data_KEPCO_2015, mc.cores=numCores)
data_KEPCO_2016 = pbmclapply(1:length(data_KEPCO_2016) , getkWh_KEPCO, data_KEPCO_2016,  mc.cores=numCores)
data_KEPCO_2017 = pbmclapply(1:length(data_KEPCO_2017) , getkWh_KEPCO, data_KEPCO_2017, mc.cores=numCores)
data_KEPCO_2018 = pbmclapply(1:length(data_KEPCO_2018) , getkWh_KEPCO, data_KEPCO_2018, mc.cores=numCores)


saveShinyData = function(inputDataList, saveDir)
{
	len = length(inputDataList)
	for (i in 1:len)
	{
		print(paste(i, "/", len))
		
		resSaveDir = paste0("./", saveDir, "/", i, ".feather")
		print(resSaveDir)
		write_feather(as.data.frame(as.numeric(scale(as.numeric(inputDataList[[i]])))), resSaveDir)
		# write_feather(as.data.frame(inputDataList[[i]]), resSaveDir)
		# Sys.sleep(1)
	}
}

savePartialData = function(inputDataList, saveDir, partialLen =  100, skipVal = "none")
{
	len = length(inputDataList)
	for (i in 1:len)
	{
		print(paste(i, "/", len))
		resPartialData = getPartialData(dataVec=as.numeric(scale(as.matrix(as.numeric(inputDataList[[i]])))), partialLength=partialLen, 
																stepSize=1, skipVal = skipVal,
																fileProcess=FALSE, print=FALSE, printStep=1000,
																tempFolderName = "temp",	multicore=FALSE, numCores=NULL)
		# resPartialData = getPartialData(dataVec=as.numeric(as.matrix(inputDataList[[i]])), partialLength=partialLen, 
														# stepSize=1, skipVal = skipVal,
														# fileProcess=FALSE, print=FALSE, printStep=1000,
														# tempFolderName = "temp",	multicore=FALSE, numCores=NULL)
		# resSaveDir = paste0("./", saveDir, "/", i, ".RDS")
		resSaveDir = paste0("./", saveDir, "/", i, ".QS")
		print(resSaveDir)
		# saveRDS(resPartialData, resSaveDir)
		qsave(resPartialData, resSaveDir)
	}
}



# 2015
# temp_none = checkPartialData(inputDataList=data_KEPCO_2015, partialLen=4*24, skipVal = "none")
# temp_NA = checkPartialData(inputDataList=data_KEPCO_2015, partialLen=4*24, skipVal = "NA")

# getLength = function(i, inputList)
# {
	# return(length(inputList[[i]]$data))
# }
# unlist(pbmclapply(1:length(temp_none), getLength, temp_none, mc.cores=numCores))
# unlist(pbmclapply(1:length(temp_NA), getLength, temp_NA, mc.cores=numCores))

saveShinyData(inputDataList=data_KEPCO_2015, saveDir="ShinyApp_dataset_KEPCO_2015")
savePartialData(inputDataList=data_KEPCO_2015, saveDir="_partialDataset_KEPCO_2015", partialLen=4*24, skipVal = "NA")



# 2016
# temp_none = checkPartialData(inputDataList=data_KEPCO_2016, partialLen=4*24, skipVal = "none")
# temp_NA = checkPartialData(inputDataList=data_KEPCO_2016, partialLen=4*24, skipVal = "NA")

# getLength = function(i, inputList)
# {
	# return(length(inputList[[i]]$data))
# }
# unlist(pbmclapply(1:length(temp_none), getLength, temp_none, mc.cores=numCores))
# unlist(pbmclapply(1:length(temp_NA), getLength, temp_NA, mc.cores=numCores))

saveShinyData(inputDataList=data_KEPCO_2016, saveDir="ShinyApp_dataset_KEPCO_2016")
savePartialData(inputDataList=data_KEPCO_2016, saveDir="_partialDataset_KEPCO_2016", partialLen=4*24, skipVal = "NA")



# 2017
# temp_none = checkPartialData(inputDataList=data_KEPCO_2017, partialLen=4*24, skipVal = "none")
# temp_NA = checkPartialData(inputDataList=data_KEPCO_2017, partialLen=4*24, skipVal = "NA")

# getLength = function(i, inputList)
# {
	# return(length(inputList[[i]]$data))
# }
# unlist(pbmclapply(1:length(temp_none), getLength, temp_none, mc.cores=numCores))
# unlist(pbmclapply(1:length(temp_NA), getLength, temp_NA, mc.cores=numCores))

saveShinyData(inputDataList=data_KEPCO_2017, saveDir="ShinyApp_dataset_KEPCO_2017")
savePartialData(inputDataList=data_KEPCO_2017, saveDir="_partialDataset_KEPCO_2017", partialLen=4*24, skipVal = "NA")



# 2018
# temp_none = checkPartialData(inputDataList=data_KEPCO_2018, partialLen=4*24, skipVal = "none")
# temp_NA = checkPartialData(inputDataList=data_KEPCO_2018, partialLen=4*24, skipVal = "NA")

# getLength = function(i, inputList)
# {
	# return(length(inputList[[i]]$data))
# }
# unlist(pbmclapply(1:length(temp_none), getLength, temp_none, mc.cores=numCores))
# unlist(pbmclapply(1:length(temp_NA), getLength, temp_NA, mc.cores=numCores))

saveShinyData(inputDataList=data_KEPCO_2018, saveDir="ShinyApp_dataset_KEPCO_2018")
savePartialData(inputDataList=data_KEPCO_2018, saveDir="_partialDataset_KEPCO_2018", partialLen=4*24, skipVal = "NA")


### for Check
fileDir_partial = "./_partialDataset_KEPCO_2018/"
listFiles_partial = list.files(fileDir_partial)

partialData = readRDS(paste0(fileDir_partial, listFiles_partial[2]))
str(partialData)