require(compiler)


# dataVec을 stepSize만큼 건너뛰면서 partialLength씩 자른다.
# return: data, index
# skipVal: 만일 partial Vec에 특정 값이 포함될 경우, 그 벡터는 skip한다.
# 			"none"이면 모두 포함
#			"none", "NA", "NULL", (숫자)
# fileProcess: 메모리가 부족하여 분할 데이터 생성이 어려운 상황에서는 TRUE로 바꿔준다.
# 					그러면 파일 처리 방식을 차용하여 메모리 부족 현상을 해소할 수 있다.
# 					다만 처리 속도가 느려진다.
getPartialData = function(dataVec, partialLength, stepSize, skipVal = "none",
										fileProcess=FALSE, print=FALSE, printStep=1000,
										tempFolderName = "temp",
										multicore=TRUE, numCores=NULL)
{
    if (is.null(partialLength))                     {        stop("partialLength is NULL.");    }
    if (is.null(stepSize))                          {        stop("stepSize is NULL.");    }
    if (partialLength < stepSize)               {        stop("partialLength must greater than stepSize");    }
    if (partialLength > length(dataVec))     {        stop("dataVec must greater than partialLength");    }
    
	if (multicore)
	{
		require(parallel)
		if (is.null(numCores))	{	numCores = detectCores()	}
	}

	vecLen = length(dataVec)
	resIndex = NULL;	resData = NULL;		# 결과는 여기에 저장된다.
	
	##### skipVal이 연속일 경우, 이를 1개로 줄인다.
	idx = NULL
	if (skipVal == "NA") {									## "NA"
		idx = sort(unique(c(which(!is.na(dataVec)), which(!is.na(dataVec)) + 1)))
		idx = idx[idx != length(dataVec)]
	} else if (skipVal == "NULL") {					## "NULL"
		idx = sort(unique(c(which(!is.null(dataVec)), which(!is.null(dataVec)) + 1)))
		idx = idx[idx != length(dataVec)]
	} else if (class(skipVal) == "numeric") {			## 숫자
		idx = sort(unique(c(which(dataVec != skipVal), which(dataVec != skipVal) + 1)))
		idx = idx[idx != length(dataVec)]
	} else if (skipVal == "none") {	idx = 1:length(dataVec) }


	
	####################
	##### 파일 처리
	####################
	if (fileProcess) {
		### 기존에 파일이 존재한다면 삭제
		if (dir.exists(paste("./", tempFolderName, sep="")))	{	unlink(paste("./", tempFolderName, sep=""), recursive=TRUE);	}
		dir.create(tempFolderName)
		
		tempData = NULL;	tempIndex = NULL;	i = 1;		
		### skipVal이 포함된 벡터는 넘어가고, 포함되지 않은 벡터는 파일로 저장한다.
		while(max(i+partialLength-1) < vecLen)
		{
			tempIndex = i:(i+partialLength-1)
			tempData = dataVec[tempIndex]

			removeIdx = NA;
			# skipVal이 포함된 벡터를 파악한다.
			if (skipVal == "NA") 							{	removeIdx = which(is.na(tempData));	 	}	## "NA"
			else if (skipVal == "NULL") 				{	removeIdx = which(is.null(tempData));		}	## "NULL"
			else if (class(skipVal) == "numeric") 	{	removeIdx = which(tempData == skipVal)	}	## 숫자
			else if (skipVal == "none") {	}

			# skipVal이 포함된 벡터는 스킵하고, 포함되지 않은 벡터는 index만 파일로 저장한다.
			if (sum(removeIdx) > 0) { }
			else 
			{
				saveRDS(tempIndex, file=paste("./", tempFolderName , "/tempIndex_", i, "_", (i+partialLength-1), ".rds", sep=""))
			}
			
			# 경과 출력
			if(print) 	{ if(i %% printStep == 0)	{	print(paste("파일 저장:", i, "/", vecLen-partialLength+1, "/", tempFolderName));	} 	}
			
			i = i + 1
		}
		
		### 파일로 저장된 index 목록을 불러온 후, 이를 이용하여 resData, resIndex를 저장한다.
		indexList = list.files(paste("./", tempFolderName, sep=""))
		i = 1;		resCounter = 1
		len = length(indexList)
		if (len > 0)
		{
			for (i in 1:len)
			{
				fileName = paste("./", tempFolderName, "/", indexList[i], sep="")
				tempIndex = readRDS(fileName);			tempData = dataVec[tempIndex];
				resIndex[[resCounter]] = tempIndex;	resData[[resCounter]] = tempData;
				resCounter = resCounter + 1;
				
				# 경과 출력
				if(print) 	{ if(i %% printStep == 0)	{	print(paste("process:", i, "/", len, "/", tempFolderName));	} 	}
			}
		}
		unlink(paste("./", tempFolderName, sep=""), recursive=TRUE);	# temp 폴더 삭제
	
	####################
	##### 메모리 처리
	####################
	} else {
		### skipVal이 포함된 벡터까지 포함해서 일단 분할한다.
		if (multicore) {
			resIndex = matrix(unlist(mclapply(seq(1, vecLen-partialLength + 1, by=stepSize), seq, by=1, length=partialLength, mc.cores=numCores)), byrow=T, ncol=partialLength)
		} else {
			resIndex = matrix(unlist(lapply(seq(1, vecLen-partialLength + 1, by=stepSize), seq, by=1, length=partialLength)), byrow=T, ncol=partialLength)
		}
		resData = matrix(dataVec[resIndex], ncol=partialLength)
		
		### skipVal이 포함된 벡터는 삭제하고, 포함되지 않은 벡터는 resIndex, resData에 list로 저장한다.
		removeIdx = NA;
		# skipVal이 포함된 벡터는 삭제한다.
		if (skipVal == "NA") {									## "NA"
			lenOfNA = function(vec)		{	return(length(vec[is.na(vec)]))		}	
			removeIdx = apply(resData, 1, lenOfNA)
		} else if (skipVal == "NULL") {						## "NULL"
			lenOfNULL = function(vec)		{	return(length(vec[is.null(vec)]))		}	
			removeIdx = apply(resData, 1, lenOfNULL)
		} else if (class(skipVal) == "numeric") {			## 숫자
			lenOfEquals = function(vec, targetVal)		{	return(length(vec[vec == targetVal]))		}	
			removeIdx = apply(resData, 1, lenOfEquals, skipVal)
		} else if (skipVal == "none") {	}

		# skipVal이 포함되지 않은 벡터는 resIndex, resData에 list로 저장한다.
		matToList = function(mat) {	split(mat, 1:nrow(mat))	}
		if (skipVal == "none") {
			resIndex = matToList(resIndex);	resData = matToList(resData)
		} else {
			resIndex = matToList(resIndex[-which(removeIdx>0),]);	resData = matToList(resData[-which(removeIdx>0),])
		}		
	}

	res = list(data=resData, index=resIndex)
	return(res)	
}



getPartialData = cmpfun(getPartialData)