### Show Details
observeEvent_On_Paper_switchInput_Show_details = function()
{
	observeEvent(input$On_Paper_switchInput_Show_details, 
		{
			if (input$On_Paper_switchInput_Show_details) {
				shinyjs::show(id = "showDetailsBox") 
				shinyjs::show(id = "showDetailsBox_comparison") 
			} else { 
				shinyjs::hide(id = "showDetailsBox") 
				shinyjs::hide(id = "showDetailsBox_comparison") 
			}
		}
	)
}



### On_Paper_selectInput_analysisMode
observeEvent_On_Paper_selectInput_analysisMode = function()
{
	# cat("\n\n\n\n\n***** functions_for_showHide - observeEvent_On_Paper_selectInput_analysisMode *****\n")
	# cat(paste("input$On_Paper_selectInput_analysisMode:", input$On_Paper_selectInput_analysisMode, "\n"))
	
	observeEvent(input$On_Paper_selectInput_analysisMode, 
		{
			if (input$On_Paper_selectInput_analysisMode=="Description") {
				shinyjs::show(id = "On_Paper_selectInput_analysisMode_tag_description_on") 
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_tag_description_off") 
				
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_tag_on") 
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_returnBox_tag_on") 
				
			} else if (input$On_Paper_selectInput_analysisMode=="Comparison") {
				shinyjs::show(id = "On_Paper_selectInput_analysisMode_tag_description_off") 
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_tag_description_on") 
				
				shinyjs::show(id = "On_Paper_selectInput_analysisMode_tag_on") 
				shinyjs::show(id = "On_Paper_selectInput_analysisMode_returnBox_tag_on") 
				
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_tag_off") 
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_returnBox_tag_off") 
				 
			} else { 
				shinyjs::show(id = "On_Paper_selectInput_analysisMode_tag_description_off") 
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_tag_description_on") 
				
				shinyjs::show(id = "On_Paper_selectInput_analysisMode_tag_off")
				shinyjs::show(id = "On_Paper_selectInput_analysisMode_returnBox_tag_off")
				
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_tag_on") 
				shinyjs::hide(id = "On_Paper_selectInput_analysisMode_returnBox_tag_on") 
			}
		}
	)
}