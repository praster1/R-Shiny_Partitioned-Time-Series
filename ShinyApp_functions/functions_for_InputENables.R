### input Disables
inputDisables = function()
{
	shinyjs::disable("On_Paper_radioButtons_selectDataset")
	shinyjs::disable("On_Paper_selectInput_datasetSelector")
	shinyjs::disable("On_Paper_selectInput_modelSelector")
	shinyjs::disable("On_Paper_Scale_Methods")
	shinyjs::disable("On_Paper_IndependenceTest_basedMethods")
	shinyjs::disable("On_Paper_IndependenceTest_Methods")
	shinyjs::disable("On_Paper_IndependenceTest_Slider")
	shinyjs::disable("On_Paper_TrendTest_Methods")
	shinyjs::disable("On_Paper_TrendTest_Slider")
	shinyjs::disable("On_Paper_StructuralBreak_Methods")
	shinyjs::disable("On_Paper_StructuralBreak_Slider")
	shinyjs::disable("On_Paper_ButtonAnalysis")
	shinyjs::disable("On_Paper_selectInput_analysisMode")
}

### input Enables
inputEnables = function()
{
	shinyjs::enable("On_Paper_radioButtons_selectDataset")
	shinyjs::enable("On_Paper_selectInput_datasetSelector")
	shinyjs::enable("On_Paper_selectInput_modelSelector")
	shinyjs::enable("On_Paper_Scale_Methods")
	shinyjs::enable("On_Paper_IndependenceTest_basedMethods")
	shinyjs::enable("On_Paper_IndependenceTest_Methods")
	shinyjs::enable("On_Paper_IndependenceTest_Slider")
	shinyjs::enable("On_Paper_TrendTest_Methods")
	shinyjs::enable("On_Paper_TrendTest_Slider")
	shinyjs::enable("On_Paper_StructuralBreak_Methods")
	shinyjs::enable("On_Paper_StructuralBreak_Slider")
	shinyjs::enable("On_Paper_ButtonAnalysis")
	shinyjs::enable("On_Paper_selectInput_analysisMode")
}