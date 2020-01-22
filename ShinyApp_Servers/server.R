server = function(input, output, session) 
{  
	source(paste0(dir_functions, "functions.R"), local=TRUE)

	########## Menu: On_Paper
	##### Dataset 유형 선택
	observeEvent(input$On_Paper_radioButtons_selectDataset, 
		{
			source(paste0(dir_server, "server_On_Paper_radioButtons_selectDataset.R"), local=TRUE)
		} 	
	)
	
	
	##### Show Details
	observeEvent_On_Paper_switchInput_Show_details()

	
	##### Dataset 선택
	observeEvent(input$On_Paper_selectInput_datasetSelector, 
		{
			source(paste0(dir_server, "server_On_Paper_selectInput_datasetSelector.R"), local=TRUE)
		}
	)


	##### On_Paper_selectInput_analysisMode
	observeEvent_On_Paper_selectInput_analysisMode()
		
		
	##### 모델 선택: Analysis
	observeEvent(input$On_Paper_selectInput_modelSelector, 
		{ 
			source(paste0(dir_server, "server_On_Paper_selectInput_datasetSelector.R"), local=TRUE)
		}	
	)


	##### 모델 선택: Comparison
	observeEvent(input$On_Paper_selectInput_analysisModeModelSelector, 
		{	
			source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector.R"), local=TRUE)
		} 
	)


	##### 분석 방법 선택: Independence Test
	observeEvent(input$On_Paper_IndependenceTest_basedMethods, 
		{ 
			source(paste0(dir_server, "server_On_Paper_IndependenceTest_basedMethods.R"), local=TRUE)
		} 
	)
	
	
	##### 버튼을 눌러 분석 실행
	observeEvent(input$On_Paper_ButtonAnalysis, 
		{	
			source(paste0(dir_server, "server_On_Paper_ButtonAnalysis.R"), local=TRUE)
		} 
	)
	
	
	##### Prediction: ModelPlot을 클릭하면, 해당 인덱스부터의 Model Data와 Obs. Data와의 비교
	observeEvent(input$modelDataPlot_click$x, 
		{	
			source(paste0(dir_server, "server_On_Paper_prediction.R"), local=TRUE)
		}	
	)
	
	
	##### SP Test일 때는 signif를 활성화
	observeEvent(input$On_Paper_StructuralBreak_Methods,
		{
			if (length(grep("SP Test", input$On_Paper_StructuralBreak_Methods)) > 0) 	{	shinyjs::enable("On_Paper_StructuralBreak_Methods_signif") }
			else 																										{ 	shinyjs::disable("On_Paper_StructuralBreak_Methods_signif")	}
		}
	)
}

server = cmpfun(server)