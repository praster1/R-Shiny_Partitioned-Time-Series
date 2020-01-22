### Augmented-Dickey-Fuller Unit Root Test
# ur.df(y, type = c("none", "drift", "trend"), lags = 1, selectlags = c("Fixed", "AIC", "BIC"))
ADFTest_None = function(i, modelDataList, lags = 1)
{
	vec = modelDataList[[i]]
	res = ur.df(vec, type="none", lags=lags, selectlags="Fixed")
	return(as.numeric(res@teststat))
}

ADFTest_Drift = function(i, modelDataList, lags = 1)
{
	vec = modelDataList[[i]]
	res = ur.df(vec, type="drift", lags=lags, selectlags="Fixed")
	return(as.numeric(res@teststat))
}

ADFTest_Trend = function(i, modelDataList, lags = 1)
{
	vec = modelDataList[[i]]
	res = ur.df(vec, type="trend", lags=lags, selectlags="Fixed")
	return(as.numeric(res@teststat))
}



### Elliott, Rothenberg & Stock Unit Root Test
# ur.ers(y, type = c("DF-GLS", "P-test"), model = c("constant", "trend"), lag.max=4)
ERSTest_DFGLS_constant = function(i, modelDataList, lag.max=4)
{
	vec = modelDataList[[i]]
	res = ur.ers(vec, type="DF-GLS", model="constant", lag.max=4)
	return(as.numeric(res@teststat))
}

ERSTest_DFGLS_trend = function(i, modelDataList, lag.max=4)
{
	vec = modelDataList[[i]]
	res = ur.ers(vec, type="DF-GLS", model="trend", lag.max=4)
	return(as.numeric(res@teststat))
}

ERSTest_PTest_constant = function(i, modelDataList, lag.max=4)
{
	vec = modelDataList[[i]]
	res = ur.ers(vec, type="P-test", model="constant", lag.max=4)
	return(as.numeric(res@teststat))
}

ERSTest_PTest_trend = function(i, modelDataList, lag.max=4)
{
	vec = modelDataList[[i]]
	res = ur.ers(vec, type="P-test", model="trend", lag.max=4)
	return(as.numeric(res@teststat))
}



### Kwiatkowski et al. Unit Root Test
# ur.kpss(y, type = c("mu", "tau"), lags = c("short", "long", "nil"), use.lag = NULL)
KPSSTest_mu = function(i, modelDataList, lags=4)
{
	vec = modelDataList[[i]]
	res = ur.kpss(vec, type ="mu", use.lag=lags)
	return(as.numeric(res@teststat))
}

KPSSTest_tau = function(i, modelDataList, lags=4)
{
	vec = modelDataList[[i]]
	res = ur.kpss(vec, type ="tau", use.lag=lags)
	return(as.numeric(res@teststat))
}



### Phillips & Perron Unit Root Test
# ur.pp(x, type = c("Z-alpha", "Z-tau"), model = c("constant", "trend"), lags = c("short", "long"), use.lag = NULL)
PPTest_ZAlpha_constant = function(i, modelDataList, lags=4)
{
	vec = modelDataList[[i]]
	res = ur.pp(vec, type="Z-alpha", model="constant", use.lag=lags)
	return(as.numeric(res@teststat))
}

PPTest_ZAlpha_trend = function(i, modelDataList, lags=4)
{
	vec = modelDataList[[i]]
	res = ur.pp(vec, type="Z-alpha", model="trend", use.lag=lags)
	return(as.numeric(res@teststat))
}

PPTest_ZTau_constant = function(i, modelDataList, lags=4)
{
	vec = modelDataList[[i]]
	res = ur.pp(vec, type="Z-tau", model="constant", use.lag=lags)
	return(as.numeric(res@teststat))
}

PPTest_ZTau_trend = function(i, modelDataList, lags=4)
{
	vec = modelDataList[[i]]
	res = ur.pp(vec, type="Z-tau", model="trend", use.lag=lags)
	return(as.numeric(res@teststat))
}



### Schmidt & Phillips Unit Root Test
# ur.sp(y, type = c("tau", "rho"), pol.deg = c(1, 2, 3, 4), signif = c(0.01, 0.05, 0.1))
SPTest_Tau = function(i, modelDataList, polDeg = 1, signif = 0.05)
{
	vec = modelDataList[[i]]
	res = ur.sp(vec, type="tau", pol.deg =polDeg, signif=signif)
	return(as.numeric(res@teststat))
}

SPTest_Rho = function(i, modelDataList, polDeg = 1, signif = 0.05)
{
	vec = modelDataList[[i]]
	res = ur.sp(vec, type="rho", pol.deg =polDeg, signif=signif)
	return(as.numeric(res@teststat))
}



### Zivot & Andrews Unit Root Test
# ur.za(y, model = c("intercept", "trend", "both"), lag=NULL)
ZATest_intercept = function(i, modelDataList, lags=1)
{
	vec = modelDataList[[i]]
	res = ur.za(vec, model="intercept", lag=lags)
	return(as.numeric(res@teststat))
}

ZATest_trend = function(i, modelDataList, lags=1)
{
	vec = modelDataList[[i]]
	res = ur.za(vec, model="trend", lag=lags)
	return(as.numeric(res@teststat))
}

ZATest_both = function(i, modelDataList, lags=1)
{
	vec = modelDataList[[i]]
	res = ur.za(vec, model="both", lag=lags)
	return(as.numeric(res@teststat))
}