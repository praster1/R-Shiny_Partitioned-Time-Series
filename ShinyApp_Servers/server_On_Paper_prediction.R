### 데이터 파일 불러오기: obsData, modelData, partialData
source(paste0(dir_functions_dataLoad, "dataLoad.R"), local=TRUE)
		
		
		
### 클릭한 인덱스
clickedIndex = as.numeric(strsplit(paste(input$modelDataPlot_click$x), "-")[[1]][1]) + 1
output$prediction_clicked = renderText({ clickedIndex })


### 데이터 불러오기
resPlotObsData = obsData
# resPlotModelData = readModelData(modelData, selectedModelSelectorIDX)
resPlotModelData = modelData


### scaling
resPlotObsData_scaled = as.numeric(scale(resPlotObsData))
resPlotModelData_scaled = as.numeric(scale(resPlotModelData))

obsDataLen = length(resPlotObsData)


### 선택된 인덱스 이후의 길이가 obs data보다 짧을 때
resPlotModelIndex = NULL
if (clickedIndex > (length(resPlotModelData) - obsDataLen)) {
	resPlotModelIndex = c((length(resPlotModelData) - obsDataLen  + 1):length(resPlotModelData))
} else {
	resPlotModelIndex = c(clickedIndex:(clickedIndex + obsDataLen - 1))
}
resPlotModelData = resPlotModelData[resPlotModelIndex]
resPlotModelData_scaled = resPlotModelData_scaled[resPlotModelIndex]


### Y lim 설정
checkInputYLim = c(resPlotObsData, resPlotModelData)
checkInputYLim_scaled = c(resPlotObsData_scaled, resPlotModelData_scaled)
inputYLim = c(min(checkInputYLim), max(checkInputYLim))
inputYLim_scaled = c(min(checkInputYLim_scaled), max(checkInputYLim_scaled))


### X축 인덱스와 바인드
resPlotObsData = cbind(resPlotModelIndex, resPlotObsData)
resPlotModelData = cbind(resPlotModelIndex, resPlotModelData)
resPlotObsData_scaled = cbind(resPlotModelIndex, resPlotObsData_scaled)
resPlotModelData_scaled = cbind(resPlotModelIndex, resPlotModelData_scaled)


returnPredictionPlot = function(inputObsData, inputModelData, inputObsDataLen, inputYLim)
{
	return(
		renderPlot( 
			{
				plot(inputModelData, type="n", xlab="y_t", ylab="t", ylim=inputYLim) 
				points(inputObsData[1:inputObsDataLen,], type="l", lwd=2) 
				points(inputModelData[1:inputObsDataLen,], type="l", col="red", lwd=2)

				legend("topleft", legend=c("Obs. Data", "Model Data"), col=c("black", "red"), lty=1:2, cex=0.8)
			}
		)
	)
}



### 출력
output$prediction_resultPlot_raw = returnPredictionPlot(resPlotObsData, resPlotModelData, obsDataLen, inputYLim)
output$prediction_resultPlot_scaled = returnPredictionPlot(resPlotObsData_scaled, resPlotModelData_scaled, obsDataLen, inputYLim_scaled)