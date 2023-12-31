source("modules/town_dropdown.R")

value_boxUI <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(
        width = 4,
        value_box(
          title = "Tahmini Aylık Potansiyel", 
          value = "12986 kwh",
          theme = "yellow",
          showcase = bs_icon("sun")
        )
      ),
      column(
        width = 4,
        value_box(
          title = "Tahmini Maksimum Potansiyel", 
          value = "16777 kwh",
          showcase = bs_icon("lightning"),
          theme = "blue"
        )
      ),
      column(
        width = 4,
        # value_box(
        #   title = "İlçe", 
        #   value = "İLÇE_value"
        # )
        uiOutput(ns("value_box_town"))
      )
    )
  
  )
}

value_boxServer <- function(id, town) {
  moduleServer(
    id,
    function(input, output, session) {
      output$value_box_town <- renderUI({
        value_box(
          title = "İlçe", 
          value = town(), 
          showcase = bs_icon("pin-map-fill"),
          theme = "green"
        )
      })
    }
  )
}