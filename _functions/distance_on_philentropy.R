DistMatrix <- function(dists, func, testNA, unit)
{  
	FUN <- match.fun(func);	n_cols = ncol(dists);	dist_value = vector("numeric", 1)
	
	func_first = function(i)	{	return(unlist(lapply(seq_len(n_cols), func_second, i)))	}
	func_second = function(j, i) 	{	return(FUN(dists[ , i], dists[ , j], testNA, unit))	}
	
	res = list_to_matrix(lapply(seq_len(n_cols), func_first), colNum=n_cols)
	return(res)
}


DistMatrixNoUnit = function(dists, func, testNA)
{
	FUN = match.fun(func);	n_cols = ncol(dists);	dist_value = vector("numeric", 1)	
	
	func_first = function(i)	{	return(unlist(lapply(seq_len(n_cols), func_second, i)))	}
	func_second = function(j, i) 	{		return(FUN(dists[ , i], dists[ , j], testNA))	}
	
	res = list_to_matrix(lapply(seq_len(n_cols), func_first), colNum=n_cols)
	return(res)
}
	


DistMatrixMinkowski <- function(dists, p, testNA)
{ 
	n_cols = ncol(dists);	dist_value = vector("numeric", 1);	dist_matrix <- matrix(NA_real_, n_cols,n_cols)

	func_first = function(i)	{	return(unlist(lapply(seq_len(n_cols), func_second, i)))	}
	func_second = function(j, i) 	{	return(minkowski(dists[ , i], dists[ , j], p, testNA))	}
	
	res = list_to_matrix(lapply(seq_len(n_cols), func_first), colNum=n_cols)
	return(res)
}



