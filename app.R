library(shiny)
library(DT)
library(bslib)
library(bsicons)
library(shinyWidgets)
library(ggplot2)
library(ggpubr)

source("modules/value_box.R")
source("modules/data_table.R")
source("modules/town_dropdown.R")
source("modules/plots.R")

towns <- read.csv("data/ilceler.csv", header = TRUE)
solar_df <- read.csv("data/karatay_uretim_sonuc_kwh_monthly.csv")

ui <- page_navbar(
  includeCSS("www/style.css"),
  id = "navbar_top",
  title = "KONSOLAR",
  nav_panel(title = "Anasayfa", 
            fluidRow(
              value_boxUI("value_box_module"),
              
              fluidRow(
                column(width = 4),
                column(
                  width = 4,
                  town_dropdownUI("town_dropdown_module")
                  ),
                column(width = 4)
              ),
              # data_tableUI("data_table_module")
              
              dataTableOutput("dummy_dt"),
              plotsUI("plots_module")
            ),
            includeHTML("www/footer.html")
            ),
  nav_panel(title = "Hakkında", 
            includeHTML("www/about2.html")
            )
  
)

server <- function(input, output, session) {
  town <- town_dropdownServer("town_dropdown_module")
  value_boxServer("value_box_module", town)
  data_tableServer("data_table_module")
  town_dropdownServer("town_dropdown_module")
  plotsServer("plots_module")
  output$dummy_dt <- renderDataTable({
    solar_df_rounded <- round(solar_df)
    colnames(solar_df_rounded) <- c("Ay", "GHI", 
                                    "Bağıl Nem", "Sıcaklık (\u00B0C)", 
                                    "Tahmini Solar Enerji Üretimi"
    )
    solar_df_rounded
  },
  options = list(pageLength = 15, info = FALSE))
}


shinyApp(ui, server)

