rm(list = ls())

setwd("~/NAS/Research/KEPCO")



########## Load Library and Functions
# devtools::install_github("praster1/JSFunction", force=TRUE)
source("load_libraries.R", local=TRUE)
source("load_functions.R", local=TRUE)

numCores = detectCores()


dir_functions = "./ShinyApp_functions/"
dir_functions_dataLoad = "./ShinyApp_functions_dataLoad/"
dir_sources = "./ShinyApp_sources/"
dir_body = "./ShinyApp_Body/"
dir_server = "./ShinyApp_Servers/"



########## Load Sources
source(paste0(dir_sources, "selectors.R"), local=TRUE)



########## ShinyApp
header = dashboardHeader(title = "Cold Start Problem")	### Dashboard Header
source(paste0(dir_body, "dashboardSidebar.R"), local=TRUE)
source(paste0(dir_body, "dashboardBody.R"), local=TRUE)
ui = dashboardPage( header, sidebar, body, skin = "red" )	### UI


### Server
source(paste0(dir_server, "server.R"), local=TRUE)
modelLen = obsData = modelData = partialData = selectedModelData = selectedModelSelectorIDX = inputObsData = inputModelData = inputPartialData = modelSelector = resParams = NULL
resultSetDir = datasetDir = partialDatasetDir = paramsDir = modelLen = NULL
selectedModels = C = whichIDX = lenWhichIDX = NULL


options(shiny.reactlog=FALSE)
options(shiny.fullstacktrace = FALSE)
options(shiny.trace = FALSE)
shinyApp(ui, server)
