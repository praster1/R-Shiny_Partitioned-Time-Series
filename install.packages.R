# sudo apt-get install libgit2-dev libcurl4-openssl-dev libxml2-dev libssl-dev

install.packages("devtools")

##### Multicore process
install.packages("parallel")
# install.packages("parallelsugar")
install.packages("pbapply")
install.packages("pbmcapply")


##### Fast process
install.packages("compiler")


##### Data Handling
install.packages("feather")
install.packages("data.table")
install.packages("dplyr")
install.packages("DT")		# datatable


##### Shiny
install.packages("shiny")
install.packages("shinyWidgets")
install.packages("shinydashboard")
# install.packages("dashboardthemes")
install.packages("shinyBS")
install.packages("shinyjs")
install.packages("shinyalert")
install.packages("markdown")


##### Graphs
install.packages("RColorBrewer")
install.packages("dygraphs")
install.packages("gplots")
install.packages("ggplot2")
install.packages("plotly")
install.packages("networkD3")


#####
# install.packages("S4Vectors")
install.packages("prob")
install.packages("BNDataGenerator")
install.packages("StatMatch")
install.packages("energy")
install.packages("distances")
install.packages("philentropy")
install.packages("transport")	
install.packages("DescTools")
install.packages("snpar")
install.packages("urca")


require(devtools)
install_github("praster1/JSFunction", force=TRUE)
install_github('nathanvan/parallelsugar')
install_github("nik01010/dashboardthemes")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("S4Vectors")
