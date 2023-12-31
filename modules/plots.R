plotsUI <- function(id) {
  ns <- NS(id)
  tagList(
  plotOutput(ns("plot_combined")),
  )
}

plotsServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      output$plot_combined <- renderPlot({
        p_predicted_pv <- ggplot(solar_df) +
          geom_line(aes(x = month, y = predicted_pv_monthly),
                    linewidth = 1.2, color = "#26547c") +
          scale_x_continuous(breaks = 1:12) +
          theme_pubr() +
          labs(x = "Month", y = "PV Production (kWh)")
        
        p_temp_monthly <- ggplot(solar_df) +
          geom_line(aes(x = month, y = temp_monthly),
                    linewidth = 1.2, color = "#ef476f") +
          scale_x_continuous(breaks = 1:12) +
          theme_pubr() +
          labs(x = "Month", y = "Temperature")
        
        p_rh_monthly <- ggplot(solar_df) +
          geom_line(aes(x = month, y = rh_monthly),
                    linewidth = 1.2, color = "#ffd166") +
          scale_x_continuous(breaks = 1:12) +
          theme_pubr() +
          labs(x = "Month", y = "Relative Humidity (%)")
        
        p_GHI_monthly <- ggplot(solar_df) +
          geom_line(aes(x = month, y = GHI_monthly),
                    linewidth = 1.2, color = "#06d6a0") +
          scale_x_continuous(breaks = 1:12) +
          theme_pubr() +
          labs(x = "Month", y = "Global Horizontal Irradiation (GHI)")
        
        p_combined <- ggarrange(p_predicted_pv, p_temp_monthly, p_rh_monthly, p_GHI_monthly, 
                                nrow = 1, ncol = 4)
        p_combined
      })
    }
  )
}