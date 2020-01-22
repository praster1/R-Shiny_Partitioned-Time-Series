### Color List
colorList = getColorList()




On_Paper_radioButtons_predictionMethod_selectors =
	c(	"Direct Comparison" = "direct_comparison",
		"STL based" = "stl_based")


### Synthetic or Real Dataset 여부 선택
On_Paper_radioButtons_selectDataset_selectors =
	c(	"Synthetic: Without Structural Breaks" = "without_structural_breaks",
		"Synthetic: With Structural Breaks" = "with_structural_breaks",
		"Real Dataset" = "realDatasets")

		
### Dataset 선택
selector_NS = c("NS", "NS_1", "NS_2", "NS_3", "NS_4", "NS_5", "NS_6", "NS_7")
selector_S = c("S", "S_1", "S_2", "S_3", "S_4", "S_5", "S_6", "S_7")


selector_Real = c(Korea_Univ = "Korea_Univ", ENTSO_E = "ENTSO_E", KEPCO2015 = "KEPCO2015")
# selector_Real = c(Korea_Univ = "Korea_Univ", ENTSO_E = "ENTSO_E", KEPCO2015 = "KEPCO2015", KEPCO2016 = "KEPCO2016", KEPCO2017 = "KEPCO2017", KEPCO2018 = "KEPCO2018")

		
### 분석 방법 선택
# Scale
On_Paper_Scale_Methods_selectors = c(	"Raw", "Centering", "Normalization"	)

# Comparison Test
On_Paper_IndependenceTest_basedMethods_selectors = 
	c(	"Statistical Test approaches",
		"Distance - L_p Minkowski Family",
		"Distance - L_1 Family",
		"Distance - Intersection Family",
		"Distance - Inner Product Family",
		"Distance - Squared L_2 Family",
		"Distance - Combinations",
		# "Model-free approaches",
		# "Model-based approaches",
		# "Complexity-based approaches",
		# "Prediction-based approaches",
		"Not Classified")

# Trend Test		
On_Paper_TrendTest_Methods_selectors = 
	c(	"Cox-Stuart Trend Test",
		"Runs Test")
		
		
# Structural Break Test
On_Paper_StructuralBreak_Methods_selectors = 
	c(	"ADF Test: None",
		"ADF Test: Trend",
		"ADF Test: Drift",
		"PP Test: Z-alpha, Trend",
		"PP Test: Z-alpha, Constant",
		"PP Test: Z-tau, Trend",
		"PP Test: Z-tau, Constant",
		"ERS Test: DF-GLS, Trend",
		"ERS Test: DF-GLS, Constant",
		"ERS Test: P-Test, Trend",
		"ERS Test: P-Test, Constant",
		"SP Test: tau",
		"SP Test: rho",
		"KPSS Test: mu",
		"KPSS Test: tau",
		"Zivot & Andrews Test: Intercept",
		"Zivot & Andrews Test: Trend",
		"Zivot & Andrews Test: Both"
		)
		

		
### On_Paper_IndependenceTest_basedMethods
# Statistical_Test_approaches
On_Paper_IndependenceTest_basedMethods_not_classified_selectors = 
	c(	
		# "Binary Distance",
		"Maximum Distance",
		"Mahalanobis Distance",
		"Energy Distance",
		"Wasserstein Distance")

# Statistical_Test_approaches
On_Paper_IndependenceTest_basedMethods_Statistical_Test_approaches_selectors = 
	c(	"Kolmogorov-Smirnov Test",
		"Runs test for two samples")

# Distance - L_p Minkowski Family
On_Paper_IndependenceTest_basedMethods_Distance_L_1_Minkowski_Family_selectors = 
	c(	"Euclidean Distance",
		"Minkowski Distance (p=1)",
		"Minkowski Distance (p=2)",
		"Manhattan Distance",
		"Chebyshev Distance"
		)

# Distance - L_1 Family
On_Paper_IndependenceTest_basedMethods_Distance_L_1_Family_selectors = 
	c(	"Sorensen Distance",
		"Gower Distance",
		# "Soergel Distance",
		"Kulczynski_d Distance",
		"Canberra Distance",
		"Lorentzian Distance"
		)

# Distance - Intersection Family
On_Paper_IndependenceTest_basedMethods_Distance_Intersection_Family_selectors = 
	c(	"Intersection Distance",
		"Non-intersection Distance",
		"Wavehedges Distance",
		"Czekanowski Distance",
		"motyka Distance"
		# "Kulczynski_s Distance",
		# "Tanimoto Distance",
		# "Ruzicka Distance",
		)
		
# Distance - Inner Product Family
On_Paper_IndependenceTest_basedMethods_Distance_Inner_Product_Family_selectors = 
	c(	"Inner_product Distance",
		"Harmonic_mean Distance",
		"Cosine Distance",
		"Hassebrook Distance",
		"Jaccard Distance",
		"Dice Distance"
		)

# Distance - Squared-chord Family
# On_Paper_IndependenceTest_basedMethods_Distance_Squared_chord_Family_selectors = 
	# c(	"Fidelity Distance",
		# "Bhattacharyya Distance",
		# "Hellinger Distance",
		# "Matusita Distance",
		# "Squared_chord Distance",
		# )

# Distance - Squared L_2 Family
On_Paper_IndependenceTest_basedMethods_Distance_Squared_L_2_Family_selectors = 
	c(	"Squared_euclidean Distance",
		"Pearson Distance",
		"Neyman Distance",
		"Squared_chi Distance",
		"Prob_symm Distance",
		"Divergence Distance",
		"Clark Distance",
		"Additive_symm Distance"
		)
		
