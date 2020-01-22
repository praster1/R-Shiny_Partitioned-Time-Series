cat("\n\n\n\n\n********** server_On_Paper_radioButtions-selectDataset **********\n")


selector = NULL
			
if (input$On_Paper_radioButtons_selectDataset == "without_structural_breaks") {
	selector = selector_NS
} else if (input$On_Paper_radioButtons_selectDataset == "with_structural_breaks") {
	selector = selector_S
} else if (input$On_Paper_radioButtons_selectDataset == "realDatasets") {
	selector = selector_Real
}

updateSelectInput(session, inputId="On_Paper_selectInput_datasetSelector", choices=selector)