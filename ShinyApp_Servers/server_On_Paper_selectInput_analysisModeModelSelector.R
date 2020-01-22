cat("\n\n\n\n\n********** server_On_Paper_selectInput_analysisModeModelSelector **********\n")


### 데이터 파일 불러오기: obsData, modelData, partialData
source(paste0(dir_functions_dataLoad, "dataLoad.R"), local=TRUE)



selectedModels = input$On_Paper_selectInput_analysisModeModelSelector
### 선택된 모델이 없을 때
if (length(selectedModels) == 0) {
	shinyalert("Error", "No candidate was selected.", type = "error")
### 선택된 모델이 있을 때
} else {
	C = findMatches(modelSelector, selectedModels)
	whichIDX = C@from						# 매칭되는 인덱스
	lenWhichIDX = length(whichIDX)		# 매칭되는 인덱스 길이
	
	
	cat("- modelSelector:")
	cat(modelSelector)
	cat("\n")
	cat(paste("- whichIDX:", whichIDX, "\n"))
	cat(paste("- lenWhichIDX:", lenWhichIDX, "\n"))
	
	vec_prior = formatDigit(rep(1/lenWhichIDX, length=lenWhichIDX))
	vec_likelihood_of_indep = rep("Before Analysis", length=lenWhichIDX);	vec_posterior_of_indep = rep("Before Analysis", length=lenWhichIDX)
	vec_likelihood_of_trend = rep("Before Analysis", length=lenWhichIDX);	vec_posterior_of_trend = rep("Before Analysis", length=lenWhichIDX)
	vec_likelihood_of_all = rep("Before Analysis", length=lenWhichIDX);		vec_posterior_of_all = rep("Before Analysis", length=lenWhichIDX)
	
	cat(paste("- vec_prior:", modelSelector, "\n"))
	cat(paste("- vec_likelihood_of_indep:", vec_likelihood_of_indep, "\n"))
	cat(paste("- vec_posterior_of_indep:", vec_posterior_of_indep, "\n"))
	cat(paste("- vec_likelihood_of_trend:", vec_likelihood_of_trend, "\n"))
	cat(paste("- vec_posterior_of_trend:", vec_posterior_of_trend, "\n"))
	cat(paste("- vec_likelihood_of_all:", vec_likelihood_of_all, "\n"))
	cat(paste("- vec_posterior_of_all:", vec_posterior_of_all, "\n"))
	
	
	source(paste0(dir_server, "server_On_Paper_selectInput_analysisModeModelSelector_setResultMatrix.R"), local=TRUE)
}