# Distance - Shannon's entropy Family
# On_Paper_IndependenceTest_basedMethods_Distance_Shannons_Entropy_Family_selectors = 
	# c(	"Kullback_leibler Distance",
		# "Jeffreys Distance",
		# "K_divergence Distance",
		# "Topsoe Distance",
		# "Jensen_Shannon Distance",
		# "Jensen_difference Distance",
		# )
		
# Distance - Combinations
On_Paper_IndependenceTest_basedMethods_Distance_Combinations_selectors = 
	c(	# "Taneja Distance",
		# "Kumar_johnson Distance",
		"Avg Distance"
		)

# Model_free_approaches
On_Paper_IndependenceTest_basedMethods_Model_free_approaches_selectors = 
	c(	"Minkowski Distance (p=1)",
		"Minkowski Distance (p=2)"
		# "Frechet distance",
		# "An adaptive dissimilarity index covering both proximity on values and on behavior",
		# "Pearson's correlation",
		# "two cross-correlation-based distances"
		)

# Model_based_approaches		
# On_Paper_IndependenceTest_basedMethods_Model_based_approaches_selectors = 
	# c(	"Euclidean_Distance")
	
# Complexity_based_approaches
# On_Paper_IndependenceTest_basedMethods_Complexity_based_approaches_selectors = 
	# c(	"Euclidean_Distance")

# Prediction_based_approaches
# On_Paper_IndependenceTest_basedMethods_Prediction_based_approaches_selectors = 
	# c(	"Euclidean_Distance")
	
	
	
	
allMethods = c(	On_Paper_IndependenceTest_basedMethods_not_classified_selectors,
						On_Paper_IndependenceTest_basedMethods_Statistical_Test_approaches_selectors,
						On_Paper_IndependenceTest_basedMethods_Distance_L_1_Minkowski_Family_selectors,
						On_Paper_IndependenceTest_basedMethods_Distance_L_1_Family_selectors,
						On_Paper_IndependenceTest_basedMethods_Distance_Intersection_Family_selectors,
						On_Paper_IndependenceTest_basedMethods_Distance_Inner_Product_Family_selectors,
						# On_Paper_IndependenceTest_basedMethods_Distance_Squared_chord_Family_selectors,
						On_Paper_IndependenceTest_basedMethods_Distance_Squared_L_2_Family_selectors,
						# On_Paper_IndependenceTest_basedMethods_Distance_Shannons_Entropy_Family_selectors,
						On_Paper_IndependenceTest_basedMethods_Distance_Combinations_selectors,
						On_Paper_IndependenceTest_basedMethods_Model_free_approaches_selectors,
						# On_Paper_IndependenceTest_basedMethods_Model_based_approaches_selectors,
						# On_Paper_IndependenceTest_basedMethods_Complexity_based_approaches_selectors,
						# On_Paper_IndependenceTest_basedMethods_Prediction_based_approaches_selectors,
						On_Paper_TrendTest_Methods_selectors,
						On_Paper_StructuralBreak_Methods_selectors
					)
allMethods = sort(unique(allMethods))
 # [1,] "Additive_symm Distance"         
 # [2,] "ADF Test: Drift"                
 # [3,] "ADF Test: None"                 
 # [4,] "ADF Test: Trend"                
 # [5,] "Avg Distance"                   
 # [6,] "Canberra Distance"              
 # [7,] "Chebyshev Distance"             
 # [8,] "Clark Distance"                 
 # [9,] "Cosine Distance"                
# [10,] "Cox-Stuart Trend Test"          
# [11,] "Czekanowski Distance"           
# [12,] "Dice Distance"                  
# [13,] "Divergence Distance"            
# [14,] "Energy Distance"                
# [15,] "ERS Test: DF-GLS, Constant"     
# [16,] "ERS Test: DF-GLS, Trend"        
# [17,] "ERS Test: P-Test, Constant"     
# [18,] "ERS Test: P-Test, Trend"        
# [19,] "Euclidean Distance"             
# [20,] "Gower Distance"                 
# [21,] "Harmonic_mean Distance"         
# [22,] "Hassebrook Distance"            
# [23,] "Inner_product Distance"         
# [24,] "Intersection Distance"          
# [25,] "Jaccard Distance"               
# [26,] "Kolmogorov-Smirnov Test"        
# [27,] "KPSS Test: mu"                  
# [28,] "KPSS Test: tau"                 
# [29,] "Kulczynski_d Distance"          
# [30,] "Lorentzian Distance"            
# [31,] "Mahalanobis Distance"           
# [32,] "Manhattan Distance"             
# [33,] "Maximum Distance"               
# [34,] "Minkowski Distance (p=1)"       
# [35,] "Minkowski Distance (p=2)"       
# [36,] "motyka Distance"                
# [37,] "Neyman Distance"                
# [38,] "Non-intersection Distance"      
# [39,] "Pearson Distance"               
# [40,] "PP Test: Z-alpha, Constant"     
# [41,] "PP Test: Z-alpha, Trend"        
# [42,] "PP Test: Z-tau, Constant"       
# [43,] "PP Test: Z-tau, Trend"          
# [44,] "Prob_symm Distance"             
# [45,] "Runs Test"                      
# [46,] "Runs test for two samples"      
# [47,] "Sorensen Distance"              
# [48,] "SP Test: rho"                   
# [49,] "SP Test: tau"                   
# [50,] "Squared_chi Distance"           
# [51,] "Squared_euclidean Distance"     
# [52,] "Wasserstein Distance"           
# [53,] "Wavehedges Distance"            
# [54,] "Zivot & Andrews Test: Both"     
# [55,] "Zivot & Andrews Test: Intercept"
# [56,] "Zivot & Andrews Test: Trend"

# result < signIf   or   result > signIf
methodsInequality = rep("<", 56)
methodsInequality[c(26, 46)] = ">"
