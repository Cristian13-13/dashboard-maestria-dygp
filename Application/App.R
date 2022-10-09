#token='A20E46EB3C35EB4D8A9F21AA7E899AAC'
#Archivos de UI
source("ui.R")
source("server.R")

# Ejecutable de aplicación
shinyApp(ui = get_main_ui, server = main_server)