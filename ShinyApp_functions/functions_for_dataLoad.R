##### 숫자로 된 파일명의 정렬
fileSort = function(listFilesVec)
{
	fileNum = as.numeric(list_to_matrix(strsplit(listFilesVec, "[.]"), 2)[,1])
	return(listFilesVec[order(fileNum)])
}



##### 파일 읽기: obsData
readObsData = function(inputDir)
{
	return(unlist(readRDS(paste0(inputDir, "obsDataVec.RDS"))))
}
readObsData = cmpfun(readObsData)



##### 파일 읽기: modelData
readModelData = function(inputDir, i)
{
	resData = read_feather(paste0(inputDir, fileSort(list.files(inputDir))[i]))
	return(resData)
}
readModelData = cmpfun(readModelData)



##### 파일 읽기: partialData
readPartialData = function(inputDir, i)
{
	listFiles = fileSort(list.files(inputDir))
	len = length(listFiles)
	
	return(return(readRDS(paste0(inputDir, listFiles[i]))))
}
readPartialData = cmpfun(readPartialData)