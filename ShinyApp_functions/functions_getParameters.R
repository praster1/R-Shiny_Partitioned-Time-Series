### 파라메터 불러오기
getParameters = function(datasetSelector, inputParams, modelSelectorIDX)
{
	print(datasetSelector)
	
	res = NULL
	
	list_NS = c("NS", "NS1", "NS", "NS_2", "NS_3", "NS_4", "NS_5", "NS_6", "NS_7")
	list_S = c("S", "S_1", "S_2", "S_3", "S_4", "S_5", "S_6", "S_7")

	# Synthetic Models - NS
	if (sum((datasetSelector == list_NS)*1) > 0){		
		res = inputParams[[modelSelectorIDX]]
		
	# Synthetic Models - S
	} else if (sum((datasetSelector == list_S)*1) > 0){		
		res = inputParams[modelSelectorIDX]
		res = strsplit(res, "/")[[1]]
		res = as.numeric(unlist(strsplit(res, "="))[seq(2, length(unlist(strsplit(res, "="))), by=2)])
	}
	
	res = matrix(res, ncol=3, byrow=T)
	colnames(res) = c("mu", "sigma", "alpha")
	
	return(res)
}


getParameters_multi = function(selectedModelSelectorIDX, inputDatasetSelector, inputParams)
{
	return(getParameters(inputDatasetSelector, inputParams, selectedModelSelectorIDX))
}
