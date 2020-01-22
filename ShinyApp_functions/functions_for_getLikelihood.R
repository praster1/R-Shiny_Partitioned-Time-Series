### likelihood 값 구하기
getLikelihood = function(resVec, signif, comp="<")	
{
	if (comp == "<") 	{ return(sum(resVec < signif)/length(resVec))	 }
	else 					{ return(sum(resVec >= signif)/length(resVec)) }
}
getLikelihood = cmpfun(getLikelihood)



### Likelihood 계산
getLikelihood_multi = function(i, resultSet, signif, comp="<")
{
	tempResultSet = resultSet[[i]];
	return(getLikelihood(resVec = tempResultSet, signif = signif, comp=comp))
}
getLikelihood_multi = cmpfun(getLikelihood_multi)




# 메모: observeEvent_On_Paper_IndependenceTest_Slider의 내부 내용과 겹치므로 나중에 함수로 합칠 수 있을 것 같음
getLikelihoodAll_multi = function(i, resultSet_indep, signif_indep, resultSet_trend, signif_trend)
{
	likelihoodComparison = which(resultSet_indep[[i]] < signif_indep)
	likelihoodTrend = which(resultSet_trend[[i]] < signif_trend)
	LenAll = length(resultSet_indep)
	
	if (length(likelihoodComparison) > 0) { likelihood_comparison = round(length(likelihoodComparison) / LenAll, 3) } 
	else { likelihood_comparison = 0 }
	
	if (length(likelihoodTrend) > 0) { likelihood_trend = round(length(likelihoodTrend) / LenAll, 3) }
	else { likelihood_trend = 0 }							
	
	if (length(likelihoodTrend > 0)) {
		likelihood_result = round(length(intersect(likelihoodComparison, likelihoodTrend)) / LenAll, 3) 
	} else { likelihood_result = likelihood_comparison / LenAll}
	
	return(likelihood_result)
}
getLikelihoodAll_multi = cmpfun(getLikelihoodAll_multi)




### Posterior 계산
getPosterior_multi = function(i, likelihoodVec, priorVec)
{
	priorVec = as.numeric(priorVec);	likelihoodVec = as.numeric(likelihoodVec)
	enumerator = priorVec[i] * likelihoodVec[i]		# 분자
	denominator = sum(priorVec * likelihoodVec) 	# 분모
	
	return(enumerator / denominator)
}
getPosterior_multi = cmpfun(getPosterior_multi)