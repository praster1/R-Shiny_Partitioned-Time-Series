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


readData = function(fileDir)
{
	listFiles = list.files(fileDir)
	tempFunc = function(i)	{	return(read_feather(paste0(fileDir, listFiles[i])))	}
	
	resData = NULL
	resData = pbmclapply(1:length(listFiles), tempFunc, mc.cores=numCores)
	
	return(resData)
}





########## Synthetic Data
### Model NS
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model NS-1
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS-1/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS-1/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS-1/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model NS-2
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS-2/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS-2/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS-2/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model NS-3
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS-3/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS-3/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS-3/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model NS-4
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS-4/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS-4/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS-4/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model NS-5
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS-5/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS-5/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS-5/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model NS-6
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS-6/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS-6/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS-6/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model NS-7
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/NS-7/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/NS-7/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/NS-7/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))





##### with Structural Breaks

### Model S
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model S-1
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S-1/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S-1/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S-1/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model S-2
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S-2/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S-2/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S-2/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model S-3
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S-3/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S-3/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S-3/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model S-4
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S-4/")
6
partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S-4/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S-4/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model S-5
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S-5/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S-5/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S-5/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model S-6
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S-6/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S-6/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S-6/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



### Model S-7
data_Synthetic =  readData("./ShinyApp_dataset_SyntheticData/S-7/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_Synthetic[[1]])))[500:(599+partialLen - 1)]
rm(data_Synthetic)


fileDir_partial = "./_partialDataset_SyntheticData/S-7/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_SyntheticData/S-7/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RD4S"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))





##### Korea University
data_KoreaUniv = readData("./ShinyApp_dataset_KoreaUniv/")

partialLen = 96
obsDataVec = (as.numeric(as.matrix(data_KoreaUniv[[1]])))[3000:(3099+partialLen - 1)]
rm(data_KoreaUniv)


fileDir_partial = "./_partialDataset_KoreaUniv/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_KoreaUniv/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))





##### ENTSO-E
data_ENTSOE = readData("./ShinyApp_dataset_ENTSO-E/")
# data_ENTSOE = pbmclapply(data_ENTSOE, scale)
# data_ENTSOE = pbmclapply(data_ENTSOE, as.numeric)

partialLen = 4*24*7
obsDataVec = (as.numeric(as.matrix(data_ENTSOE[[1]])))[3000:(3099+partialLen - 1)]
# rm(data_ENTSOE)


fileDir_partial = "./_partialDataset_ENTSO-E/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_ENTSO-E/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))





##### KEPCO

# 2015
data_KEPCO2015 = readData("./ShinyApp_dataset_KEPCO_2015/")

partialLen = 4*24
obsDataVec = (as.numeric(as.matrix(data_KEPCO2015[[1]])))[61:(160+partialLen - 1)]
rm(data_KEPCO2015)

fileDir_partial = "./_partialDataset_KEPCO_2015/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_KEPCO_2015/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



# 2016
data_KEPCO2016 = readData("./ShinyApp_dataset_KEPCO_2016/")

partialLen = 4*24
obsDataVec = (as.numeric(as.matrix(data_KEPCO2016[[1]])))[381:(480+partialLen - 1)]
rm(data_KEPCO2016)

fileDir_partial = "./_partialDataset_KEPCO_2016/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_KEPCO_2016/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



# 2017
data_KEPCO2017 = readData("./ShinyApp_dataset_KEPCO_2017/")

partialLen = 4*24
obsDataVec = (as.numeric(as.matrix(data_KEPCO2017[[1]])))[381:(480+partialLen - 1)]
rm(data_KEPCO2017)

fileDir_partial = "./_partialDataset_KEPCO_2017/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_KEPCO_2017/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))



# 2018
data_KEPCO2018 = readData("./ShinyApp_dataset_KEPCO_2018/")

partialLen = 4*24
obsDataVec = (as.numeric(as.matrix(data_KEPCO2018[[1]])))[409:(508+partialLen - 1)]
rm(data_KEPCO2018)

fileDir_partial = "./_partialDataset_KEPCO_2018/"
listFiles_partial = list.files(fileDir_partial)
modelLen = length(listFiles_partial)

source("./_sources/getDistAll.R", local=TRUE)

saveResultDir = "./_resultSet_KEPCO_2018/"
saveRDS(obsDataVec, paste0(saveResultDir, "obsDataVec.RDS"))
saveRDS(res, paste0(saveResultDir, "resultSet.RDS"))

