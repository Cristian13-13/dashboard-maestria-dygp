# Datos para dashboard
data_cargada <- data.frame(read.xlsx("datos/registros.xlsx", sheetIndex = 1))

#Información del data table
data_table_info <- data_cargada%>%
  transmute(
    "Codigo" = codigo,
    "Proyecto" = proyecto,
    "Fecha de recepcion" = fecha_de_recepcion,
    "Estado actual" = estado_actual,
    "Retraso" = fecha_maxima_entrega > Sys.Date()
    )
