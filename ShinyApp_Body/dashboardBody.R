js <- " $(document).on('shiny:value', function(event) {
				if(event.name === 'table'){
					var matches = event.value.match(/(%%+[^%]+%%)/g);
					var newvalue = event.value;
					for(var i=0; i<matches.length; i++){
						var code = '\\\\' + matches[i].slice(2,-2);
						newvalue = newvalue.replace(matches[i], katex.renderToString(code));
					}
					event.value = newvalue;
				}
				})"


body = dashboardBody(
	shinyDashboardThemes(	theme = "boe_website"	),
	tags$head( tags$style( HTML(".shiny-notification { height: 100px; width: 800px; position:fixed; top: calc(50%);; left: calc(50%);; } " ) ) ),	# Progress
	tags$head( tags$link(	rel="stylesheet", href="https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/katex.min.css",
										integrity="sha384-9tPv11A+glH/on/wEu99NVwDPwkMQESOocs/ZGXPoIiLE8MU/qkqUcZ3zzL+6DuH",
										crossorigin="anonymous"),
										tags$script(	src="https://cdn.jsdelivr.net/npm/katex@0.10.0-beta/dist/katex.min.js",
															integrity="sha384-U8Vrjwb8fuHMt6ewaCy8uqeUXv4oitYACKdB0VziCerzt011iQ/0TqlSlv8MReCm",
															crossorigin="anonymous"),
										tags$script(HTML(js))
						),

	tabItems(
		################################
		##### Menu: Experiments - Start #####
		################################
		tabItem(tabName = "Experiments",
			sidebarLayout(

				########## sidebar panel
				sidebarPanel(width=3,
					useShinyjs(),
					useShinyalert(),
					fluidRow(
						box(	fluidRow(	# Synthetic or Real Dataset 여부 선택
												radioButtons(	"On_Paper_radioButtons_selectDataset", "Select Dataset:", On_Paper_radioButtons_selectDataset_selectors)
								),
								fluidRow(	# Dataset 선택
												box(	selectInput( "On_Paper_selectInput_datasetSelector", "Dataset Selection:", c("NS1", "NS2")))
								),
								width=12
						)
					),
					fluidRow(	box(	title="Obs. data", status = "primary", dygraphOutput("obsDataPlot", height="235px"), width=12) ),
					fluidRow(
						box(	
							fluidRow(
								box(	title="Options", status = "warning",
										materialSwitch( inputId = "On_Paper_switchInput_Show_details", label="Show Details:", value = FALSE, status = "danger")
									)
							),	
							width=12
						)
					)
				),

				########## main panel
				mainPanel(width=8,
					fluidRow(	
						# 모델 데이터 출력
						tags$div(id="On_Paper_selectInput_analysisMode_returnBox_tag_off",
									tabBox( title="Return Box",
										tabPanel("Raw Data", 		dygraphOutput("modelDataPlot", height="235px")),
										tabPanel("Scaled Data",	dygraphOutput("modelDataPlot_scaledData", height="235px")),
										# Prediction
										dropdownButton(inputId="dropdown", status = "primary", icon=icon("chart-area"),	
											tags$div(
												style = "color: black !important;", # for text
												style = "background-color: #99FF33 !important; color: #444 !important; border: 1px solid #ddd !important;", # for button
												tags$h4("　Prediction"),
												box(
													column(3, 
														box(	id = "prediction_textBox",
																strong("Clicked Index: "), textOutput("prediction_clicked", inline = TRUE),
																	selectInput( "On_Paper_selectInput_predictionSelector", "Method:", On_Paper_radioButtons_predictionMethod_selectors),
																	width=12
														)
													),
													column(9,
														tabBox( title=NULL,
																	tabPanel("Raw", 		plotOutput("prediction_resultPlot_raw")),
																	tabPanel("Scaled",		plotOutput("prediction_resultPlot_scaled")),
																	width=12
														)
													),
													width=12
												),
												width = 1000
											),
											tags$style(HTML('#sw-content-dropdown, .sw-dropdown-in {background-color: red;}')),
											width = 1070
										),
										
										# Details 모델 데이터 출력
										fluidRow(
											tags$div(id="showDetailsBox",
												box(
													panel(
														"Results of Comparson Test",
														dygraphOutput("modelDataPlot_comparisonTest", height="100px", width="100%"),
														"Results of Trend Test",
														dygraphOutput("modelDataPlot_trendTest", height="100px", width="100%"),
														"Results of Unit Root Test",
														dygraphOutput("modelDataPlot_structuralBreakTest", height="100px", width="100%")
													),
													width=12
												)
											),	width=12
										),
										# Likelihood 출력
										fluidRow(
											box( id = "showDetailsBox_likelihood", 				# Likelihood 출력 valueBox
														valueBoxOutput(outputId="likelihood_result", width = 4),
														valueBoxOutput(outputId="likelihood_comparison", width = 4),
														valueBoxOutput(outputId="likelihood_trend", width = 4),
														width=12
											),	width=12
										),
										width=12
									),									
									width=12 
						),
						# 비교 결과 표 출력
						tags$div(id="On_Paper_selectInput_analysisMode_returnBox_tag_on",
									fluidRow(
										box( title="Return Box", status = "danger", 
												DT::dataTableOutput( "modelComparisonSummary", height="300px"),
												width=12
										),	width=12
									),
									# Details 모델 데이터 출력
									fluidRow(
										tags$div(id="showDetailsBox_comparison",
												box(title=NULL, 
													forceNetworkOutput("force"),
													fluidRow(
														sliderInput( inputId="On_Paper_Clustering_Slider", "Signif. Level of Bayes Factor", min=0, max=1, value = 0.5)
													)
												),
												box(title=NULL, 
													fluidRow(
														tabBox( title=NULL,
																	tabPanel("Bayes Factor", plotOutput("bayesFactorMatrixPlot")),
																	tabPanel("Likelihood according to Signif.", plotOutput("likelihood_according_to_signif")),
																	# tabPanel("Likelihood according to Signif.", dygraphOutput("likelihood_according_to_signif")),
																	width=12
														)
													)
												)
											)
									),	width=12
						)
					),
					fluidRow(
						##### Control Box
						box(title="Control Box",
							panel(
								## Comparison 여부 선택
								fluidRow(
									column(3, "" ),
									column(6,
										radioGroupButtons(
											inputId = "On_Paper_selectInput_analysisMode", status = "info",
											choices = c(	`<i class='fa fa-align-left'> Description</i>` = "Description", 
																`<i class='fa fa-line-chart'> Analysis</i>` = "Analysis", 
																`<i class='fa fa-pie-chart'> Comparison</i>` = "Comparison"
															),
											size = "lg",
											justified = TRUE,
											selected = "Description",
											checkIcon = list(yes = icon("check"))
										),
										tags$script("$(\"input:radio[name='On_Paper_selectInput_analysisMode'][value='Description']\").parent().css('background-color', '#4DA5A5');"),
										tags$script("$(\"input:radio[name='On_Paper_selectInput_analysisMode'][value='Analysis']\").parent().css('background-color', '#F39C12');"),
										tags$script("$(\"input:radio[name='On_Paper_selectInput_analysisMode'][value='Comparison']\").parent().css('background-color', '#00A65A');")
									),
									column(3, "" ),
									width=12
								),
								## Model 선택
								fluidRow(	
									tags$div(id="On_Paper_selectInput_analysisMode_tag_off",
												radioGroupButtons(	inputId = "On_Paper_selectInput_modelSelector", 
																				label = "Model Selection:", 
																				choices = c("A"), 
																				justified = TRUE,
																				status = "warning"
												)
									),
									tags$div(id="On_Paper_selectInput_analysisMode_tag_on",
												checkboxGroupButtons(
													inputId = "On_Paper_selectInput_analysisModeModelSelector",
													label = "Model Selection:",
													choices = c("A"),
													justified = TRUE,
													status="success",
													checkIcon = list(yes = icon("ok", lib = "glyphicon"))
												),
												width=12
									)
								),
								tags$div(	id="On_Paper_selectInput_analysisMode_tag_description_on",
									### Model Description
									column(4, 
										tags$div(id="On_Paper_selectInput_analysisMode_modeDescription_synthetic_tag",
											fluidRow(	
												fluidPage(
													title = 'Model Description',
													withMathJax(),
													helpText("The following candidates are based on the following models."),
													uiOutput("ModelExpression1"),
													uiOutput("ModelExpression2"),
													uiOutput("ModelExpression3"),
													tableOutput("ModelExpressionTableUI") 
												)
											)
										)
									),
									column(4,
										# 관측된 데이터 출력							
										fluidRow(	box(	title="Summary of obs. data", status = "primary", solidHeader = TRUE,
																DT::dataTableOutput( "obsDataSummary", height="235px"), width=12
															)
										)
									),
									column(4, 
										fluidRow(	box(	title="Summary of candidate data", status = "danger", solidHeader = TRUE,
																DT::dataTableOutput( "modelDataSummary", height="235px"), width=12
															)
										)
									)
								),
								tags$div(	id="On_Paper_selectInput_analysisMode_tag_description_off",
									## 분석 방법 선택
									fluidRow(	# Selector
													box(title="Scale", status = "success", 
															radioGroupButtons( 	inputId = "On_Paper_Scale_Methods", label = "Method Selection:",
																								direction = "vertical", status="info",
																								choices = On_Paper_Scale_Methods_selectors,
																								selected = On_Paper_Scale_Methods_selectors[3]
															),
															width=2
													),
													# Independence Test
													box(title="Independence Test", status = "success", 
															selectInput( inputId="On_Paper_IndependenceTest_basedMethods", "Method Selection:",
																				choices = On_Paper_IndependenceTest_basedMethods_selectors,
																				selected = On_Paper_IndependenceTest_basedMethods_selectors[1]
															),
															selectInput( inputId="On_Paper_IndependenceTest_Methods", NULL, c("Euclidean_Distance")
															),
															width=3
													),
													# Trend Test
													box(title="Trend Test", status = "success", 
															selectInput( inputId="On_Paper_TrendTest_Methods", "Method Selection:",
																			choices = On_Paper_TrendTest_Methods_selectors,
																			selected = On_Paper_TrendTest_Methods_selectors[1]
															),
															width=3
													),
													# Structural Break Test
													box(title="Structural Break Test", status = "success", 
															selectInput( inputId="On_Paper_StructuralBreak_Methods", "Method Selection:",
																			choices = On_Paper_StructuralBreak_Methods_selectors,
																			selected = On_Paper_StructuralBreak_Methods_selectors[1]
															),
															column(6, numericInput( inputId="On_Paper_StructuralBreak_Methods_lags", label = "Lag:", value = 1, min = 1, max = 10)),
															column(6, numericInput( inputId="On_Paper_StructuralBreak_Methods_signif", label = "Signif.", value = 0.05, min = 0.0001, max = 0.9999)),
															width=3
													),
													box(title="Run", status = "success", 
															actionButton("On_Paper_ButtonAnalysis", "Run!"),
															width=1
													)
									),
									fluidRow(	# SlideBar and Histogram
													box(width=2),
													# Independence Test
													box(	tags$div( plotlyOutput("On_Paper_IndependenceTest_histogram", height="250px") ),	
															sliderInput( inputId="On_Paper_IndependenceTest_Slider", "Signif. of Indep. Test", min=0, max=1, value = 0.5),
															width=3	
													),	
													# Trend Test
													box(	tags$div( plotlyOutput("On_Paper_TrendTest_histogram", height="250px") ),
															sliderInput( inputId="On_Paper_TrendTest_Slider", "Signif. of Trend Test", min=0, max=1, value = 0.5),
															width=3	
													),
													# Structural Break Test
													box(	tags$div( plotlyOutput("On_Paper_Structuralbreak_histogram", height="250px") ),
															sliderInput( inputId="On_Paper_StructuralBreak_Slider", "Signif. of Unit Root Test", min=0, max=1, value = 0.5),
															width=3	
													),
													box(width=1)
									),
									width=12
								)
							),
							width=12
						)
					)
				)
			)
		),
		###############################
		##### Menu: On_Paper - End #####
		###############################
		tabItem(tabName = "Introduction", h2("Introduction") )
	)
)