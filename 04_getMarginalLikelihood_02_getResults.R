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
saveResultDir = "./_resultSet_SyntheticData/NS-4/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-5
saveResultDir = "./_resultSet_SyntheticData/NS-5/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-6
saveResultDir = "./_resultSet_SyntheticData/NS-6/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model NS-7
saveResultDir = "./_resultSet_SyntheticData/NS-7/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### with Structural Breaks

### Model S
saveResultDir = "./_resultSet_SyntheticData/S/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-1
saveResultDir = "./_resultSet_SyntheticData/S-1/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-2
saveResultDir = "./_resultSet_SyntheticData/S-2/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-3
saveResultDir = "./_resultSet_SyntheticData/S-3/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-4
saveResultDir = "./_resultSet_SyntheticData/S-4/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-5
saveResultDir = "./_resultSet_SyntheticData/S-5/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-6
saveResultDir = "./_resultSet_SyntheticData/S-6/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


### Model S-7
saveResultDir = "./_resultSet_SyntheticData/S-7/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### Korea University
saveResultDir = "./_resultSet_KoreaUniv/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### ENTSO-E
saveResultDir = "./_resultSet_ENTSO-E/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))





##### KEPCO

# 2015
saveResultDir = "./_resultSet_KEPCO_2015/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


# 2016
saveResultDir = "./_resultSet_KEPCO_2016/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


# 2017
saveResultDir = "./_resultSet_KEPCO_2017/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))


# 2018
saveResultDir = "./_resultSet_KEPCO_2018/"
obsDataVec = readRDS(paste0(saveResultDir, "obsDataVec.RDS"))
res = readRDS(paste0(saveResultDir, "resultSet.RDS"))
