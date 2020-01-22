cat("\n*** server_On_Paper_ButtonAnalysis_Comparison ***\n")

	
# Run!
progressCountVal = 0;	progressMaxVal = 6
withProgress(message = 'Calculation in progress.', detail = 'This may take a while...', value = 0, 
	{			
		### 매칭되는 인덱스 추출
		cat("::::: 매칭되는 인덱스 추출\n")
		selectedModels = input$On_Paper_selectInput_analysisModeModelSelector
		C = findMatches(modelSelector, selectedModels)		# 매칭되는 레이블
		whichIDX = C@from						# 매칭되는 인덱스
		lenWhichIDX = length(whichIDX)		# 매칭되는 인덱스 길이


		cat(paste("whichIDX:", whichIDX, "\n"))

		
		### Independence Test & Trend Test
		# 분석: Independence Test
		cat("::::: Independence Test\n")
		# resultSet_independence = pblapply(	1:modelLen, testAllLapply,
		resultSet_independence = pblapply(	1:lenWhichIDX, testAllLapply,
																method=input$On_Paper_IndependenceTest_Methods,
																obsData=inputObsData, resPartialData=inputPartialData)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
		
		# 분석: Trend Test
		cat("::::: Trend Test\n")
		# resultSet_trend = pblapply(	1:modelLen, testAllLapply,
		resultSet_trend = pblapply(	1:lenWhichIDX, testAllLapply,
												method=input$On_Paper_TrendTest_Methods,
												obsData=inputObsData, resPartialData=inputPartialData)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
		
		# 슬라이더 교체
		cat("::::: 슬라이드 교체\n")
		updateSliderInput(session, inputId = "On_Paper_IndependenceTest_Slider", min=min(unlist(resultSet_independence)), max=max(unlist(resultSet_independence)), value=mean(unlist(resultSet_independence)))
		updateSliderInput(session, inputId = "On_Paper_TrendTest_Slider", min=min(unlist(resultSet_trend)), max=max(unlist(resultSet_trend)), value=mean(unlist(resultSet_trend)))
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)




		bayesFactorMatrixPlot = function(inputBFMat, selectedModels)
		{
			pal <- colorRampPalette(c(rgb(0.96,0.96,1), rgb(0.1,0.1,0.9)), space = "rgb")
			return(	renderPlot(	heatmap.2(inputBFMat, 	Rowv=FALSE, Colv=FALSE, 
																	dendrogram="none", main="Bayes Factor Matrix",
																	xlab="Columns", ylab="Rows", col=pal, tracecol="#303030", trace="none", cellnote=round(inputBFMat, 2),
																	notecol="black", notecex=1.5, keysize = 1, margins=c(5, 5),
																	labRow = selectedModels, labCol = selectedModels))
					)
		}
		
		

		# 슬라이더 교체 값 반영
		cat("::::: 슬라이더 교체 값 반영\n")
		observeEvent(input$On_Paper_IndependenceTest_Slider, 
			{ 
				source(paste0(dir_functions, "functions_Test_Slider_Comparison.R"), local=TRUE)
				output$bayesFactorMatrixPlot = bayesFactorMatrixPlot(tempNet, selectedModels)
			} 
		)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
		
		observeEvent(input$On_Paper_TrendTest_Slider, 
			{
				source(paste0(dir_functions, "functions_Test_Slider_Comparison.R"), local=TRUE)
				output$bayesFactorMatrixPlot = bayesFactorMatrixPlot(tempNet, selectedModels)
			} 
		)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)



		### 클러스터링
		# 슬라이더 교체 값 반영
		cat("::::: 클러스터링 - 슬라이더 교체 값 반영\n")
		observeEvent(input$On_Paper_Clustering_Slider, 
			{ 
				source(paste0(dir_functions, "functions_Test_Slider_Comparison.R"), local=TRUE)
			
				critVal = quantile(tempNet, input$On_Paper_Clustering_Slider)
				net = tbl_df(as.data.frame(matrix((tempNet <= critVal)*1, ncol=ncol(tempNet))))

				links = getLinks(net)
				elementsLen = nrow(net)
				nodes = getNodes(links, selectedModels)

				output$force <- renderForceNetwork({ plotClusterNetwork(links = links, nodes=  nodes) })
				
				# Bayes Factor matrix plot
				output$bayesFactorMatrixPlot = bayesFactorMatrixPlot(tempNet, selectedModels)
			}
		)
		progressCountVal = progressCountVal + 1;	incProgress(progressCountVal/progressMaxVal)
		

		
		### Likelihood accroding to Signif.
		# 모델 하나의 'Signif별 likelihood' 구하기
		cat("::::: Likelihood accroding to Signif\n")
		getLikelihood_accordingtoSignif = function(signif = 0.5, resVec, direction="<")
		{
			if (direction == "<")	{	return(sum((resVec < signif)*1)/length(resVec))	}
			else 						{	return(sum((resVec > signif)*1)/length(resVec))	}
		}

		
		# 각 모델별 'Signif별 likelihood' 구하기
		getAllRes_accordingtoSignif = function(modelIDX, resultSet, inputDirection)
		{
			x = seq(0.01, 1, length=100)
			inputRes = resultSet[[modelIDX]]
			res = unlist(pbmclapply(x, getLikelihood_accordingtoSignif, resVec=inputRes, direction=inputDirection, mc.cores=numCores))
			return(res)
		}

		inputDirection = methodsInequality[which(input$On_Paper_IndependenceTest_Methods == allMethods)]
		
		res_accordingtoSignif = pbmclapply(whichIDX, getAllRes_accordingtoSignif, resultSet = resultSet_independence, inputDirection = inputDirection,mc.cores=numCores)
		
		
		
		# Plot
		cat("::::: Likelihood accroding to Signif. - Plot\n")
		printRenderPlot = function(inputRes)
		{
			x = seq(0.01, 1, length=100)
			ylim = c(min(unlist(inputRes)), max(unlist(inputRes)))
			
			return(	renderPlot(
						{
							plot(x=x, y=inputRes[[1]], type="n", ylim=ylim, main=NULL, ylab="Likelihood", xlab="Signif Quantile")
							
							for (i in 1:lenWhichIDX)
							{
								points(x=x, y=inputRes[[i]], lwd=2, col=colorList[i], type="l")
							}
							
							legend("left", legend=selectedModels, col=colorList[1:lenWhichIDX], lty=1, cex=0.8, lwd=2)
						}
				)
			)
		}
		
		output$likelihood_according_to_signif = printRenderPlot(res_accordingtoSignif)
	}
)