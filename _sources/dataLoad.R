##### Korea University
filesDir = "./_dataset_KoreaUniv/"
listFiles = list.files(filesDir)

listFiles_KoreaUniv = listFiles[grep("KoreaUniv", listFiles)]
len = length(listFiles_KoreaUniv)

# data_KoreaUniv = pbmclapply(1:len, readData, listFiles_KoreaUniv, filesDir, mc.cores=numCores)
data_KoreaUniv = pblapply(1:len, readData, listFiles_KoreaUniv, filesDir)





##### ENTSO-E
filesDir = "./_dataset_ENTSO-E/"
listFiles = list.files(filesDir)

listFiles_ENTSOE = listFiles[grep("ENTSO-E", listFiles)]
len = length(listFiles_ENTSOE)

# data_ENTSOE = pbmclapply(1:len, readData, listFiles_ENTSOE, filesDir, mc.cores=numCores)
data_ENTSOE = pblapply(1:len, readData, listFiles_ENTSOE, filesDir)





##### KEPCO
filesDir = "./_dataset_KEPCO/"
listFiles = list.files(filesDir)

listFiles_KEPCO = listFiles[grep("KEPCO", listFiles)]
len = length(listFiles_KEPCO)


### List로 저장되어있으며, 각각 2015, 2016, 2017, 2018년 데이터
# data_KEPCO = pbmclapply(1:len, readData, listFiles_KEPCO, filesDir, mc.cores=numCores)
data_KEPCO = pblapply(1:len, readData, listFiles_KEPCO, filesDir)


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
# data_KEPCO_2015 = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)
data_KEPCO_2015 = pblapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY)

# 2016
yearIDX = 2
# data_KEPCO_2016 = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)
data_KEPCO_2016 = pblapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY)

# 2017
yearIDX = 3
# data_KEPCO_2017 = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)
data_KEPCO_2017 = pblapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY)

# 2018
yearIDX = 4
# data_KEPCO_2018 = pbmclapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY, mc.cores=numCores)
data_KEPCO_2018 = pblapply(1:length(uniq_SNOC[[yearIDX]]), getPWRQTY)



rm(data_KEPCO)