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



########## Load Sources
dir_sources = "./_sources/"
source(paste0(dir_sources, "dataLoad.R"), local=TRUE)	# 데이터 불러오기





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
		Sys.sleep(1)
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
		resSaveDir = paste0("./", saveDir, "/", i, ".RDS")
		print(resSaveDir)
		saveRDS(resPartialData, resSaveDir)
	}
}


### Model NS
saveDir = "_dataset_SyntheticData/NS"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS", partialLen=100)

### Model NS-1
saveDir = "_dataset_SyntheticData/NS-1"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS-1")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS-1", partialLen=100)

### Model NS-2
saveDir = "_dataset_SyntheticData/NS-2"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS-2")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS-2", partialLen=100)

### Model NS-3
saveDir = "_dataset_SyntheticData/NS-3"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS-3")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS-3", partialLen=100)

### Model NS-4
saveDir = "_dataset_SyntheticData/NS-4"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS-4")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS-4", partialLen=100)

### Model NS-5
saveDir = "_dataset_SyntheticData/NS-5"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS-5")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS-5", partialLen=100)

### Model NS-6
saveDir = "_dataset_SyntheticData/NS-6"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS-6")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS-6", partialLen=100)

### Model NS-7
saveDir = "_dataset_SyntheticData/NS-7"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/NS-7")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/NS-7", partialLen=100)



##### with Structural Breaks

### Model S
saveDir = "_dataset_SyntheticData/S"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S", partialLen=100)

### Model S-1
saveDir = "_dataset_SyntheticData/S-1"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S-1")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S-1", partialLen=100)

### Model S-2
saveDir = "_dataset_SyntheticData/S-2"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S-2")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S-2", partialLen=100)

### Model S-3
saveDir = "_dataset_SyntheticData/S-3"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S-3")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S-3", partialLen=100)

### Model S-4
saveDir = "_dataset_SyntheticData/S-4"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S-4")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S-4", partialLen=100)

### Model S-5
saveDir = "_dataset_SyntheticData/S-5"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S-5")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S-5", partialLen=100)

### Model S-6
saveDir = "_dataset_SyntheticData/S-6"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S-6")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S-6", partialLen=100)

### Model S-7	#
saveDir = "_dataset_SyntheticData/S-7"
tempDataList = readData_SynthetidData(saveDir)
saveShinyData(inputDataList=tempDataList, saveDir="ShinyApp_dataset_SyntheticData/S-7")
savePartialData(inputDataList=tempDataList, saveDir="_partialDataset_SyntheticData/S-7", partialLen=100)





checkPartialData = function(inputDataList,  partialLen =  100, skipVal = "none")
{
	len = length(inputDataList)
	resPartialData = NULL
	for (i in 1:len)
	{
		print(paste(i, "/", len))
		resPartialData[[i]] = getPartialData(dataVec=as.numeric(as.matrix(inputDataList[[i]])), partialLength=partialLen, 
														stepSize=1, skipVal = skipVal,
														fileProcess=FALSE, print=FALSE, printStep=1000,
														tempFolderName = "temp",	multicore=FALSE, numCores=NULL)
	}
	return(resPartialData)
}


##### Korea University
getkWh_KoreaUniv = function(i)
(
	return(data_KoreaUniv[[i]][,4])
)
data_KoreaUniv = pbmclapply(1:length(data_KoreaUniv) , getkWh_KoreaUniv, mc.cores=numCores)

temp_none = checkPartialData(inputDataList=data_KoreaUniv, partialLen=96, skipVal = "none")
temp_NA = checkPartialData(inputDataList=data_KoreaUniv, partialLen=96, skipVal = "NA")


saveShinyData(inputDataList=data_KoreaUniv, saveDir="ShinyApp_dataset_KoreaUniv")
# savePartialData(inputDataList=data_KoreaUniv, saveDir="_partialDataset_KoreaUniv", partialLen=96)
saveRDS(temp_none[[1]], "_partialDataset_KoreaUniv/1.RDS")
saveRDS(temp_NA[[2]], "_partialDataset_KoreaUniv/2.RDS")
saveRDS(temp_NA[[3]], "_partialDataset_KoreaUniv/3.RDS")
saveRDS(temp_none[[4]], "_partialDataset_KoreaUniv/4.RDS")


### for Check
fileDir_partial = "./_partialDataset_KoreaUniv/"
listFiles_partial = list.files(fileDir_partial)
partialData = readRDS(paste0(fileDir_partial, listFiles_partial[2]))
str(partialData)





##### ENTSO-E
# temp_none = checkPartialData(inputDataList=data_ENTSOE, partialLen=4*24*7, skipVal = "none")
# temp_NA = checkPartialData(inputDataList=data_ENTSOE, partialLen=4*24*7, skipVal = "NA")

# getLength = function(i, inputList)
# {
	# return(length(inputList[[i]]$data))
# }
# unlist(pbmclapply(1:length(temp_none), getLength, temp_none, mc.cores=numCores))
# unlist(pbmclapply(1:length(temp_NA), getLength, temp_NA, mc.cores=numCores))

saveShinyData(inputDataList=data_ENTSOE, saveDir="ShinyApp_dataset_ENTSO-E")
savePartialData(inputDataList=data_ENTSOE, saveDir="_partialDataset_ENTSO-E", partialLen=4*24*7)


### for Check
fileDir_partial = "./_partialDataset_ENTSO-E/"
listFiles_partial = list.files(fileDir_partial)

partialData = readRDS(paste0(fileDir_partial, listFiles_partial[2]))
str(partialData)





##### KEPCO
getkWh_KEPCO = function(i, inputData)
(
	return(inputData[[i]][,2])
)
data_KEPCO_2015 = pbmclapply(1:length(data_KEPCO_2015) , getkWh_KEPCO, data_KEPCO_2015, mc.cores=numCores)
data_KEPCO_2016 = pbmclapply(1:length(data_KEPCO_2016) , getkWh_KEPCO, data_KEPCO_2016,  mc.cores=numCores)
data_KEPCO_2017 = pbmclapply(1:length(data_KEPCO_2017) , getkWh_KEPCO, data_KEPCO_2017, mc.cores=numCores)
data_KEPCO_2018 = pbmclapply(1:length(data_KEPCO_2018) , getkWh_KEPCO, data_KEPCO_2018, mc.cores=numCores)


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