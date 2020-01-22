# require(MASS)
### Euclidean
euclidean_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "euclidean"))
	return(res)
}
euclidean_between_testVec_and_modelDataList = cmpfun(euclidean_between_testVec_and_modelDataList)


### L1 norm
L1Norm_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "minkowski", p=1))
	return(res)
}
L1Norm_between_testVec_and_modelDataList = cmpfun(L1Norm_between_testVec_and_modelDataList)


### L2 norm
L2Norm_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "minkowski", p=2))
	return(res)
}
L2Norm_between_testVec_and_modelDataList = cmpfun(L2Norm_between_testVec_and_modelDataList)


### manhattan
manhattan_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "manhattan"))
	return(res)
}
manhattan_between_testVec_and_modelDataList = cmpfun(manhattan_between_testVec_and_modelDataList)


### chebyshev
chebyshev_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "chebyshev"))
	return(res)
}
chebyshev_between_testVec_and_modelDataList = cmpfun(chebyshev_between_testVec_and_modelDataList)


### sorensen
sorensen_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "sorensen"))
	return(res)
}
sorensen_between_testVec_and_modelDataList = cmpfun(sorensen_between_testVec_and_modelDataList)


### gower
gower_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "gower"))
	return(res)
}
gower_between_testVec_and_modelDataList = cmpfun(gower_between_testVec_and_modelDataList)


### soergel
soergel_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "soergel"))
	return(res)
}
soergel_between_testVec_and_modelDataList = cmpfun(soergel_between_testVec_and_modelDataList)


### kulczynski_d
kulczynski_d_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "kulczynski_d"))
	return(res)
}
kulczynski_d_between_testVec_and_modelDataList = cmpfun(kulczynski_d_between_testVec_and_modelDataList)


### canberra
canberra_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "canberra"))
	return(res)
}
canberra_between_testVec_and_modelDataList = cmpfun(canberra_between_testVec_and_modelDataList)


### lorentzian
lorentzian_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "lorentzian"))
	return(res)
}
lorentzian_between_testVec_and_modelDataList = cmpfun(lorentzian_between_testVec_and_modelDataList)


### intersection
intersection_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "intersection"))
	return(res)
}
intersection_between_testVec_and_modelDataList = cmpfun(intersection_between_testVec_and_modelDataList)


### non-intersection
non_intersection_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "non-intersection"))
	return(res)
}
non_intersection_between_testVec_and_modelDataList = cmpfun(non_intersection_between_testVec_and_modelDataList)


### wavehedges
wavehedges_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "wavehedges"))
	return(res)
}
wavehedges_between_testVec_and_modelDataList = cmpfun(wavehedges_between_testVec_and_modelDataList)


### czekanowski
czekanowski_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "czekanowski"))
	return(res)
}
czekanowski_between_testVec_and_modelDataList = cmpfun(czekanowski_between_testVec_and_modelDataList)


### motyka
motyka_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "motyka"))
	return(res)
}
motyka_between_testVec_and_modelDataList = cmpfun(motyka_between_testVec_and_modelDataList)


### kulczynski_s
kulczynski_s_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "kulczynski_s"))
	return(res)
}
kulczynski_s_between_testVec_and_modelDataList = cmpfun(kulczynski_s_between_testVec_and_modelDataList)


### tanimoto
tanimoto_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "tanimoto"))
	return(res)
}
tanimoto_between_testVec_and_modelDataList = cmpfun(tanimoto_between_testVec_and_modelDataList)


### ruzicka
ruzicka_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "ruzicka"))
	return(res)
}
ruzicka_between_testVec_and_modelDataList = cmpfun(ruzicka_between_testVec_and_modelDataList)


### inner_product
inner_product_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "inner_product"))
	return(res)
}
inner_product_between_testVec_and_modelDataList = cmpfun(inner_product_between_testVec_and_modelDataList)


### harmonic_mean
harmonic_mean_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "harmonic_mean"))
	return(res)
}
harmonic_mean_between_testVec_and_modelDataList = cmpfun(harmonic_mean_between_testVec_and_modelDataList)


### cosine
cosine_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "cosine"))
	return(res)
}
cosine_between_testVec_and_modelDataList = cmpfun(cosine_between_testVec_and_modelDataList)


### hassebrook
hassebrook_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "hassebrook"))
	return(res)
}
hassebrook_between_testVec_and_modelDataList = cmpfun(hassebrook_between_testVec_and_modelDataList)


### jaccard
jaccard_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "jaccard"))
	return(res)
}
jaccard_between_testVec_and_modelDataList = cmpfun(jaccard_between_testVec_and_modelDataList)


### dice
dice_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "dice"))
	return(res)
}
dice_between_testVec_and_modelDataList = cmpfun(dice_between_testVec_and_modelDataList)


### fidelity
fidelity_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "fidelity"))
	return(res)
}
fidelity_between_testVec_and_modelDataList = cmpfun(fidelity_between_testVec_and_modelDataList)


### bhattacharyya
bhattacharyya_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "bhattacharyya"))
	return(res)
}
bhattacharyya_between_testVec_and_modelDataList = cmpfun(bhattacharyya_between_testVec_and_modelDataList)


### hellinger
hellinger_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "hellinger"))
	return(res)
}
hellinger_between_testVec_and_modelDataList = cmpfun(hellinger_between_testVec_and_modelDataList)


### matusita
matusita_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "matusita"))
	return(res)
}
matusita_between_testVec_and_modelDataList = cmpfun(matusita_between_testVec_and_modelDataList)


