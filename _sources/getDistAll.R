##### 테스트
getDistAll = function(i, type="Euclidean")
{
	partialData = readRDS(paste0(fileDir_partial, listFiles_partial[i]))
	res = NULL
	
	
	# 1. Euclidean
	if (type=="Euclidean")			{	res = unlist(pbmclapply(1:length(partialData$data), euclidean_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 2. L1Norm
	if (type=="L1Norm")				{	res = unlist(pbmclapply(1:length(partialData$data), L1Norm_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 3. L2Norm
	if (type=="L2Norm")				{	res = unlist(pbmclapply(1:length(partialData$data), L2Norm_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 4. manhattan
	if (type=="Manhattan")			{	res = unlist(pbmclapply(1:length(partialData$data), manhattan_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 5. chebyshev
	if (type=="chebyshev")			{	res = unlist(pbmclapply(1:length(partialData$data), chebyshev_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 6. sorensen
	if (type=="sorensen")				{	res = unlist(pbmclapply(1:length(partialData$data), sorensen_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 7. gower
	if (type=="gower")					{	res = unlist(pbmclapply(1:length(partialData$data), gower_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# soergel
	if (type=="soergel")				{	 res = unlist(pbmclapply(1:length(partialData$data), soergel_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	} 
	
	# 8. kulczynski_d
	if (type=="kulczynski_d")		{	res = unlist(pbmclapply(1:length(partialData$data), kulczynski_d_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores =	 numCores))	}
	
	# 9. canberra
	if (type=="canberra")				{	res = unlist(pbmclapply(1:length(partialData$data), canberra_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 10. lorentzian
	if (type=="lorentzian")			{	res = unlist(pbmclapply(1:length(partialData$data), lorentzian_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 11. intersection
	if (type=="intersection")			{	res = unlist(pbmclapply(1:length(partialData$data), intersection_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 12. non_intersection
	if (type=="non_intersection")	{	res = unlist(pbmclapply(1:length(partialData$data), non_intersection_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 13. wavehedges
	if (type=="wavehedges")		{	res = unlist(pbmclapply(1:length(partialData$data), wavehedges_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 14. czekanowski
	if (type=="czekanowski")		{	res = unlist(pbmclapply(1:length(partialData$data), czekanowski_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 15. motyka
	if (type=="motyka")				{	res = unlist(pbmclapply(1:length(partialData$data), motyka_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# kulczynski_s
	if (type=="kulczynski_s")		{	res = unlist(pbmclapply(1:length(partialData$data), kulczynski_s_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# tanimoto
	if (type=="tanimoto")				{	res = unlist(pbmclapply(1:length(partialData$data), tanimoto_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))		}
	
	# ruzicka
	if (type=="ruzicka")				{  res = unlist(pbmclapply(1:length(partialData$data), ruzicka_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores)) 	}

	# 18. inner_product
	if (type=="inner_product")		{	res = unlist(pbmclapply(1:length(partialData$data), inner_product_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 19. harmonic_mean
	if (type=="harmonic_mean")	{	res = unlist(pbmclapply(1:length(partialData$data), harmonic_mean_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 20. cosine
	if (type=="cosine")					{	res = unlist(pbmclapply(1:length(partialData$data), cosine_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 21. hassebrook
	if (type=="hassebrook")			{	res = unlist(pbmclapply(1:length(partialData$data), hassebrook_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 22. jaccard
	if (type=="jaccard")				{	res = unlist(pbmclapply(1:length(partialData$data), jaccard_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 23. dice
	if (type=="dice")					{	res = unlist(pbmclapply(1:length(partialData$data), dice_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# fidelity
	if (type=="fidelity")					{	res = unlist(pbmclapply(1:length(partialData$data), fidelity_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# bhattacharyya
	if (type=="bhattacharyya")		{	res = unlist(pbmclapply(1:length(partialData$data), bhattacharyya_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}

	# hellinger
	if (type=="hellinger")				{	res = unlist(pbmclapply(1:length(partialData$data), hellinger_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
		
	# matusita
	if (type=="matusita")				{	res = unlist(pbmclapply(1:length(partialData$data), matusita_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# squared_chord
	if (type=="squared_chord")	{	res = unlist(pbmclapply(1:length(partialData$data), squared_chord_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# 24. squared_euclidean
	if (type=="squared_euclidean")	{	res = unlist(pbmclapply(1:length(partialData$data), squared_euclidean_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 25. pearson
	if (type=="pearson")				{	res = unlist(pbmclapply(1:length(partialData$data), pearson_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 26. neyman
	if (type=="neyman")				{	res = unlist(pbmclapply(1:length(partialData$data), neyman_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 27. squared_chi
	if (type=="squared_chi")			{	res = unlist(pbmclapply(1:length(partialData$data), squared_chi_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 28. prob_symm
	if (type=="prob_symm")			{	res = unlist(pbmclapply(1:length(partialData$data), prob_symm_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 29. divergence
	if (type=="divergence")			{	res = unlist(pbmclapply(1:length(partialData$data), divergence_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 30. clark
	if (type=="clark")					{	res = unlist(pbmclapply(1:length(partialData$data), clark_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# additive_symm
	if (type=="additive_symm")		{	res = unlist(pbmclapply(1:length(partialData$data), additive_symm_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# kullback_leibler
	if (type=="kullback_leibler")		{	res = unlist(pbmclapply(1:length(partialData$data), kullback_leibler_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# jeffreys
	if (type=="jeffreys")				{	res = unlist(pbmclapply(1:length(partialData$data), jeffreys_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# k_divergence
	if (type=="k_divergence")		{	res = unlist(pbmclapply(1:length(partialData$data), k_divergence_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# topsoe
	if (type=="topsoe")				{	res = unlist(pbmclapply(1:length(partialData$data), topsoe_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))		}
	 
	# jensen_shannon
	if (type=="jensen_shannon")	{	res = unlist(pbmclapply(1:length(partialData$data), jensen_shannon_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# jensen_difference
	if (type=="jensen_difference") {	res = unlist(pbmclapply(1:length(partialData$data), jensen_difference_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# taneja
	if (type=="taneja")					{	res = unlist(pbmclapply(1:length(partialData$data), taneja_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# kumar_johnson
	if (type=="kumar_johnson")	{	res = unlist(pbmclapply(1:length(partialData$data), kumar_johnson_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# 31. avg
	if (type=="avg")						{	res = unlist(pbmclapply(1:length(partialData$data), avg_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# binary
	if (type=="binary")					{	res = unlist(pbmclapply(1:length(partialData$data), binary_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	 
	# 32. maximum
	if (type=="maximum")				{	res = unlist(pbmclapply(1:length(partialData$data), maximum_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 33. Mahalanobis
	if (type=="Mahalanobis")		{	res = unlist(pbmclapply(1:length(partialData$data), Mahalanobis_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 34. energy
	if (type=="energy")					{	res = unlist(pbmclapply(1:length(partialData$data), distCorr_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 35. Wasserstein
	if (type=="Wasserstein")		{	res = unlist(pbmclapply(1:length(partialData$data), Wasserstein_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 36. ksTest
	if (type=="ksTest")					{	res = unlist(pbmclapply(1:length(partialData$data), ksTest_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	# 37. runsTest
	if (type=="runsTest")				{	res = unlist(pbmclapply(1:length(partialData$data), runsTest_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))		}
	
	# 38. CoxStuartTest
	if (type=="CoxStuartTest")		{	res = unlist(pbmclapply(1:length(partialData$data), CoxStuartTest_between_testVec_and_modelDataList, obsDataVec, partialData$data, mc.cores = numCores))	}
	
	
	return(res)
}


print("Euclidean")
res_Euclidean = pbmclapply(1:modelLen, getDistAll, type="Euclidean")
print("L1Norm")
res_L1Norm = pbmclapply(1:modelLen, getDistAll, type="L1Norm")
print("L2Norm")
res_L2Norm = pbmclapply(1:modelLen, getDistAll, type="L2Norm")
print("Manhattan")
res_manhattan = pbmclapply(1:modelLen, getDistAll, type="Manhattan")
print("chebyshev")
res_chebyshev = pbmclapply(1:modelLen, getDistAll, type="chebyshev")
print("sorensen")
res_sorensen = pbmclapply(1:modelLen, getDistAll, type="sorensen")
print("gower")
res_gower = pbmclapply(1:modelLen, getDistAll, type="gower")
print("soergel")
res_soergel = pbmclapply(1:modelLen, getDistAll, type="soergel")
print("kulczynski_d")
res_kulczynski_d = pbmclapply(1:modelLen, getDistAll, type="kulczynski_d")
print("canberra")
res_canberra = pbmclapply(1:modelLen, getDistAll, type="canberra")
print("lorentzian")
res_lorentzian = pbmclapply(1:modelLen, getDistAll, type="lorentzian")
print("intersection")
res_intersection = pbmclapply(1:modelLen, getDistAll, type="intersection")
print("non_intersection")
res_non_intersection = pbmclapply(1:modelLen, getDistAll, type="non_intersection")
print("wavehedges")
res_wavehedges = pbmclapply(1:modelLen, getDistAll, type="wavehedges")
print("czekanowski")
res_czekanowski = pbmclapply(1:modelLen, getDistAll, type="czekanowski")
print("motyka")
res_motyka = pbmclapply(1:modelLen, getDistAll, type="motyka")
print("kulczynski_s")
res_kulczynski_s = pbmclapply(1:modelLen, getDistAll, type="kulczynski_s")
print("tanimoto")
res_tanimoto = pbmclapply(1:modelLen, getDistAll, type="tanimoto")
print("ruzicka")
res_ruzicka = pbmclapply(1:modelLen, getDistAll, type="ruzicka")
print("inner_product")
res_inner_product = pbmclapply(1:modelLen, getDistAll, type="inner_product")
print("harmonic_mean")
res_harmonic_mean = pbmclapply(1:modelLen, getDistAll, type="harmonic_mean")
print("cosine")
res_cosine = pbmclapply(1:modelLen, getDistAll, type="cosine")
print("hassebrook")
res_hassebrook = pbmclapply(1:modelLen, getDistAll, type="hassebrook")
print("jaccard")
res_jaccard = pbmclapply(1:modelLen, getDistAll, type="jaccard")
print("dice")
res_dice = pbmclapply(1:modelLen, getDistAll, type="dice")
print("squared_euclidean")
res_squared_euclidean = pbmclapply(1:modelLen, getDistAll, type="squared_euclidean")
print("pearson")
res_pearson = res_neyman = pbmclapply(1:modelLen, getDistAll, type="pearson")
print("neyman")
res_neyman = pbmclapply(1:modelLen, getDistAll, type="neyman")
print("squared_chi")
res_squared_chi = pbmclapply(1:modelLen, getDistAll, type="squared_chi")
print("prob_symm")
res_prob_symm = pbmclapply(1:modelLen, getDistAll, type="prob_symm")
print("divergence")
res_divergence = pbmclapply(1:modelLen, getDistAll, type="divergence")
print("clark")
res_clark = pbmclapply(1:modelLen, getDistAll, type="clark")
print("avg")
res_avg = pbmclapply(1:modelLen, getDistAll, type="avg")
print("maximum")
res_maximum = pbmclapply(1:modelLen, getDistAll, type="maximum")
# print("Mahalanobis")
# res_Mahalanobis = pbmclapply(1:modelLen, getDistAll, type="Mahalanobis")
print("energy")
res_energy = pbmclapply(1:modelLen, getDistAll, type="energy")
print("Wasserstein")
res_Wasserstein = pbmclapply(1:modelLen, getDistAll, type="Wasserstein")
print("ksTest")
res_ksTest = pbmclapply(1:modelLen, getDistAll, type="ksTest")
print("runsTest")
res_runsTest = pbmclapply(1:modelLen, getDistAll, type="runsTest")
print("CoxStuartTest")
res_CoxStuartTest = pbmclapply(1:modelLen, getDistAll, type="CoxStuartTest")



res = list(	res_Euclidean=res_Euclidean,
				res_L1Norm=res_L1Norm,
				res_L2Norm=res_L2Norm,
				res_manhattan=res_manhattan,
				res_chebyshev=res_chebyshev,
				res_sorensen=res_sorensen,
				res_gower=res_gower,
				res_soergel=res_soergel,
				res_kulczynski_d=res_kulczynski_d,
				res_canberra=res_canberra,
				res_lorentzian=res_lorentzian,
				res_intersection=res_intersection,
				res_non_intersection=res_non_intersection,
				res_wavehedges=res_wavehedges,
				res_czekanowski=res_czekanowski,
				res_motyka=res_motyka,
				res_kulczynski_s=res_kulczynski_s,
				res_tanimoto=res_tanimoto,
				res_ruzicka=res_ruzicka,
				res_inner_product=res_inner_product,
				res_harmonic_mean=res_harmonic_mean,
				res_cosine=res_cosine,
				res_hassebrook=res_hassebrook,
				res_jaccard=res_jaccard,
				res_dice=res_dice,
				res_squared_euclidean=res_squared_euclidean,
				res_pearson=res_pearson,
				res_neyman=res_neyman,
				res_squared_chi=res_squared_chi,
				res_prob_symm=res_prob_symm,
				res_divergence=res_divergence,
				res_clark=res_clark,
				res_avg=res_avg,
				res_maximum=res_maximum,
				# res_Mahalanobis=res_Mahalanobis,
				res_energy=res_energy,
				res_Wasserstein=res_Wasserstein,
				res_ksTest=res_ksTest,
				res_runsTest=res_runsTest,
				res_CoxStuartTest=res_CoxStuartTest
			)