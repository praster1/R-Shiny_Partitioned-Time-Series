### Cox-Stuart trend test
CoxStuartTest_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	
	if (scale)	{	tempTestVec = as.numeric(scale(tempTestVec));		tempModelData = as.numeric(scale(tempModelData))	}
	res_testVec = cox_stuart_test(tempTestVec)$statistic
	res_modelDataList = cox_stuart_test(tempModelData)$statistic
	res = abs(res_modelDataList - res_testVec)
	return(unlist(res))
}
CoxStuartTest_between_testVec_and_modelDataList = cmpfun(CoxStuartTest_between_testVec_and_modelDataList)


### Runs Test
RunsTest_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	
	if (scale)	{	tempTestVec = as.numeric(scale(tempTestVec));		tempModelData = as.numeric(scale(tempModelData))	}
	res_testVec = runs.test(tempTestVec, exact = TRUE)$p.value
	res_modelDataList = runs.test(tempModelData, exact = TRUE)$p.value
	res = abs(res_modelDataList - res_testVec)
	return(unlist(res))
}
RunsTest_between_testVec_and_modelDataList = cmpfun(CoxStuartTest_between_testVec_and_modelDataList)