### squared_chord
squared_chord_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "squared_chord"))
	return(res)
}
squared_chord_between_testVec_and_modelDataList = cmpfun(squared_chord_between_testVec_and_modelDataList)


### squared_euclidean
squared_euclidean_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "squared_euclidean"))
	return(res)
}
squared_euclidean_between_testVec_and_modelDataList = cmpfun(squared_euclidean_between_testVec_and_modelDataList)


### pearson
pearson_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "pearson"))
	return(res)
}
pearson_between_testVec_and_modelDataList = cmpfun(pearson_between_testVec_and_modelDataList)


### neyman
neyman_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "neyman"))
	return(res)
}
neyman_between_testVec_and_modelDataList = cmpfun(neyman_between_testVec_and_modelDataList)


### squared_chi
squared_chi_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "squared_chi"))
	return(res)
}
squared_chi_between_testVec_and_modelDataList = cmpfun(squared_chi_between_testVec_and_modelDataList)


### prob_symm
prob_symm_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "prob_symm"))
	return(res)
}
prob_symm_between_testVec_and_modelDataList = cmpfun(prob_symm_between_testVec_and_modelDataList)


### divergence
divergence_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "divergence"))
	return(res)
}
divergence_between_testVec_and_modelDataList = cmpfun(divergence_between_testVec_and_modelDataList)


### clark
clark_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "clark"))
	return(res)
}
clark_between_testVec_and_modelDataList = cmpfun(clark_between_testVec_and_modelDataList)


### additive_symm
additive_symm_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "additive_symm"))
	return(res)
}
additive_symm_between_testVec_and_modelDataList = cmpfun(additive_symm_between_testVec_and_modelDataList)


### kullback_leibler
kullback_leibler_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "kullback-leibler"))
	return(res)
}
kullback_leibler_between_testVec_and_modelDataList = cmpfun(kullback_leibler_between_testVec_and_modelDataList)


### jeffreys
jeffreys_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "jeffreys"))
	return(res)
}
jeffreys_between_testVec_and_modelDataList = cmpfun(jeffreys_between_testVec_and_modelDataList)


### k_divergence
k_divergence_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "k_divergence"))
	return(res)
}
k_divergence_between_testVec_and_modelDataList = cmpfun(k_divergence_between_testVec_and_modelDataList)


### topsoe
topsoe_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "topsoe"))
	return(res)
}
topsoe_between_testVec_and_modelDataList = cmpfun(topsoe_between_testVec_and_modelDataList)


### jensen_shannon
jensen_shannon_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "jensen-shannon"))
	return(res)
}
jensen_shannon_between_testVec_and_modelDataList = cmpfun(jensen_shannon_between_testVec_and_modelDataList)


### jensen_difference
jensen_difference_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "jensen_difference"))
	return(res)
}
jensen_difference_between_testVec_and_modelDataList = cmpfun(jensen_difference_between_testVec_and_modelDataList)


### taneja
taneja_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "taneja"))
	return(res)
}
taneja_between_testVec_and_modelDataList = cmpfun(taneja_between_testVec_and_modelDataList)


### kumar_johnson
kumar_johnson_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "kumar-johnson"))
	return(res)
}
kumar_johnson_between_testVec_and_modelDataList = cmpfun(kumar_johnson_between_testVec_and_modelDataList)


### avg
avg_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(distance(rbind(tempTestVec, tempModelData), method = "avg"))
	return(res)
}
avg_between_testVec_and_modelDataList = cmpfun(avg_between_testVec_and_modelDataList)


### binary
binary_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(dist(rbind(tempTestVec, tempModelData), method = "binary"))
	return(res)
}
binary_between_testVec_and_modelDataList = cmpfun(binary_between_testVec_and_modelDataList)


### maximum
maximum_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = as.numeric(dist(rbind(tempTestVec, tempModelData), method = "maximum"))
	return(res)
}
maximum_between_testVec_and_modelDataList = cmpfun(maximum_between_testVec_and_modelDataList)


### Mahalanobis
Mahalanobis_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	require(StatMatch)
	res = mean(diag(mahalanobis.dist(tempTestVec, tempModelData)))
	return(res)
}
Mahalanobis_between_testVec_and_modelDataList = cmpfun(Mahalanobis_between_testVec_and_modelDataList)


### distance correlation (energy distance)
distCorr_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	require(energy)
	res = as.numeric(dcov(dist(tempTestVec), dist(tempModelData)))
	return(res)
}
distCorr_between_testVec_and_modelDataList = cmpfun(distCorr_between_testVec_and_modelDataList)


### Wasserstein
Wasserstein_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	require(transport)	
	res = wasserstein1d(tempTestVec, tempModelData)
	return(res)
}
Wasserstein_between_testVec_and_modelDataList = cmpfun(Wasserstein_between_testVec_and_modelDataList)


### Kolmogorov-Smirnov Test
ksTest_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{	
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	res = ks.test(tempTestVec, tempModelData)$p.value
	return(res)
}
ksTest_between_testVec_and_modelDataList = cmpfun(ksTest_between_testVec_and_modelDataList)


### Two samples Runs Test
runsTest_between_testVec_and_modelDataList = function(i, testVec, modelDataList, scale=FALSE)
{
	tempTestVec = testVec;		tempModelData = modelDataList[[i]]
	if (scale)	{	tempTestVec = scaling(tempTestVec);		tempModelData = scaling(tempModelData)	}
	require(DescTools)
	res = RunsTest(tempTestVec, tempModelData)$p.value
	return(res)
}
runsTest_between_testVec_and_modelDataList = cmpfun(runsTest_between_testVec_and_modelDataList)


