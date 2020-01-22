color = brewer.pal(n = 8, name = 'Set3')



##### 결과의 히스토그램 출력
### Independent Test
p_Model_hist(selectedModelSelectorIDX, modelHistSelector = "On_Paper_IndependenceTest_histogram", 
						tempRes = resultSet_independence, sliderName = "On_Paper_IndependenceTest_Slider",
						inputColor=color[1])

### Trend Test
p_Model_hist(	selectedModelSelectorIDX, modelHistSelector = "On_Paper_TrendTest_histogram", 
						tempRes = resultSet_trend, sliderName = "On_Paper_TrendTest_Slider",
						inputColor=color[3])

### Structural Break Test
p_Model_hist(	selectedModelSelectorIDX, modelHistSelector = "On_Paper_Structuralbreak_histogram", 
						tempRes = resultSet_structuralBreak, sliderName = "On_Paper_StructuralBreak_Slider",
						inputColor=color[5])



##### 모델 데이터 플랏 출력; Critical Value를 반영하는 플랏 출력	### : Synthetic Data에만 적용할 것		;;;
### Critical Value를 반영하는 플랏 출력(renderer): Dygraph
printCritRenderPlot = function(data,	partialData, 	
															result_independence=NULL,		result_trend=NULL, 
															signif_independence = NULL, 	signif_trend = NULL,
															group=NULL,							inputColor="lightpink")
{
	resGraph = dygraph(returnTS(data), main=NULL, ylab="y_t", xlab="t", group=group) %>% 
						dySeries("V1", label = "Value", color="black") %>%
						dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2)
	timeDate = returnTimeDate(data)
	idx = pbmclapply(1:length(partialData), makeIDX, len=length(partialData[[1]]), mc.cores=numCores)
	res_independence = result_independence;	res_trend = result_trend
	
	getPeriods = function(i, type="indep")
	{
		tempIdx = idx[[i]];	checker = NULL
		
		inequalityCheck_independence = methodsInequality[which(input$On_Paper_IndependenceTest_Methods == allMethods)]
		inequalityCheck_trend = methodsInequality[which(input$On_Paper_TrendTest_Methods == allMethods)]
		
		if (type=="indep") {
			if (inequalityCheck_independence == "<")			{	checker = res_independence[i-1] < signif_independence	}
			else if (inequalityCheck_independence == ">") 	{	checker = res_independence[i-1] > signif_independence	}
		} else if (type=="trend") {
			if (inequalityCheck_trend == "<") 							{	checker = res_trend[i-1] < signif_trend	}
			else if (inequalityCheck_independence == ">") 	{	checker = res_trend[i-1] > signif_trend	}
		} else if (type=="final") {
			checker_independence = NULL;		checker_trend = NULL;
			
			if (inequalityCheck_independence == "<")		 	{	checker_independence = res_independence[i-1] < signif_independence	}
			else if (inequalityCheck_independence == ">") 	{	checker_independence = res_independence[i-1] > signif_independence	}
			
			if (inequalityCheck_trend == "<") 							{	checker_trend = res_trend[i-1] < signif_trend	}
			else if (inequalityCheck_independence == ">") 	{	checker_trend = res_trend[i-1] > signif_trend	}
		
			if (sum(res_trend < signif_trend) == 0) 				{	checker = checker_independence		}
			else 																	{	checker = checker_independence && checker_trend	}
		} else {	stop("Error")	}
		
		
		if (checker) 		{	return(list(from = timeDate[min(tempIdx)], to = timeDate[max(tempIdx)], color = inputColor)) }
		else 					{ 	return(list(from = timeDate[min(tempIdx)], to = timeDate[max(tempIdx)], color = "white")) }
	}
	
	type = NULL
	if 			(!is.null(result_independence) && is.null(result_trend)) 	{	type = "indep"	}		# Independent
	else if	(is.null(result_independence) && !is.null(result_trend)) 	{	type = "trend"	}		# Trend	
	else if 	(!is.null(result_independence) && !is.null(result_trend))	{	type = "final"		}		# Final	
	
	resPeriods = lapply(2:length(idx), getPeriods, type=type)

	return(	resGraph %>% add_shades(resPeriods) %>% dyOptions( connectSeparatedPoints = TRUE ) %>% 
				dyUnzoom() %>% dyCrosshair(direction = "vertical") )
}
printCritRenderPlot = cmpfun(printCritRenderPlot)




