########## Scaling
##### Scaling of obsData
scaling_obsData = function(obsData, center = TRUE, scale = TRUE)
{
	cat("::::: scaling_obsData\n")

	source(paste0(dir_functions_dataLoad, "dataLoad.R"), local=TRUE)	
	resData = scale(obsData, center=center, scale=scale)
	return(resData)
}
scaling_obsData = cmpfun(scaling_obsData)





##### Scaling of modelData
scaling_modelData = function(inputWhichIDX, center = TRUE, scale = TRUE)
{
	cat("::::: scaling_modelData\n")
	
		
	### Internal Functions
	tempReadModelData = function(i)	{	return(readModelData(datasetDir, i))	}
	scaling_modelData_resData = function(i, inputModelData, center = TRUE, scale = TRUE)	{	return(scale(inputModelData[[i]], center = center, scale = scale))	}

	
	
	### Run
	tempResData = NULL
	source(paste0(dir_functions_dataLoad, "dataLoad.R"), local=TRUE)	
	
	
	# Step 1
	cat(paste("- inputWhichIDX:", inputWhichIDX, "\n"))
	cat(paste("- datasetDir:", datasetDir, "\n"))
	
	if (length(inputWhichIDX))	{
		tempResData = tempReadModelData(inputWhichIDX)
		tempResData = list(tempResData)
	} else {
		tempResData = pbmclapply(inputWhichIDX, tempReadModelData, mc.cores=numCores) 
	}
	
	
	# Step 2
	cat(paste("- length(tempResData):", length(tempResData), "\n"))
	resData = pbmclapply(1:length(tempResData), scaling_modelData_resData, tempResData, center=center, scale=scale, mc.cores=numCores)
	
	return(resData)
}
scaling_modelData = cmpfun(scaling_modelData)





### Scaling of partialData
scaling_partialData = function(inputWhichIDX, center = TRUE, scale = TRUE)
{
	cat("::::: scaling_partialData\n")

	
	# Internal Functions
	tempReadPartialData = function(i)	{	return(readPartialData(partialDatasetDir, i)$data)	}


	scaling_partialData_Data = function(i, inputModelData, center = TRUE, scale = TRUE)
	{
		tempFunc = function(j, inputModelData_temp, center = TRUE, scale = TRUE)	{	return(scale(inputModelData_temp[[j]], center = center, scale = scale))	}
	
		tempData = inputModelData[[i]]
		res = pbmclapply(	1:length(tempData), tempFunc, inputModelData_temp = tempData, center = center, scale = scale, mc.cores=numCores)
		return(res)
	}



	# Run
	tempResData = NULL
	source(paste0(dir_functions_dataLoad, "dataLoad.R"), local=TRUE)	


	# Step 1	
	cat(paste("- inputWhichIDX:", inputWhichIDX, "\n"))
	cat(paste("- partialDatasetDir:", partialDatasetDir, "\n"))
	
	if (length(inputWhichIDX))	{
		tempResData = tempReadPartialData(inputWhichIDX)
		tempResData = list(tempResData)
	} else {
		tempResData = pbmclapply(inputWhichIDX, tempReadPartialData, mc.cores=numCores) 
	}


	# Step 2	
	cat(paste("- length(tempResData):", length(tempResData), "\n"))
	resData = pbmclapply(1:length(tempResData), scaling_partialData_Data, tempResData, center=center, scale=scale, mc.cores=numCores)
	
	return(resData)
}
scaling_partialData = cmpfun(scaling_partialData)
