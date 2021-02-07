getPWRQTY = function(SNOC_IDX)
{
	whichIDX = which(uniq_SNOC[[yearIDX]][SNOC_IDX] == data_KEPCO[[yearIDX]][,2])
	tempData = data_KEPCO[[yearIDX]][whichIDX,]
	
	res = seqAllDatetime_KEPCO(years[yearIDX], tempData)
	res = res[,c(1, 4)]
	return(res)
}