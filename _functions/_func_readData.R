readData = function(i, inputListFiles, filesDir)	
{
	return(read_feather(paste(filesDir, inputListFiles[i], sep="")))	
}