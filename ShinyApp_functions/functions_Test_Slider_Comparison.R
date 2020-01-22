color = brewer.pal(n = 8, name = 'Set3')



##### 결과의 히스토그램 출력
### Independent Test
p_Model_hist(	whichIDX,
						modelHistSelector = "On_Paper_IndependenceTest_histogram", 
						tempRes = resultSet_independence,
						sliderName = "On_Paper_IndependenceTest_Slider",
						inputColor=color[1])
						
### Trend Test
p_Model_hist(	whichIDX,
						modelHistSelector = "On_Paper_TrendTest_histogram", 
						tempRes = resultSet_trend,
						sliderName = "On_Paper_TrendTest_Slider",
						inputColor=color[3])

vec_prior = formatDigit(rep(1/lenWhichIDX, length=lenWhichIDX))




##### get likelihood & posterior
### Independent Test
inequalityCheck_independence = methodsInequality[which(input$On_Paper_IndependenceTest_Methods == allMethods)]
inequalityCheck_trend = methodsInequality[which(input$On_Paper_TrendTest_Methods == allMethods)]

vec_likelihood_of_indep = unlist(pbmclapply(1:lenWhichIDX, 	getLikelihood_multi,
																				resultSet = resultSet_independence, 
																				signif = input$On_Paper_IndependenceTest_Slider,
																				comp = inequalityCheck_independence, mc.cores=numCores))
vec_posterior_of_indep = unlist(pbmclapply(1:lenWhichIDX, 	getPosterior_multi, 
																				likelihoodVec = vec_likelihood_of_indep, 
																				priorVec = vec_prior, mc.cores=numCores))
### Trend Test
vec_likelihood_of_trend = unlist(pbmclapply(1:lenWhichIDX, 	getLikelihood_multi,
																				resultSet = resultSet_trend, 
																				signif = input$On_Paper_TrendTest_Slider,
																				comp = inequalityCheck_trend, mc.cores=numCores))
vec_posterior_of_trend =  unlist(pbmclapply(1:lenWhichIDX, 	getPosterior_multi, 
																				likelihoodVec = vec_likelihood_of_trend, 
																				priorVec = vec_prior, mc.cores=numCores))


### All
vec_likelihood_of_all = unlist(pbmclapply(1:lenWhichIDX, 		getLikelihoodAll_multi,
																				resultSet_indep = resultSet_independence, 
																				signif_indep = input$On_Paper_IndependenceTest_Slider,
																				resultSet_trend = resultSet_trend, 
																				signif_trend = input$On_Paper_TrendTest_Slider,
																				mc.cores=numCores))
vec_posterior_of_all = unlist(pbmclapply(1:lenWhichIDX, 	getPosterior_multi,
																			likelihoodVec = vec_likelihood_of_all, 
																			priorVec = vec_prior,
																			mc.cores=numCores))


vec_likelihood_of_indep = formatDigit(vec_likelihood_of_indep);		vec_posterior_of_indep = formatDigit(vec_posterior_of_indep)
vec_likelihood_of_trend = formatDigit(vec_likelihood_of_trend);		vec_posterior_of_trend = formatDigit(vec_posterior_of_trend)
vec_likelihood_of_all = formatDigit(vec_likelihood_of_all);				vec_posterior_of_all = formatDigit(vec_posterior_of_all)


source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix.R"), local=TRUE)



### 클러스터링 네트워크 그래프를 위한 Bayes Factor
inputLikelihoodVec = as.numeric(trimws(vec_likelihood_of_indep))
tempNet = getBayesFactor(inputLikelihoodVec)
tempNet = list_to_matrix(tempNet, colNum=length(tempNet[[1]]))		# Bayes Factor Matrix

inputBF = as.numeric(c(tempNet))
# print(tempNet)
print(inputBF)