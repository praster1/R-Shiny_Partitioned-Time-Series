pal <- colorRampPalette(c(rgb(0.96,0.96,1), rgb(0.1,0.1,0.9)), space = "rgb")
output$bayesFactorMatrixPlot = renderPlot(	heatmap.2(tempNet, 	Rowv=FALSE, Colv=FALSE, 
															dendrogram="none", main="Bayes Factor Matrix",
															xlab="Columns", ylab="Rows", col=pal, tracecol="#303030", trace="none", cellnote=tempNet,
															notecol="black", notecex=1.5, keysize = 0, margins=c(5, 5), key=FALSE
															labRow = selectedModels, labCol = selectedModels))