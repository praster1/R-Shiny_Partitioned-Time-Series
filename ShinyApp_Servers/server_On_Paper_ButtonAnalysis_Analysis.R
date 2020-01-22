cat("\n*** server_On_Paper_ButtonAnalysis_Analysis ***\n")


# Run!
progressCountVal = 0;	progressMaxVal = 5
withProgress(message = 'Calculation in progress.', detail = 'This may take a while...', value = 0, 
	{
		##### 분석
		# Independence Test
		cat("::::: Independence Test\n")
		cat(paste("- input$On_Paper_IndependenceTest_Methods:", input$On_Paper_IndependenceTest_Methods, "\n"))
		# resultSet_independence = testAllLapply(	selectedModelSelectorIDX,
		resultSet_independence = testAllLapply(	1,
																method=input$On_Paper_IndependenceTest_Methods, 
																obsData=inputObsData, resPartialData=inputPartialData)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)

		### Trend Test
		cat("::::: Trend Test\n")
		cat(paste("- input$On_Paper_TrendTest_Methods:", input$On_Paper_TrendTest_Methods, "\n"))
		# resultSet_trend = testAllLapply(		selectedModelSelectorIDX, 
		resultSet_trend = testAllLapply(	1, 
														method=input$On_Paper_TrendTest_Methods, 
														obsData=inputObsData, resPartialData=inputPartialData)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)

		
		
		### Structural Break Test
		cat("::::: Structural Break Test\n")
		cat(paste("- input$On_Paper_StructuralBreak_Methods_lags:", input$On_Paper_StructuralBreak_Methods_lags, "\n"))
		cat(paste("- input$On_Paper_StructuralBreak_Methods_signif:", input$On_Paper_StructuralBreak_Methods_signif, "\n"))
		cat(paste("- input$On_Paper_StructuralBreak_Methods:", input$On_Paper_StructuralBreak_Methods, "\n"))
		
		# resultSet_structuralBreak = testAllLapply(	selectedModelSelectorIDX, 
		resultSet_structuralBreak = testAllLapply(	1, 
																		method=input$On_Paper_StructuralBreak_Methods, 
																		obsData=inputObsData, resPartialData=inputPartialData,
																		lag=input$On_Paper_StructuralBreak_Methods_lags, 
																		signif=input$On_Paper_StructuralBreak_Methods_signif)

		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
		
		
		
		##### 슬라이더 교체
		cat("::::: 슬라이더 교체\n")
		updateSliderInput(session, inputId = "On_Paper_IndependenceTest_Slider", min=min(resultSet_independence), max=max(resultSet_independence), value=mean(resultSet_independence))
		updateSliderInput(session, inputId = "On_Paper_TrendTest_Slider", min=min(resultSet_trend), max=max(resultSet_trend), value=mean(resultSet_trend))
		updateSliderInput(session, inputId = "On_Paper_StructuralBreak_Slider", min=min(resultSet_structuralBreak), max=max(resultSet_structuralBreak), value=mean(resultSet_structuralBreak))
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
		
		
		
		### Independence and Trend Test 히스토그램 출력
		cat("::::: Independence and Trend Test 히스토그램 출력\n")
		# observeEvent_On_Paper_Test_Slider_Analysis(	resRawData = readModelData(modelData, selectedModelSelectorIDX),
																				# resModelData = inputModelData, 
																				# resPartialData = inputPartialData,
																				# resultSet_independence = resultSet_independence,
																				# resultSet_trend = resultSet_trend, 
																				# resultSet_structuralBreak = resultSet_structuralBreak,
																				# selectedModelSelectorIDX = selectedModelSelectorIDX)
		observeEvent_On_Paper_Test_Slider_Analysis(	resRawData = readModelData(modelData, selectedModelSelectorIDX),
																				resModelData = inputModelData, 
																				resPartialData = inputPartialData,
																				resultSet_independence = resultSet_independence,
																				resultSet_trend = resultSet_trend, 
																				resultSet_structuralBreak = resultSet_structuralBreak,
																				selectedModelSelectorIDX = 1)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
		
		
		
		### 모델 데이터 플랏 및 요약데이블 출력
		cat("::::: 모델 데이터 플랏 및 요약데이블 출력\n")
		modelDataPrint(	selectedModelData = inputSelectedModelData, 
								selectedModelRawData = readModelData(modelData, selectedModelSelectorIDX),
								testPlotNULL = FALSE)	
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
	}
)