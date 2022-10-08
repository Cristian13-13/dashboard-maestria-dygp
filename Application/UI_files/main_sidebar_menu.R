# Componentes del menú

get_side_bar_options <- function(){
  return(
    sidebarMenu(
      menuItem("Estado actual", tabName = "monitor_estado_actual", icon = icon(name = "wallet", lib = "font-awesome"))
    )
  )
}


# Dashboard body
get_dashboard_body <- function(){
  return(
    dashboardBody(
      tabItems(
        # Body módulo de monitor de tareas por estados
        get_ui_monitor_of_productivity_by_user()
      )
    )
  )
}