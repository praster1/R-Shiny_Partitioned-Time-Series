resultSetDir = datasetDir = partialDatasetDir = paramsDir = modelLen = NULL

cat("\n*** dataLoad_SyntheticData ***\n")
cat(paste("- input$On_Paper_selectInput_datasetSelector:", input$On_Paper_selectInput_datasetSelector, "\n"))

source(paste0(dir_functions_dataLoad, "dataLoad_getDir.R"), local=TRUE)

listFiles = list.files(datasetDir)
modelLen = length(listFiles)



cat(paste("input$On_Paper_selectInput_analysisMode:", input$On_Paper_selectInput_analysisMode, "\n"))



### 선택된 모델 데이터 인덱스 추출
modelSelector = toupper(big_letters(modelLen))

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
params = readRDS(paste0(paramsDir, "params.RDS"))


# 선택된 모델 데이터
selectedModelData = modelData


# 파라메터 출력
resParams = getParameters(input$On_Paper_selectInput_datasetSelector, params, selectedModelSelectorIDX)
cat("- resParams: \n")
cat(resParams)
cat("\n")
