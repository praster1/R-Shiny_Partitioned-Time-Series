cat("\n***** server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix *****\n")

cat(paste("- whichIDX:", whichIDX, "\n"))
cat(paste("- input$On_Paper_selectInput_datasetSelector:", input$On_Paper_selectInput_datasetSelector, "\n"))


### 파라메터 반영
# Korea Univ
if (input$On_Paper_selectInput_datasetSelector == "Korea_Univ") {
	for (i in 1:length(whichIDX))	
	{
		resParams = rbind(resParams, rep("Unknown", 3))	
	}
# ENTSO_E
} else if (input$On_Paper_selectInput_datasetSelector == "ENTSO_E") {
	for (i in 1:length(whichIDX))	
	{
		resParams = rbind(resParams, rep("Unknown", 3))	
	}
# KEPCO
} else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2015") {
	for (i in 1:length(whichIDX))	
	{
		resParams = rbind(resParams, rep("Unknown", 3))	
	}
# Synthetic Models
} else {		
	resParams = lapply(whichIDX, getParameters_multi, input$On_Paper_selectInput_datasetSelector, params)
}

cat("- resParams\n")
print(resParams)
cat("\n")




list_NS = c("NS", "NS1", "NS", "NS_2", "NS_3", "NS_4", "NS_5", "NS_6", "NS_7")
list_S = c("S", "S_1", "S_2", "S_3", "S_4", "S_5", "S_6", "S_7")

datasetSelector = input$On_Paper_selectInput_datasetSelector
cat(paste('- datasetSelector:', datasetSelector, "\n"))


### prior 반영
resMatrix = NULL


# a custom table container
cat("::::: a custom table container\n")
sketch = NULL

# Synthetic Models - NS
if (sum((datasetSelector == list_NS)*1) > 0) {		
	source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix_SyntheticData_NS.R"), local=TRUE)
# Synthetic Models - S
} else if (sum((datasetSelector == list_S)*1) > 0){		
	source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix_SyntheticData_S.R"), local=TRUE)
# Korea Univ
} else if (datasetSelector == "Korea_Univ") {
	source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix_KoreaUniv.R"), local=TRUE)
# ENTSO_E
} else if (datasetSelector == "ENTSO_E") {
	source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix_ENTSO_E.R"), local=TRUE)
# KEPCO
} else if (datasetSelector == "KEPCO2015") {
	source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix_KEPCO2015.R"), local=TRUE)
# } else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2016") {
# 
# } else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2017") {
# 
# } else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2018") {
# 
}




cat("::::: output$modelComparisonSummary\n")

output$modelComparisonSummary = DT::renderDataTable( 
	{
		datatable(resMatrix, 	container=sketch, rownames=FALSE, 
										options = list(pageLength=10, dom = 't', deferRender = TRUE, scrollY = 200, scroller = TRUE))  
	} 
)