distance = function (x, method = "euclidean", p = NULL, test.na = TRUE, unit = "log", est.prob = NULL) 
{
    if (!is.element(class(x), c("data.frame", "matrix"))) 
        stop("x should be a data.frame or matrix.")
    if (is.character(x)) 
        stop(paste0("Your input ", class(x), " stores non-numeric values. Non numeric values cannot be used to compute distances.."))
    dist_methods <- vector(mode = "character", length = 46)
    dist_methods <- c("euclidean", "manhattan", "minkowski", "chebyshev", "sorensen", "gower", "soergel", "kulczynski_d", "canberra", "lorentzian", "intersection", "non-intersection", 
        "wavehedges", "czekanowski", "motyka", "kulczynski_s", "tanimoto", "ruzicka", "inner_product", "harmonic_mean", "cosine", "hassebrook", "jaccard", "dice", "fidelity", 
        "bhattacharyya", "hellinger", "matusita", "squared_chord", "squared_euclidean", "pearson", "neyman", "squared_chi", "prob_symm", "divergence", "clark", "additive_symm", 
        "kullback-leibler", "jeffreys", "k_divergence", "topsoe", "jensen-shannon", "jensen_difference", "taneja", "kumar-johnson", "avg")
    x <- t(x)
    ncols <- vector("numeric", 1)
    ncols <- ncol(x)
    if (!is.element(method, dist_methods)) 
        stop("Method '", method, "' is not implemented in this function. Please consult getDistMethods().", 
            call. = FALSE)
    if (!is.null(est.prob)) {
        x <- apply(x, 2, estimate.probability, method = est.prob)
    }
    if (!is.element(unit, c("log", "log2", "log10"))) 
        stop("You can only choose units: log, log2, or log10.", 
            call. = FALSE)
    if (ncols == 2) {
        dist <- vector("numeric", 1)
    }
    else {
        dist <- matrix(NA_real_, ncols, ncols)
    }
    if (method == "euclidean") {
        if (ncols == 2) 
            dist <- euclidean(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, euclidean, test.na)
    }
    else if (method == "manhattan") {
        if (ncols == 2) 
            dist <- manhattan(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, manhattan, test.na)
    }
    else if (method == "minkowski") {
        if (!is.null(p)) {
            if (ncols == 2) 
                dist <- minkowski(x[, 1], x[, 2], as.double(p), test.na)
            if (ncols > 2) 
                dist <- DistMatrixMinkowski(x, as.double(p), test.na)
        }
        else {
            stop("Please specify p for the Minkowski distance.", call. = FALSE)
        }
    }
    else if (method == "chebyshev") {
        if (ncols == 2) 
            dist <- chebyshev(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, chebyshev, test.na)
    }
    else if (method == "sorensen") {
        if (ncols == 2) 
            dist <- sorensen(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, sorensen, test.na)
    }
    else if (method == "gower") {
        if (ncols == 2) 
            dist <- gower(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, gower, test.na)
    }
    else if (method == "soergel") {
        if (ncols == 2) 
            dist <- soergel(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, soergel, test.na)
    }
    else if (method == "kulczynski_d") {
        if (ncols == 2) 
            dist <- kulczynski_d(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, kulczynski_d, test.na)
    }
    else if (method == "canberra") {
        if (ncols == 2) 
            dist <- canberra(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, canberra, test.na)
    }
    else if (method == "lorentzian") {
        if (ncols == 2) 
            dist <- lorentzian(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, lorentzian, test.na, unit)
    }
    else if (method == "intersection") {
        if (ncols == 2) 
            dist <- intersection_dist(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, intersection_dist, test.na)
    }
    else if (method == "non-intersection") {
        if (ncols == 2) 
            dist <- 1 - intersection_dist(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- 1 - DistMatrixNoUnit(x, intersection_dist, 
                test.na)
    }
    else if (method == "wavehedges") {
        if (ncols == 2) 
            dist <- wave_hedges(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, wave_hedges, test.na)
    }
    else if (method == "czekanowski") {
        if (ncols == 2) 
            dist <- czekanowski(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, czekanowski, test.na)
    }
    else if (method == "motyka") {
        if (ncols == 2) 
            dist <- motyka(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, motyka, test.na)
    }
    else if (method == "kulczynski_s") {
        if (ncols == 2) 
            dist <- 1/kulczynski_d(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- 1/DistMatrixNoUnit(x, kulczynski_d, test.na)
    }
    else if (method == "tanimoto") {
        if (ncols == 2) 
            dist <- tanimoto(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, tanimoto, test.na)
    }
    else if (method == "ruzicka") {
        if (ncols == 2) 
            dist <- ruzicka(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, ruzicka, test.na)
    }
    else if (method == "inner_product") {
        if (ncols == 2) 
            dist <- inner_product(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, inner_product, test.na)
    }
    else if (method == "harmonic_mean") {
        if (ncols == 2) 
            dist <- harmonic_mean_dist(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, harmonic_mean_dist, test.na)
    }
    else if (method == "cosine") {
        if (ncols == 2) 
            dist <- cosine_dist(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, cosine_dist, test.na)
    }
    else if (method == "hassebrook") {
        if (ncols == 2) 
            dist <- kumar_hassebrook(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, kumar_hassebrook, test.na)
    }
    else if (method == "jaccard") {
        if (ncols == 2) 
            dist <- jaccard(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, jaccard, test.na)
    }
    else if (method == "dice") {
        if (ncols == 2) 
            dist <- dice_dist(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, dice_dist, test.na)
    }
    else if (method == "fidelity") {
        if (ncols == 2) 
            dist <- fidelity(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, fidelity, test.na)
    }
    else if (method == "bhattacharyya") {
        if (ncols == 2) 
            dist <- bhattacharyya(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, bhattacharyya, test.na, unit)
    }
    else if (method == "hellinger") {
        if (ncols == 2) 
            dist <- hellinger(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, hellinger, test.na)
    }
    else if (method == "matusita") {
        if (any(colSums(x) > 1.00001)) 
            stop("Please make sure that all vectors sum up to 1.0 ...", call. = FALSE)
        if (ncols == 2) 
            dist <- matusita(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, matusita, test.na)
    }
    else if (method == "squared_chord") {
        if (ncols == 2) 
            dist <- squared_chord(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, squared_chord, test.na)
    }
    else if (method == "squared_euclidean") {
        if (ncols == 2) 
            dist <- squared_euclidean(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, squared_euclidean, test.na)
    }
    else if (method == "pearson") {
        if (ncols == 2) 
            dist <- pearson_chi_sq(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, pearson_chi_sq, test.na)
    }
    else if (method == "neyman") {
        if (ncols == 2) 
            dist <- neyman_chi_sq(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, neyman_chi_sq, test.na)
    }
    else if (method == "squared_chi") {
        if (ncols == 2) 
            dist <- squared_chi_sq(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, squared_chi_sq, test.na)
    }
    else if (method == "prob_symm") {
        if (ncols == 2) 
            dist <- prob_symm_chi_sq(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, prob_symm_chi_sq, test.na)
    }
    else if (method == "divergence") {
        if (ncols == 2) 
            dist <- divergence_sq(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, divergence_sq, test.na)
    }
    else if (method == "clark") {
        if (ncols == 2) 
            dist <- clark_sq(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, clark_sq, test.na)
    }
    else if (method == "additive_symm") {
        if (ncols == 2) 
            dist <- additive_symm_chi_sq(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, additive_symm_chi_sq, test.na)
    }
    else if (method == "kullback-leibler") {
        if (any(colSums(x) > 1.00001)) 
            stop("Please make sure that all vectors sum up to 1.0 ...", call. = FALSE)
        if (ncols == 2) 
            dist <- kullback_leibler_distance(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, kullback_leibler_distance, test.na, unit)
    }
    else if (method == "jeffreys") {
        if (ncols == 2) 
            dist <- jeffreys(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, jeffreys, test.na, unit)
    }
    else if (method == "k_divergence") {
        if (any(colSums(x) > 1.00001)) 
            stop("Please make sure that all vectors sum up to 1.0 ...", 
                call. = FALSE)
        if (ncols == 2) 
            dist <- k_divergence(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, k_divergence, test.na, unit)
    }
    else if (method == "topsoe") {
        if (ncols == 2) 
            dist <- topsoe(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, topsoe, test.na, unit)
    }
    else if (method == "jensen-shannon") {
        if (ncols == 2) 
            dist <- jensen_shannon(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, jensen_shannon, test.na, unit)
    }
    else if (method == "jensen_difference") {
        if (ncols == 2) 
            dist <- jensen_difference(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, jensen_difference, test.na, unit)
    }
    else if (method == "taneja") {
        if (ncols == 2) 
            dist <- taneja(x[, 1], x[, 2], test.na, unit)
        if (ncols > 2) 
            dist <- DistMatrix(x, taneja, test.na, unit)
    }
    else if (method == "kumar-johnson") {
        if (ncols == 2) 
            dist <- kumar_johnson(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, kumar_johnson, test.na)
    }
    else if (method == "avg") {
        if (ncols == 2) 
            dist <- avg(x[, 1], x[, 2], test.na)
        if (ncols > 2) 
            dist <- DistMatrixNoUnit(x, avg, test.na)
    }
	
    if (ncols == 2) {
        names(dist) <- method
    } else {
        colnames(dist) <- paste0("v", seq_len(ncols))
        rownames(dist) <- paste0("v", seq_len(ncols))
    }
    return(dist)
}