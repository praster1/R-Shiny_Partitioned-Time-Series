require(compiler)


synthetic_AR1_multi_with_structuralBreaks = function(	initVal,	mu1, mu2, mu3, mu4, mu_runif=FALSE,
																							sigma1, sigma2, sigma3, sigma4,
																							alpha1, alpha2, alpha3, alpha4,
																							dataLen, plot = TRUE, modelName = "Model-NS")
{
	chars = toupper(big_letters(999))
	
	breakPointNum = 4
	breakPoints = NULL
	for (i in 1:(breakPointNum-1))
	{
		breakPoints = c(breakPoints, ceiling(dataLen * i/breakPointNum)+1)
	}
	# print(breakPoints)

	params = NULL
	resModel = NULL
	
	len = length(mu1) * length(mu2) * length(mu3) * length(mu4) * length(sigma1) * length(sigma2) * length(sigma3) * length(sigma4) * length(alpha1) * length(alpha2) * length(alpha3) * length(alpha4)
	
	modelCounter = 1
	for (i in mu1)
	{
		for (j in sigma1)
		{
			for (k in alpha1)
			{
				for (ii in mu2)
				{
					for (jj in sigma2)
					{
						for (kk in alpha2)
						{
							for (iii in mu3)
							{
								for (jjj in sigma3)
								{
									for (kkk in alpha3)
									{
										for (iiii in mu4)
										{
											for (jjjj in sigma4)
											{
												for (kkkk in alpha4)
												{
													if (mu_runif) {
														resVec1 = synthetic_AR1(initVal = initVal, coef=k, mean = i, sd = sqrt(j), length = breakPoints[1])
														resVec2 = synthetic_AR1(initVal = resVec1[length(resVec1)], coef=kk, mean = ii, sd = sqrt(jj), length = breakPoints[2] - breakPoints[1])
														resVec3 = synthetic_AR1(initVal = resVec2[length(resVec2)], coef=kkk, mean = iii, sd = sqrt(jjj), length = breakPoints[3] - breakPoints[2])
														resVec4 = synthetic_AR1(initVal = resVec3[length(resVec3)], coef=kkkk, mean = iiii, sd = sqrt(jjjj), length = dataLen - breakPoints[3])
														resModel[[modelCounter]] = c(resVec1, resVec2, resVec3, resVec4)
													} else {
														if (mu1 <= 0) 	{	resVec1 = synthetic_AR1(initVal = initVal, coef=k, mean = runif(1, i, 0), sd = sqrt(j), length = breakPoints[1]) }
														else 				{ 	resVec1 = synthetic_AR1(initVal = initVal, coef=k, mean = runif(1, 0, i), sd = sqrt(j), length = breakPoints[1]) }
														
														if (mu2 <= 0) 	{ resVec2 = synthetic_AR1(initVal = resVec1[length(resVec1)], coef=kk, mean = runif(1, ii, 0), sd = sqrt(jj), length = breakPoints[2] - breakPoints[1]) }
														else 				{ resVec2 = synthetic_AR1(initVal = resVec1[length(resVec1)], coef=kk, mean = runif(1, 0, ii), sd = sqrt(jj), length = breakPoints[2] - breakPoints[1]) }
														
														if (mu3 <= 0) 	{ resVec3 = synthetic_AR1(initVal = resVec2[length(resVec2)], coef=kkk, mean = runif(1, iii, 0), sd = sqrt(jjj), length = breakPoints[3] - breakPoints[2]) }
														else 				{ resVec3 = synthetic_AR1(initVal = resVec2[length(resVec2)], coef=kkk, mean = runif(1, 0, iii), sd = sqrt(jjj), length = breakPoints[3] - breakPoints[2]) }
														
														if (mu4 <= 0) 	{ resVec4 = synthetic_AR1(initVal = resVec3[length(resVec3)], coef=kkkk, mean = runif(1, iiii, 0), sd = sqrt(jjjj), length = dataLen - breakPoints[3]) }
														else 				{ resVec4 = synthetic_AR1(initVal = resVec3[length(resVec3)], coef=kkkk, mean = runif(1, 0, iiii), sd = sqrt(jjjj), length = dataLen - breakPoints[3]) }

					
														resModel[[modelCounter]] = c(resVec1, resVec2, resVec3, resVec4)
													}
				
													params[[modelCounter]] = paste("mu1 = ", i, " / sigma1 = ", j, " / alpha1 = ", k,  " / mu2 = ", ii, " / sigma2 = ", jj, " / alpha2 = ", kk,
																										" / mu3 = ", iii, " / sigma3 = ", jjj, " / alpha3 = ", kkk,  " / mu4 = ", iiii, " / sigma4 = ", jjjj, " / alpha4 = ", kkkk, sep="")
													print(paste(modelCounter, "/", len, sep=""))
													
													if (plot)
													{
														plot(resModel[[modelCounter]], type="l", main=paste(modelName, "-",chars[modelCounter], " / mu1 = ", i, " / sigma1 = ", j, " / alpha1 = ", k, 
																																																   " / mu2 = ", ii, " / sigma2 = ", jj, " / alpha2 = ", kk,
																																																   " / mu3 = ", iii, " / sigma3 = ", jjj, " / alpha3 = ", kkk,
																																																   " / mu4 = ", iiii, " / sigma4 = ", jjjj, " / alpha4 = ", kkkk,
																																																	sep=""), ylab="y_t", xlab="t", cex.lab=1.5, cex.axis=1.5, cex.main=1.2, cex.sub=1.5)
																																																	
													}
													
													modelCounter = modelCounter + 1
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	res = list(resData = resModel, params = params)
	return(res)
}



synthetic_AR1_multi_with_structuralBreaks = cmpfun(synthetic_AR1_multi_with_structuralBreaks)