seqDateVec = function(year)
{
	seqDate = NULL
	if (is_leap_year(year))	{
		seqDate = seqDatetime(paste(year, "-01-01", sep=""), byMin=15, length=4*24*366)
	} else {
		seqDate = seqDatetime(paste(year, "-01-01", sep=""), byMin=15, length=4*24*365)
	}

	return(seqDate)
}
