#Librerias
library(shiny)
library(DT)
library(tidyverse)
library(xlsx)
library(readxl)
library(shinydashboard)

# Conexión a los archivos externos
source("UI_files/main_sidebar_menu.R")
source("Modulos/monitor_estado_actual.R")
source("datos/data_loading.R")


# Ui principal
get_main_ui <-function(){
  
  return(
    dashboardPage(
      skin = "black",
      dashboardHeader(title = "Dashboard"),
      dashboardSidebar(get_side_bar_options()),
      get_dashboard_body()
    ) 
  )
}