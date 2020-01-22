temp_Scaling = function(i)	{	res = scale(modelData[[i]]);	return(as.numeric(res))	}



# input: likelihood를 모아놓은 vector
getBayesFactor = function(resultVec)
{
	tempFunc = function(initIDX, resultVec)	
	{
		if (resultVec[initIDX] == 0) 	{	return(rep(0, length(resultVec)))	}
		else 									{	return(resultVec / resultVec[initIDX])		}
	}
	res = pbmclapply(1:length(resultVec), tempFunc, resultVec, mc.cores=numCores)
	return(res)
}



getLinks = function(netMat)
{
	func_second = function(j, i, netMat)	{	if (netMat[i, j] != 0)	{	return(c(i, j, netMat[i, j]))	}	else {	return(NULL)	}	}
	func_first = function(i, netMat)	{	res = pbmclapply(1:ncol(netMat), func_second, i, netMat, mc.cores=numCores)	}
	
	resMat = unlist(pbmclapply(1:nrow(netMat), func_first, netMat, mc.cores=numCores))
	resMat = matrix(resMat, ncol=3, byrow=TRUE)
	resMat[,1] = resMat[,1] - 1;	resMat[,2] = resMat[,2] - 1
	colnames(resMat) = c("source", "target", "value")
	resMat = as.data.frame(resMat)
	return(resMat)
	
}



# elementsLen : 클러스터 안에 있는 요소들
getNodes = function(links, elementNames)
{
	elementsLen = length(elementNames)
	elements = (1:elementsLen) - 1
	clusterList = list()

	findElementInList_for_oneElement = function(inputList, inputElement)
	{
		tempFunc = function(inputVec, inputElement)	{	return(sum((inputVec == inputElement)*1))	}
		tempNode = which(unlist(pbmclapply(inputList, tempFunc, inputElement, mc.cores=numCores)) > 0)
		return(tempNode)
	}

	findElementInList_for_Elements = function(inputList, inputElements)
	{
		tempFunc = function(i, inputList, inputElements)	{	return(findElementInList_for_oneElement(inputList, inputElements[i]))	}
		
		res = unique(unlist(pbmclapply(1:length(inputElements), tempFunc, inputList, inputElements, mc.cores=numCores)))
		res = res[!is.na(res)]
		return(res)
	}


	for (i in 1:nrow(links))
	{
		selectedLInks = as.numeric(c(links[i, 1:2]))
		findElementRes = findElementInList_for_Elements(inputList = clusterList, inputElement = selectedLInks)
		
		if (length(findElementRes) > 0)
		{
			clusterList[[findElementRes]] = unique(c(clusterList[[findElementRes]], selectedLInks))
		} else {
			clusterList[[length(clusterList) + 1]] = unique(selectedLInks)
		}
	}



	for (i in 1:length(elements))
	{
		selectedElement = elements[i]
		findElementRes = findElementInList_for_oneElement(inputList = clusterList, inputElement = selectedElement)
		if (length(findElementRes) > 0)
		{
			clusterList[[findElementRes]] = unique(c(clusterList[[findElementRes]], selectedElement))
		} else {
			clusterList[[length(clusterList) + 1]] = unique(selectedElement)
		}
	}

	
	clusterLen = length(clusterList)																	# 클러스터 개수
	# print(paste("clusterList:", clusterList))
	# print(paste("clusterLen:", clusterLen))
	clustersNames = paste("Cluster", 1:clusterLen)				# 클러스터 네이밍
	elements = c(1:elementsLen) - 1
	
	# 원소가 속해있는 클러스터를 찾는 함수
	findClusterForElement = function(i, clusterList, elements)
	{
		element = elements[i]		# 선택된 원소
		tempFunc = function(j, clusterList, element)	{	if (sum((clusterList[[j]] == element)*1) > 0)	{	return(elements[j])	} else { return(NULL) }	}
		res = pbmclapply(1:length(clusterList), tempFunc, clusterList, element, mc.cores=numCores)
		return(res)
	}
	
	clusterIDX = pbmclapply(1:length(elements), findClusterForElement, clusterList, elements, mc.cores=numCores)
	clusterIDX = unlist(clusterIDX[!is.null(clusterIDX)]) + 1
	# print(clusterIDX)
	
	
	matchClusterName = function(i, clustersNames)	{	return(clustersNames[i])	}
	matchedClusterNames = unlist(pbmclapply(clusterIDX, matchClusterName, clustersNames, mc.cores=numCores))
	res = as.data.frame(cbind(elementNames, matchedClusterNames, 1))
	colnames(res) = c("name", "cluster", "size")
	return(res[1:elementsLen,])
}



plotClusterNetwork = function(links = links, nodes=  nodes)
{
	library(networkD3)
	return(
		forceNetwork(	Links = links, Nodes = nodes,
							Source = "source",	Target = "target", Value = "value",
							NodeID = "name", 	Group = "cluster",
							
							radiusCalculation = JS(" d.nodesize^2+10"),                         # How to use this column to calculate radius of nodes? (Java script expression)
							opacity = 1,
							opacityNoHover = 1,                                               # Opacity of nodes you do not hover
							colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),          # Javascript expression, schemeCategory10 and schemeCategory20 work
							fontSize = 20,                                                      # Font size of labels
							fontFamily = "serif",                                               # Font family for labels

							# custom edges
							arrows = TRUE,                                                     # Add arrows?
							linkColour = c("grey"),                                    # colour of edges
							linkWidth = JS("function(d) { return Math.sqrt(d.value); }"),       # edges width						
							
							# -- general parameters
							height = NULL,                                                      # height of frame area in pixels
							width = NULL,
							zoom = TRUE,                                                        # Can you zoom on the figure
							legend = TRUE,                                                      # add a legend?
							bounded = F
						)
	)
}