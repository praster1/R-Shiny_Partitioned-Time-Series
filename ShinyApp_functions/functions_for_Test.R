print("")
print("***** functions_for_Test *****")


testAllLapply = function(i, method, obsData, resPartialData, lag=4, signif=0.05)	
{
	tempResPartialData = resPartialData[[i]]
	
	 if (input$On_Paper_selectInput_analysisMode=="Comparison")	{	tempResPartialData = tempResPartialData[[1]]	}
	partialDataLen = length(tempResPartialData)
	
	source("./_functions/_func_Test_between_testVec_and_modelDataList.R", local=TRUE)
	source("./_functions/_func_Test_between_testVec_and_modelDataList_TrendTest.R", local=TRUE)
	source("./_functions/_func_Test_between_testVec_and_modelDataList_for_structuralBreak.R", local=TRUE)
	
	
	res = NULL
	
	if (method =="Euclidean Distance") {			### Independent Test
		res = pbmclapply(1:partialDataLen, euclidean_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Minkowski Distance (p=1)") {
		res = pbmclapply(1:partialDataLen, L1Norm_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Minkowski Distance (p=2)") {
		res = pbmclapply(1:partialDataLen, L2Norm_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Manhattan Distance") {
		res = pbmclapply(1:partialDataLen, manhattan_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Chebyshev Distance") {
		res = pbmclapply(1:partialDataLen, chebyshev_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Sorensen Distance") {
		res = pbmclapply(1:partialDataLen, sorensen_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Gower Distance") {
		res = pbmclapply(1:partialDataLen, gower_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Soergel Distance") {
		res = pbmclapply(1:partialDataLen, soergel_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Kulczynski_d Distance") {
		res = pbmclapply(1:partialDataLen, kulczynski_d_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Canberra Distance") {
		res = pbmclapply(1:partialDataLen, canberra_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Lorentzian Distance") {
		res = pbmclapply(1:partialDataLen, lorentzian_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Intersection Distance") {
		res = pbmclapply(1:partialDataLen, intersection_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Non-intersection Distance") {
		res = pbmclapply(1:partialDataLen, non_intersection_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Wavehedges Distance") {
		res = pbmclapply(1:partialDataLen, wavehedges_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Czekanowski Distance") {
		res = pbmclapply(1:partialDataLen, czekanowski_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "motyka Distance") {
		res = pbmclapply(1:partialDataLen, motyka_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Kulczynski_s Distance") {
		res = pbmclapply(1:partialDataLen, kulczynski_s_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Tanimoto Distance") {
		res = pbmclapply(1:partialDataLen, tanimoto_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Ruzicka Distance") {
		res = pbmclapply(1:partialDataLen, ruzicka_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Inner_product Distance") {
		res = pbmclapply(1:partialDataLen, inner_product_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Harmonic_mean Distance") {
		res = pbmclapply(1:partialDataLen, harmonic_mean_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Cosine Distance") {
		res = pbmclapply(1:partialDataLen, cosine_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Hassebrook Distance") {
		res = pbmclapply(1:partialDataLen, hassebrook_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Jaccard Distance") {
		res = pbmclapply(1:partialDataLen, jaccard_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Dice Distance") {
		res = pbmclapply(1:partialDataLen, dice_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Fidelity Distance") {
		res = pbmclapply(1:partialDataLen, fidelity_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Bhattacharyya Distance") {
		res = pbmclapply(1:partialDataLen, bhattacharyya_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Hellinger Distance") {
		res = pbmclapply(1:partialDataLen, hellinger_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Matusita Distance") {
		res = pbmclapply(1:partialDataLen, matusita_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Squared_chord Distance") {
		res = pbmclapply(1:partialDataLen, squared_chord_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Squared_euclidean Distance") {
		res = pbmclapply(1:partialDataLen, squared_euclidean_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Pearson Distance") {
		res = pbmclapply(1:partialDataLen, pearson_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Neyman Distance") {
		res = pbmclapply(1:partialDataLen, neyman_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Squared_chi Distance") {
		res = pbmclapply(1:partialDataLen, squared_chi_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Prob_symm Distance") {
		res = pbmclapply(1:partialDataLen, prob_symm_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Divergence Distance") {
		res = pbmclapply(1:partialDataLen, divergence_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Clark Distance") {
		res = pbmclapply(1:partialDataLen, clark_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Additive_symm Distance") {
		res = pbmclapply(1:partialDataLen, additive_symm_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Kullback_leibler Distance") {
		res = pbmclapply(1:partialDataLen, kullback_leibler_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Jeffreys Distance") {
		res = pbmclapply(1:partialDataLen, jeffreys_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "K_divergence Distance") {
		res = pbmclapply(1:partialDataLen, k_divergence_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Topsoe Distance") {
		res = pbmclapply(1:partialDataLen, topsoe_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Jensen_Shannon Distance") {
		res = pbmclapply(1:partialDataLen, jensen_shannon_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Jensen_difference Distance") {
		res = pbmclapply(1:partialDataLen, jensen_difference_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Taneja Distance") {
		res = pbmclapply(1:partialDataLen, taneja_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Kumar_johnson Distance") {
		res = pbmclapply(1:partialDataLen, kumar_johnson_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Avg Distance") {
		res = pbmclapply(1:partialDataLen, avg_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Binary Distance") {
		res = pbmclapply(1:partialDataLen, binary_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Maximum Distance") {
		res = pbmclapply(1:partialDataLen, maximum_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Mahalanobis Distance") {
		res = pbmclapply(1:partialDataLen, Mahalanobis_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Energy Distance") {
		res = pbmclapply(1:partialDataLen, distCorr_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Wasserstein Distance") {
		res = pbmclapply(1:partialDataLen, Wasserstein_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Kolmogorov-Smirnov Test") {
		res = pbmclapply(1:partialDataLen, ksTest_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Runs test for two samples") {
		res = pbmclapply(1:partialDataLen, runsTest_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
	} else if (method == "Cox-Stuart Trend Test") {			### Trend Tests
		res = pbmclapply(1:partialDataLen, CoxStuartTest_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "Runs Test") {
		res = pbmclapply(1:partialDataLen, RunsTest_between_testVec_and_modelDataList, obsData, tempResPartialData, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "ADF Test: None") {		### Structural Breaks
		res = pbmclapply(1:partialDataLen, ADFTest_None, tempResPartialData, lags = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "ADF Test: Trend") {
		res = pbmclapply(1:partialDataLen, ADFTest_Drift, tempResPartialData, lags = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "ADF Test: Drift") {
		res = pbmclapply(1:partialDataLen, ADFTest_Trend, tempResPartialData, lags = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "ERS Test: DF-GLS, Constant") {
		res = pbmclapply(1:partialDataLen, ERSTest_DFGLS_constant, lag.max = lag, tempResPartialData, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "ERS Test: DF-GLS, Trend") {
		res = pbmclapply(1:partialDataLen, ERSTest_DFGLS_trend, tempResPartialData, lag.max = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "ERS Test: P-Test, Constant") {
		res = pbmclapply(1:partialDataLen, ERSTest_PTest_constant, tempResPartialData, lag.max = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "ERS Test: P-Test, Trend") {
		res = pbmclapply(1:partialDataLen, ERSTest_PTest_trend, tempResPartialData, lag.max = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "KPSS Test: mu") {
		res = pbmclapply(1:partialDataLen, KPSSTest_mu, tempResPartialData, lags=lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "KPSS Test: tau") {
		res = pbmclapply(1:partialDataLen, KPSSTest_tau, tempResPartialData, lags=lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "PP Test: Z-alpha, Constant") {
		res = pbmclapply(1:partialDataLen, PPTest_ZAlpha_constant, tempResPartialData, lags=lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "PP Test: Z-alpha, Trend") {
		res = pbmclapply(1:partialDataLen, PPTest_ZAlpha_trend, tempResPartialData, lags=lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "PP Test: Z-tau, Constant") {
		res = pbmclapply(1:partialDataLen, PPTest_ZTau_constant, tempResPartialData, lags=lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "PP Test: Z-tau, Trend") {
		res = pbmclapply(1:partialDataLen, PPTest_ZTau_trend, tempResPartialData, lags=lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "SP Test: tau") {
		res = pbmclapply(1:partialDataLen, SPTest_Tau, tempResPartialData, polDeg = lag, signif = signif, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "SP Test: rho") {
		res = pbmclapply(1:partialDataLen, SPTest_Rho, tempResPartialData, polDeg = lag, signif = signif, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "Zivot & Andrews Test: Intercept") {
		res = pbmclapply(1:partialDataLen, ZATest_intercept, tempResPartialData, lags = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "Zivot & Andrews Test: Trend") {
		res = pbmclapply(1:partialDataLen, ZATest_trend, tempResPartialData, lags = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else if (method == "Zivot & Andrews Test: Both") {
		res = pbmclapply(1:partialDataLen, ZATest_both, tempResPartialData, lags = lag, mc.cores=numCores)
		res = pbmclapply(res, as.numeric, mc.cores=numCores)
	} else {
		res = NULL
	}
	
	return(unlist(res))
}