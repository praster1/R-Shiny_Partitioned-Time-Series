cat("\n***** server_On_Paper_ButtonAnalysis *****\n")


### 데이터 파일 불러오기: obsData, modelData, partialData
source(paste0(dir_functions_dataLoad, "dataLoad.R"), local=TRUE)


inputDisables()

### Scaling setter
inputCenter = inputScale = NULL
if (input$On_Paper_Scale_Methods == "Raw") {
	inputCenter = inputScale = FALSE
} else if (input$On_Paper_Scale_Methods == "Centering") {
	inputCenter = FALSE;	inputScale = TRUE
} else if (input$On_Paper_Scale_Methods == "Normalization") {
	inputCenter = inputScale = TRUE
}

cat("::::: Scaling setter Done\n")



### Match Index
selectedModels = input$On_Paper_selectInput_analysisModeModelSelector
C = findMatches(modelSelector, selectedModels)
whichIDX = C@from						# 매칭되는 인덱스
lenWhichIDX = length(whichIDX)		# 매칭되는 인덱스 길이






#####
if (sum(input$On_Paper_TrendTest_Methods == On_Paper_TrendTest_Methods_selectors) == 0) {
	shinyalert("Error", "Please select the Trend Test method.", type = "error")
### Comparison
} else if (input$On_Paper_selectInput_analysisMode=="Comparison") {
	cat(":::::::::: Comparison\n")

	### Scaling Data

	cat("::: Scalied obsData\n")
	# print(head(obsData))
	inputObsData = scaling_obsData(obsData, center = inputCenter, scale = inputScale)
	# print(head(inputObsData))
	cat("::: Scalied obsData Done\n")

	cat("::: Scalied modelData\n")
	inputModelData = pbmclapply(whichIDX, scaling_modelData, center = inputCenter, scale = inputScale, mc.cores=numCores)
	# print(str(inputModelData))
	cat("::: Scalied modelData Done\n")

	cat("::: Scalied partialData\n")
	inputPartialData = pbmclapply(whichIDX, scaling_partialData, center = inputCenter, scale = inputScale, mc.cores=numCores)
	# print(str(inputPartialData))
	cat("::: Scalied partialData Done\n")

	cat("::: Scalied selectedModelData\n")
	# print(head(selectedModelData))
	inputSelectedModelData = as.numeric(scale(selectedModelData, center = inputCenter, scale = inputScale))
	# print(head(inputSelectedModelData))

	cat("::::: Data Scaling Done\n")


	source(paste0(dir_server, "server_On_Paper_ButtonAnalysis_Comparison.R"), local=TRUE)
### Analysis
} else {
	cat(":::::::::: Analysis\n")


	### Scaling Data

	cat("::: Scalied obsData\n")
	# print(head(obsData))
	inputObsData = scaling_obsData(obsData, center = inputCenter, scale = inputScale)
	# print(head(inputObsData))
	cat("::: Scalied obsData Done\n")

	cat("::: Scalied modelData\n")
	inputModelData = scaling_modelData(whichIDX, center = inputCenter, scale = inputScale)
	print(str(inputModelData))
	cat("::: Scalied modelData Done\n")

	cat("::: Scalied partialData\n")
	inputPartialData = scaling_partialData(whichIDX, center = inputCenter, scale = inputScale)
	# print(str(inputPartialData))
	cat("::: Scalied partialData Done\n")

	cat("::: Scalied selectedModelData\n")
	# print(head(selectedModelData))
	inputSelectedModelData = as.numeric(scale(selectedModelData, center = inputCenter, scale = inputScale))
	# print(head(inputSelectedModelData))

	cat("::::: Data Scaling Done\n")


	source(paste0(dir_server, "server_On_Paper_ButtonAnalysis_Analysis.R"), local=TRUE)
	
}


inputEnables()