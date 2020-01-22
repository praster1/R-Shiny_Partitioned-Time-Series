### 데이터 파일 불러오기: obsData, modelData, partialData
source(paste0(dir_functions_dataLoad, "dataLoad.R"), local=TRUE)

print(input$On_Paper_selectInput_datasetSelector)

list_NS = c("NS", "NS1", "NS_1", "NS_2", "NS_3", "NS_4", "NS_5", "NS_6", "NS_7")
list_S = c("S", "S_1", "S_2", "S_3", "S_4", "S_5", "S_6", "S_7")
	
res = NULL

if (input$On_Paper_selectInput_datasetSelector == "Korea_Univ") {
	shinyjs::hide(id = "On_Paper_selectInput_analysisMode_modeDescription_synthetic_tag") 
# ENTSO_E
} else if (input$On_Paper_selectInput_datasetSelector == "ENTSO_E") {
	shinyjs::hide(id = "On_Paper_selectInput_analysisMode_modeDescription_synthetic_tag") 
# KEPCO
} else if (input$On_Paper_selectInput_datasetSelector == "KEPCO") {
	shinyjs::hide(id = "On_Paper_selectInput_analysisMode_modeDescription_synthetic_tag") 
# Synthetic Models - NS	
} else if (sum((input$On_Paper_selectInput_datasetSelector == list_NS)*1) > 0) {
	shinyjs::show(id = "On_Paper_selectInput_analysisMode_modeDescription_synthetic_tag") 
	
	output$ModelExpression1 = renderUI({ withMathJax( helpText("$$y_t = \\alpha y_{t-1}+z_t$$")) })
	output$ModelExpression2 = renderUI({ withMathJax( helpText("$$z_t \\sim N( \\mu, \\sigma^2) \\,\\,\\,\\,\\, t=1, \\cdots,1000$$")) })
	output$ModelExpression3 = renderUI({ withMathJax( helpText(paste("The parameters of \"Model ", input$On_Paper_selectInput_modelSelector, "\" are as follows.", sep=""))) })
	
	output$ModelExpressionTableUI = renderTable({
												mu = resParams[1]
												sigma = resParams[2]
												alpha = resParams[3]
												tab = tbl_df(data.frame(mu = mu, sigma = sigma, alpha = alpha))
												colnames(tab) = c("\\(\\mu\\)", "\\(\\sigma\\)", "\\(\\alpha\\)")
												rownames(tab) = c(	"t = 1, ..., 1000" )
												return(tab)
											},
		include.rownames = TRUE,	include.colnames = TRUE,
		digits=1, align="c", spacing="xs", striped=TRUE,
		width="100%"
	)
# Synthetic Models - S
} else if (sum((input$On_Paper_selectInput_datasetSelector == list_S)*1) > 0){		
	shinyjs::show(id = "On_Paper_selectInput_analysisMode_modeDescription_synthetic_tag") 
	
	output$ModelExpression1 = renderUI({ withMathJax( helpText("$$y_t = \\alpha y_{t-1}+z_t$$")) })
	output$ModelExpression2 = renderUI({ withMathJax( helpText("$$z_t \\sim N( \\mu, \\sigma^2) \\,\\,\\,\\,\\, t=1, \\cdots,1000$$")) })
	output$ModelExpression3 = renderUI({ withMathJax( helpText(paste("The parameters of \"Model ", input$On_Paper_selectInput_modelSelector, "\" are as follows.", sep=""))) })
	
	output$ModelExpressionTableUI = renderTable({
												mu = resParams[,1]
												sigma = resParams[,2]
												alpha = resParams[,3]
												tab = tbl_df(data.frame(mu = mu, sigma = sigma, alpha = alpha))
												colnames(tab) = c("\\(\\mu\\)", "\\(\\sigma\\)", "\\(\\alpha\\)")
												rownames(tab) = c(	"t = 1, ..., 250",
																					"t = 251, ..., 500",
																					"t = 501, ..., 750",
																					"t = 751, ..., 1000"
																			)
												return(tab)
											},
		include.rownames = TRUE,	include.colnames = TRUE,
		digits=1, align="c", spacing="xs", striped=TRUE,
		width="100%"
	)
}


Model_printObsPlotInModelRow(	obsData = obsData, obsDataPlotSelector = "obsDataPlot")			# 관측된 데이터 플랏 출력
output$obsDataSummary = printSummaryRenderDTTable(obsData)												# 관측된 데이터 요약테이블 출력



### On_Paper_selectInput_modelSelector의 업데이트					
updateRadioGroupButtons(	session,
											inputId = "On_Paper_selectInput_modelSelector",
											choices = modelSelector,
											selected = modelSelector[selectedModelSelectorIDX],
											status = "warning",
											checkIcon = list(yes = icon("ok", lib = "glyphicon"))
										)


### On_Paper_selectInput_analysisModeModelSelector 업데이트
updateCheckboxGroupButtons(	session,
												inputId = "On_Paper_selectInput_analysisModeModelSelector",
												choices = modelSelector,
												selected = modelSelector[selectedModelSelectorIDX],
												status = "success",
												checkIcon = list(yes = icon("ok", lib = "glyphicon"))
											)

### On_Paper_TrendTest_Methods
updateSelectInput(session, inputId="On_Paper_TrendTest_Methods")


### 선택된 모델 데이터 플랏 및 요약테이블 출력
# Korea Univ
if (input$On_Paper_selectInput_datasetSelector == "Korea_Univ") {
	updateSwitchInput(session, "On_Paper_switchInput_dynamicGraph", value=FALSE)
	shinyjs::hide(id = "On_Paper_dynamicGraphButton_showHide") 
# ENTSO_E
} else if (input$On_Paper_selectInput_datasetSelector == "ENTSO_E") {
	updateSwitchInput(session, "On_Paper_switchInput_dynamicGraph", value=FALSE)
	shinyjs::hide(id = "On_Paper_dynamicGraphButton_showHide") 
# KEPCO
} else if (input$On_Paper_selectInput_datasetSelector == "KEPCO") {
	updateSwitchInput(session, "On_Paper_switchInput_dynamicGraph", value=FALSE)
	shinyjs::hide(id = "On_Paper_dynamicGraphButton_showHide") 
# Synthetic Models
} else {
	updateSwitchInput(session, "On_Paper_switchInput_dynamicGraph", value=FALSE)
	shinyjs::show(id = "On_Paper_dynamicGraphButton_showHide") 
}

modelDataPrint(selectedModelData, selectedModelData)