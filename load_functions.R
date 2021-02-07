dir_func = paste0(getwd(), "/_functions/")

listFiles = list.files(dir_func)
listFiles = listFiles[grep(".R", listFiles)]

for (i in 1:length(listFiles))
{
	source(paste0(dir_func, listFiles[i]), local=TRUE)
}



dir_func = paste0(getwd(), "/_functions_makeSyntheticData/")

listFiles = list.files(dir_func)
listFiles = listFiles[grep(".R", listFiles)]

for (i in 1:length(listFiles))
{
	source(paste0(dir_func, listFiles[i]), local=TRUE)
}