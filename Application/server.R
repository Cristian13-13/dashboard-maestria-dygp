#Server de la aplicación

main_server <- function(input, output, session) {
  
  output$render_productivity_plot <- get_render_points_by_project()
  output$render_task_by_status_plot <- get_render_task_by_status()
  output$render_task_table <- get_render_task_table()
  
  # Cajas de información 
  output$render_info_box_num_tasks <- get_render_info_box_num_tasks()
  output$render_info_box_productivity_points <- get_render_info_box_productivity_points()
  output$render_info_box_mean_points <- get_render_info_box_mean_points()
  output$render_info_box_late_tasks <- get_render_info_box_late_tasks()
  output$render_info_box_num_of_projects <- get_render_info_box_num_of_projects()
  output$render_info_box_num_of_todo <- get_render_info_box_num_of_todo()
}