p_Model_critPlot = function(i, 	modelCritPlotSelector, resModelData, 
													partialData, result_independence=NULL, result_trend=NULL, 
													sliderName_comparison = NULL, 	sliderName_trend = NULL,		
													group=NULL,	inputColor = "lightpink")
{	
	output[[modelCritPlotSelector]] = renderDygraph(
												printCritRenderPlot(	data = 	resModelData[[i]],
																							partialData = partialData[[i]],
																							result_independence = result_independence,
																							result_trend = result_trend,
																							signif_independence = input[[sliderName_comparison]], 	
																							signif_trend = input[[sliderName_trend]],
																							group=group,
																							inputColor=inputColor) )
}
p_Model_critPlot = cmpfun(p_Model_critPlot)




### Independent Test
p_Model_critPlot(	selectedModelSelectorIDX, 
							modelCritPlotSelector = "modelDataPlot_comparisonTest",
							resModelData = resModelData, partialData = resPartialData, result_independence = resultSet_independence, 
							sliderName_comparison = "On_Paper_IndependenceTest_Slider", group="showDetails", inputColor=color[1])
### Trend Test
p_Model_critPlot(	selectedModelSelectorIDX, 
							modelCritPlotSelector = "modelDataPlot_trendTest",
							resModelData = resModelData, partialData = resPartialData, result_trend = resultSet_trend,
							sliderName_trend = "On_Paper_TrendTest_Slider", group="showDetails", inputColor=color[3])
							
### Structural Break Test
p_Model_critPlot(	selectedModelSelectorIDX, 
							modelCritPlotSelector = "modelDataPlot_structuralBreakTest",
							resModelData = resModelData, partialData = resPartialData, result_trend = resultSet_structuralBreak,
							sliderName_trend = "On_Paper_StructuralBreak_Slider", group="showDetails", inputColor=color[5])

##### 모델 데이터 결과 플랏 출력; Critical Value를 반영하는 플랏 출력
p_Model_critPlot(	selectedModelSelectorIDX, 
							modelCritPlotSelector="modelDataPlot",
							resModelData = resModelData, partialData = resPartialData, 
							result_independence = resultSet_independence, sliderName_comparison = "On_Paper_IndependenceTest_Slider",
							result_trend = resultSet_trend, sliderName_trend = "On_Paper_TrendTest_Slider",
							group="showDetails", inputColor=color[4])





##### Value Box Update
inequalityCheck_independence = methodsInequality[which(input$On_Paper_IndependenceTest_Methods == allMethods)]
inequalityCheck_trend = methodsInequality[which(input$On_Paper_TrendTest_Methods == allMethods)]

likelihoodComparison = NULL
if 		 		(inequalityCheck_independence == "<") {	
	likelihoodComparison = which(resultSet_independence < input$On_Paper_IndependenceTest_Slider)	
} else if 	(inequalityCheck_independence == ">") {
	likelihoodComparison = which(resultSet_independence > input$On_Paper_IndependenceTest_Slider)	
}

likelihoodTrend = NULL
if 		 		(inequalityCheck_trend == "<") {
	likelihoodTrend = which(resultSet_trend < input$On_Paper_TrendTest_Slider)	
} else if 	(inequalityCheck_trend == ">") {
	likelihoodTrend = which(resultSet_trend > input$On_Paper_TrendTest_Slider)	
}

LenAll = length(resultSet_independence)

if (length(likelihoodComparison) > 0) { likelihood_comparison = round(length(likelihoodComparison) / LenAll, 3) 
}  else { likelihood_comparison = 0 }

if (length(likelihoodTrend) > 0) { likelihood_trend = round(length(likelihoodTrend) / LenAll, 3) 
} else { likelihood_trend = 0 }

if (length(likelihoodTrend > 0)) {
	likelihood_result = round(length(intersect(likelihoodComparison, likelihoodTrend)) / LenAll, 3) 
} else { likelihood_result = likelihood_comparison }



output[["likelihood_comparison"]] = renderValueBox({valueBox("Comparison", value=tags$p(likelihood_comparison, style = "font-size: 50%;"), width=12, color = "purple")})
output[["likelihood_trend"]] = renderValueBox({valueBox("Trend", value=tags$p(likelihood_trend, style = "font-size: 50%;"), width=12, color = "yellow")})
			
if (length(likelihoodTrend > 0)) {
	likelihood_result = round(length(intersect(likelihoodComparison, likelihoodTrend)) / LenAll, 3) 
} else { likelihood_result = likelihood_comparison }
output[["likelihood_result"]] = renderValueBox({valueBox("Result", value=tags$p(likelihood_result, style = "font-size: 50%;"), width=12)})