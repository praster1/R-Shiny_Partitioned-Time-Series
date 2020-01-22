resultSetDir = datasetDir = partialDatasetDir = paramsDir = modelLen = NULL

cat("\n*** dataLoad_ENTSO-E ***\n")
cat(paste("- input$On_Paper_selectInput_datasetSelector:", input$On_Paper_selectInput_datasetSelector, "\n"))


resultSetDir = "./_resultSet_ENTSO-E/"
datasetDir = "./ShinyApp_dataset_ENTSO-E/"
partialDatasetDir = "./_partialDataset_ENTSO-E/"
paramsDir = "./_dataset_ENTSO-E/"

listFiles = list.files(datasetDir)
modelLen = length(listFiles)



cat(paste("input$On_Paper_selectInput_analysisMode:", input$On_Paper_selectInput_analysisMode, "\n"))



### 선택된 모델 데이터 인덱스 추출
modelSelector = c("AT", "BA", "BE", "BG", "CH", "CS", "CY", "CZ", "DE", "DK", "DK_W", "EE", "ES", "FI", "FR", "GB", "GR", "HR", "HU", "IE", "IS", "IT", "LT", "LU", "LV", "ME", "MK", "NI", "NL", "NO", "PL", "PT", "RO", "RS", "SE", "SI", "SK", "UA_W")
if (sum(input$On_Paper_selectInput_modelSelector == modelSelector) > 0) {
	selectedModelSelectorIDX = which(modelSelector == input$On_Paper_selectInput_modelSelector)
} else { selectedModelSelectorIDX = 1 }


cat(paste("- resultSetDir: ", resultSetDir, "\n"))
cat(paste("- datasetDir: ", datasetDir, "\n"))
cat(paste("- partialDatasetDir: ", partialDatasetDir, "\n"))
cat(paste("- paramsDir: ", paramsDir, "\n"))
cat(paste("- selectedModelSelectorIDX: ", selectedModelSelectorIDX, "\n"))
cat(paste("- modelLen: ", modelLen, "\n"))



### 데이터 읽기
obsData = readObsData(resultSetDir)
modelData = readModelData(datasetDir, selectedModelSelectorIDX)[[1]]
partialData = readPartialData(partialDatasetDir, selectedModelSelectorIDX)


# 선택된 모델 데이터
selectedModelData = modelData
