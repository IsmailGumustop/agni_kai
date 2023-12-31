data_tableUI <- function(id) {
  ns <- NS(id)
  tagList(
  # dataTableOutput(ns("dummy_dt"))
  tableOutput(ns("dummy_dt"))
  )
}

data_tableServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # output$dummy_dt <- renderDataTable(iris)
      output$dummy_dt <- renderTable(solar_df)
    }
  )
}