require(compiler)

scaling = function(matData, byRow=FALSE)
{
	if (is.null(dim(matData))) {
		matData = as.numeric(scale(matData))
	} else {
		if (byRow) {
			matData = apply(matData, 1, scale)
			matData = apply(matData, 1, as.numeric)
		} else {
			matData = apply(matData, 2, scale)
			matData = apply(matData, 2, as.numeric)
		}
		
	}
	
	return(matData)
}

scaling = cmpfun(scaling)