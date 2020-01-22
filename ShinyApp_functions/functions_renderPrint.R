########## Options
### 시계열 데이터로 변환(dygraph용)
# 날짜 출력
returnTimeDate = function(vec) {	return(seq(as.Date('0001-01-01'), by = 'year', length = length(vec)))	}
returnTimeDate = cmpfun(returnTimeDate)


# 시계열 데이터 출력(dygraph용)
returnTS = function(vec)
{
	require(zoo)
	vec = as.numeric(vec)
	timeDate = returnTimeDate(vec)
	df = tbl_df(data.frame(timeDate = timeDate, s = vec))
	df.zoo <- with(df, zoo(s, order.by = timeDate));	df.zoo2 <- with(df, zooreg(s, order.by = timeDate)) 
	return(df.zoo2)
}
returnTS = cmpfun(returnTS)



### dygraph 옵션
dyCrosshair <- function(dygraph, direction = c("both", "horizontal", "vertical")) 
{
	dyPlugin(	dygraph = dygraph, name = "Crosshair", path = system.file("plugins/crosshair.js",   package = "dygraphs"),
					options = list(direction = match.arg(direction)))
}

dyUnzoom <-function(dygraph) 
{
	dyPlugin(	dygraph = dygraph,	name = "Unzoom",	path = system.file("plugins/unzoom.js", package = "dygraphs")	)
}

add_shades = function(x, periods, ...) 
{
	for( period in periods ) { x = dyShading(x, from = period$from , to = period$to, color = period$color ) }
	return(x)
}
add_shades = cmpfun(add_shades)



### 시계열 데이터 라인 플랏 출력: dygraph
printModelPlotRenderPlot = function(resData, main="Model", rangeSelector = TRUE, ylab="y_t", xlab="t", group=NULL)	
{
	return(renderDygraph({ 
				dygraph(returnTS(resData), main=NULL, ylab=ylab, xlab=xlab, group=group) %>% 
					dySeries("V1", label = "Value") %>%
					dyOptions( connectSeparatedPoints = TRUE ) %>% 
					dyCrosshair(direction = "vertical") %>%
					dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2)
		}) ) 
}
printModelPlotRenderPlot = cmpfun(printModelPlotRenderPlot)





########## Obs Data
### 관측된 데이터 플랏 출력
Model_printObsPlotInModelRow = function(obsData, dataLen, obsDataPlotSelector) 
{
	# dygraph
	output[[obsDataPlotSelector]] = 
			renderDygraph({	dygraph(returnTS(obsData), xlab="t", ylab="y_t") %>% 
									dySeries("V1", label = "Value")  %>%
									dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2) }) 
}
Model_printObsPlotInModelRow = cmpfun(Model_printObsPlotInModelRow)



### 관측된 데이터 요약테이블
printSummaryRenderDTTable = function(resData, roundNum = 3)
{
	DT::renderDataTable({ datatable(	format(round(as.matrix(summary(resData)), roundNum), width=(roundNum+2)),
														options = list(	pageLength=6, columnDefs = list(list(className = 'dt-right', targets = 1)), dom = 't'),
														selection="none", colnames=c("")
												)
								})
}
printSummaryRenderDTTable = cmpfun(printSummaryRenderDTTable)










########## Model Data
### On_Paper_selectInput_modelSelector: 모델 데이터 플랏 풀력	;;;;
result_On_Paper_selectInput_modelSelector = function(On_Paper_selectInput_datasetSelector, inputModelData, On_Paper_selectInput_modelSelector)
{
	selectedModelData = readModelData(inputModelData, which(modelSelector == On_Paper_selectInput_modelSelector))
	output$modelDataPlot = printModelPlotRenderPlot(selectedModelData, main=NULL) 
}
result_On_Paper_selectInput_modelSelector = cmpfun(result_On_Paper_selectInput_modelSelector)



