seqAllDatetime_KEPCO = function(year, inputData, POSIX_to_Char = FALSE)
{
	allDatetime = seqDateVec(year)
	allDatetime = POSIXct2Character(allDatetime)
	allDatetime = as.data.frame(as.matrix(allDatetime))
	colnames(allDatetime) = "YearDate"

	if (POSIX_to_Char)
	{
		dataDatetime = POSIXct2Character(data.frame(YearDate = inputData[,1]))
		inputData[,1] = dataDatetime
	}
	inputData = as.data.frame(inputData)
	
	resData = left_join(allDatetime, inputData, by="YearDate")
	return(resData)
}