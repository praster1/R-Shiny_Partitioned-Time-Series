cat("\n\n\n***** dataLoad_SyntheticData *****\n")
cat(paste("- input$On_Paper_selectInput_datasetSelector:", input$On_Paper_selectInput_datasetSelector, "\n"))


cat(paste("input$On_Paper_selectInput_analysisMode:", input$On_Paper_selectInput_analysisMode, "\n"))


# Korea Univ
if (input$On_Paper_selectInput_datasetSelector == "Korea_Univ") {
	source(paste0(dir_functions_dataLoad, "dataLoad_KoreaUniv.R"), local=TRUE)
# ENTSO_E
} else if (input$On_Paper_selectInput_datasetSelector == "ENTSO_E") {
	source(paste0(dir_functions_dataLoad, "dataLoad_ENTSO_E.R"), local=TRUE)
# KEPCO
} else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2015") {
	source(paste0(dir_functions_dataLoad, "dataLoad_KEPCO2015.R"), local=TRUE)
	# } else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2016") {
	# source(paste0(dir_functions_dataLoad, "dataLoad_KEPCO2016.R"), local=TRUE)
	# } else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2017") {
	# source(paste0(dir_functions_dataLoad, "dataLoad_KEPCO2017.R"), local=TRUE)
	# } else if (input$On_Paper_selectInput_datasetSelector == "KEPCO2018") {
	# source(paste0(dir_functions_dataLoad, "dataLoad_KEPCO2018.R"), local=TRUE)
# Synthetic Models
} else {
	source(paste0(dir_functions_dataLoad, "dataLoad_SyntheticData.R"), local=TRUE)
}