town_dropdownUI <- function(id) {
  ns <- NS(id)
  tagList(
  pickerInput(
    ns("town_picker"),
    choices = sort(towns$ILCEADI),
    selected = "KARATAY"
    )
  )
}

town_dropdownServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      reactive(input$town_picker)
    }
  )
}