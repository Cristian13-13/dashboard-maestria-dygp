get_ui_monitor_of_productivity_by_user <- function(){
  tabItem(
    tabName = 'monitor_estado_actual',
    tabPanel("Estado actual",
             h2(strong("Estado actual")),
             basicPage(
               box(width = 12,
                   collapsible = TRUE,
                   valueBoxOutput("render_info_box_num_tasks"),
                   valueBoxOutput("render_info_box_productivity_points"),
                   valueBoxOutput("render_info_box_mean_points"),
                   valueBoxOutput("render_info_box_late_tasks"),
                   valueBoxOutput("render_info_box_num_of_projects"),
                   valueBoxOutput("render_info_box_num_of_todo")
                 ),
               
               box(width = 6,
                   collapsible = TRUE,
                   plotOutput("render_productivity_plot")
               ),
               
               box(width = 6,
                   collapsible = TRUE,
                   plotOutput("render_task_by_status_plot")
                   ),
               
              box(width = 12,
                  collapsible = TRUE,
                  dataTableOutput("render_task_table")
                  )
             )
    )
    
  )
}


#garificar puntos por proyecto

get_render_points_by_project <- function(){
    renderPlot({
      print(
        data_cargada%>%
          ggplot(aes(x = fecha_de_recepcion, y = puntos, group = proyecto, colour = proyecto))+
          geom_line()+
          geom_point()+
          scale_x_date(date_breaks = "3 day")+
          geom_label(aes(label=codigo))+
          labs( y= "PUNTOS DE TAREA", x = "Fecha de finalización de tarea",
                title = "TABLERO DE CONTROL",
                subtitle = "Puntos por historia",
                caption = "Diseñado y realizado por: Equipo de trabajo")
      )
    })
  
}

get_render_task_by_status <- function(){
  renderPlot({
    print(
      data_cargada%>%
        ggplot(aes(x = estado_actual, colour = estado_actual, fill = estado_actual))+
        geom_bar()+
        scale_y_continuous(breaks = waiver())+
        labs( y= "Cantidad", x = "Estado",
              title = "TABLERO DE CONTROL",
              subtitle = "Tareas por estado",
              caption = "Diseñado y realizado por: Equipo de trabajo")
    )
  })
  
}


# Número de tareas en total
get_render_info_box_num_tasks <- function(){
  return(
    renderValueBox({
      valueBox(
        width = 3,
        value = count(data_cargada)$n,
        subtitle = "Numero de tareas",
        icon = icon(name = "cat", lib = "font-awesome"),
        color = "light-blue"
      )
    })
  )
}

# Total de puntos
get_render_info_box_productivity_points <- function(){
  
  return(
    renderValueBox({
      valueBox(
        width = 3,
        value = sum(data_cargada$puntos),
        subtitle = "Total puntos.",
        icon = icon(name = "dog", lib = "font-awesome"),
        color = "blue"
      )
    })
  )
}


# Promedio de puntos por tarea

get_render_info_box_mean_points <- function(){
  
  return(
    renderValueBox({
      valueBox(
        width = 3,
        value = round(mean(data_cargada$puntos),2),
        subtitle = "Promedio de puntos.",
        icon = icon(name = "wifi", lib = "font-awesome"),
        color = 'aqua'
      )
    })
  )
}



# Numero de tareas retrasadas
get_render_info_box_late_tasks <- function(){
  
  return(
    renderValueBox({
      valueBox(
        width = 3,
        value = length(which(data_table_info$Retraso == TRUE)),
        subtitle = "Tareas con retraso",
        icon = icon(name = "wifi", lib = "font-awesome"),
        color = 'aqua'
      )
    })
  )
}



#Numero de proyectos
get_render_info_box_num_of_projects <- function(){
  return(
    renderValueBox({
      valueBox(
        width = 3,
        value = length(unique(data_cargada$proyecto)),
        subtitle = "Proyectos",
        icon = icon(name = "wifi", lib = "font-awesome"),
        color = "blue"
      )
    })
  )
}

# Tareas pendientes

get_render_info_box_num_of_todo <- function(){
  return(
    renderValueBox({
      valueBox(
        width = 3,
        value = length(which(data_cargada$estado_actual == "Pendiente")),
        subtitle = "Tareas pendientes",
        icon = icon(name = "wifi", lib = "font-awesome"),
        color = "light-blue"
      )
    })
  )
}


# Data table de tareas
get_render_task_table <-  function(){
  return(
    renderDT(
      data_table_info,
      filter = 'top',
      options = list(pageLength = 20, processing = TRUE, position = 'top')
    )
  )
}