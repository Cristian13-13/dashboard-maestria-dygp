#Archivos de UI
source("ui.R")
source("server.R")

# Ejecutable de aplicación
shinyApp(ui = get_main_ui, server = main_server)