### 모델 데이터 플랏 및 요약데이블 출력
modelDataPrint = function(selectedModelData, selectedModelRawData, testPlotNULL = TRUE)
{
	# 모델 데이터 플랏 출력: dygraph
	output$modelDataPlot = printModelPlotRenderPlot(selectedModelRawData, main=NULL, group="showDetails") 
	output$modelDataPlot_scaledData = printModelPlotRenderPlot(selectedModelData, main=NULL, group="showDetails") 
	
	# test 결과 초기화
	if (testPlotNULL)	
	{
		# Plot 초기화
		output$modelDataPlot_comparisonTest = output$modelDataPlot_trendTest = output$modelDataPlot_structuralBreakTest = NULL	
		output$On_Paper_IndependenceTest_histogram = output$On_Paper_TrendTest_histogram = output$On_Paper_Structuralbreak_histogram = NULL
		output[["likelihood_comparison"]] = renderValueBox({valueBox("Comparison", value=tags$p(likelihood_comparison, style = "font-size: 50%;"), width=12, color = "purple")})
		
		# ValueBox 초기화
		output[["likelihood_comparison"]] = output[["likelihood_trend"]] = output[["likelihood_result"]] = NULL
	}
	
	# 모델 데이터 요약테이블 출력
	output$modelDataSummary = printSummaryRenderDTTable(selectedModelRawData)	
}
modelDataPrint = cmpfun(modelDataPrint)









########## Test 결과 출력
##### 결과의 히스토그램 출력
p_Model_hist = function(i, modelHistSelector, tempRes, sliderName, inputColor="red")
{	
	temp = as.data.frame(tempRes)
	colnames(temp) = "x"
	minX = min(temp);	maxX = max(temp)
	resPlot = checker = NULL
	
	if (sliderName == "On_Paper_IndependenceTest_Slider") {
		checker = methodsInequality[which(input$On_Paper_IndependenceTest_Methods == allMethods)]
	} else if (sliderName == "On_Paper_TrendTest_Slider") {
		checker = methodsInequality[which(input$On_Paper_TrendTest_Methods == allMethods)]
	} else if (sliderName == "On_Paper_StructuralBreak_Slider") {
		checker = methodsInequality[which(input$On_Paper_StructuralBreak_Methods == allMethods)]
	}

	if (checker == "<") {
		resPlot = ggplot(temp, aes(x=x)) +
							coord_cartesian(xlim = c(minX, maxX)) +
							geom_histogram(data=subset(temp, x <= input[[sliderName]]), fill=inputColor) +
							geom_histogram(data=subset(temp, x > input[[sliderName]]), fill="black") +
							scale_x_discrete(breaks=temp$x, labels=temp$x) + theme(axis.text.x = element_text(size = 14))
	} else if (checker == ">") {
		resPlot = ggplot(temp, aes(x=x)) +
							coord_cartesian(xlim = c(minX, maxX)) +
							geom_histogram(data=subset(temp, x >= input[[sliderName]]), fill=inputColor) +
							geom_histogram(data=subset(temp, x < input[[sliderName]]), fill="black") +
							scale_x_discrete(breaks=temp$x, labels=temp$x) + theme(axis.text.x = element_text(size = 14))
	}
	
	

				
	output[[modelHistSelector]] = renderPlotly( ggplotly(resPlot) %>% plotly::config(displayModeBar = F) )
}
p_Model_hist = cmpfun(p_Model_hist)



observeEvent_On_Paper_Test_Slider_Analysis = function(	resRawData, resModelData, resPartialData, resultSet_independence, resultSet_trend, resultSet_structuralBreak, selectedModelSelectorIDX)
{
	observeEvent(input$On_Paper_IndependenceTest_Slider, 		{	source(paste0(dir_functions, "functions_Test_Slider_Analysis.R"), local=TRUE) } )
	observeEvent(input$On_Paper_TrendTest_Slider, 					{	source(paste0(dir_functions, "functions_Test_Slider_Analysis.R"), local=TRUE) } )
	observeEvent(input$On_Paper_StructuralBreak_Slider, 			{	source(paste0(dir_functions, "functions_Test_Slider_Analysis.R"), local=TRUE) } )
}


observeEvent_On_Paper_Test_Slider_Comparison = function(	resRawData, resModelData, resPartialData, resultSet_independence, resultSet_trend, selectedModelSelectorIDX)
{
	observeEvent(input$On_Paper_IndependenceTest_Slider, 	{	source(paste0(dir_functions, "functions_Test_Slider_Comparison.R"), local=TRUE) } )
	observeEvent(input$On_Paper_TrendTest_Comparison, 		{	source(paste0(dir_functions, "functions_Test_Slider_Comparison.R"), local=TRUE) } )
}


makeIDX = function(i, len)	{	tempVec = seq(i, (i+len-1), length=len);	return(tempVec)	}