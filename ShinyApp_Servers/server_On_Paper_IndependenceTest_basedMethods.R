if (input$On_Paper_IndependenceTest_basedMethods == "Statistical Test approaches") {
	selector = On_Paper_IndependenceTest_basedMethods_Statistical_Test_approaches_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Not Classified") {
	selector = On_Paper_IndependenceTest_basedMethods_not_classified_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Distance - L_p Minkowski Family") {
	selector = On_Paper_IndependenceTest_basedMethods_Distance_L_1_Minkowski_Family_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Distance - L_1 Family") {
	selector = On_Paper_IndependenceTest_basedMethods_Distance_L_1_Family_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Distance - Intersection Family") {
	selector = On_Paper_IndependenceTest_basedMethods_Distance_Intersection_Family_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Distance - Inner Product Family") {
	selector = On_Paper_IndependenceTest_basedMethods_Distance_Inner_Product_Family_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Distance - Squared L_2 Family") {
	selector = On_Paper_IndependenceTest_basedMethods_Distance_Squared_L_2_Family_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Distance - Combinations") {
	selector = On_Paper_IndependenceTest_basedMethods_Distance_Combinations_selectors
} else if (input$On_Paper_IndependenceTest_basedMethods == "Model-free approaches") {
	selector = On_Paper_IndependenceTest_basedMethods_Model_free_approaches_selectors
}
# } else if (input$On_Paper_IndependenceTest_basedMethods == "Model-based approaches") {
	# selector = On_Paper_IndependenceTest_basedMethods_Model_based_approaches_selectors
# } else if (input$On_Paper_IndependenceTest_basedMethods == "Complexity-based approaches") {
	# selector = On_Paper_IndependenceTest_basedMethods_Complexity_based_approaches_selectors
# } else if (input$On_Paper_IndependenceTest_basedMethods == "Prediction-based approaches") {
	# selector = On_Paper_IndependenceTest_basedMethods_Prediction_based_approaches_selectors
# }

updateSelectInput(session, inputId="On_Paper_IndependenceTest_Methods", choices=selector)