library(shiny)
library(datasets)
data("LakeHuron")


shinyServer(
    function(input, output){
       output$LakeLevelHist <- renderPlot({
           hist(LakeHuron, xlab = 'Lake Depth', col='blue', main = 'Histogram')
           level <- input$level
           lines(c(level, level), c(0,50), col = 'red', lwd=7)
           pct_rank <- ecdf(LakeHuron)(level)
           #print(pct_rank)
           output$oPercentile <- renderPrint({paste('percentile_rank = ', pct_rank)})
           #text(63, 150, paste('percentile_rank = ', round(pct_rank, 2)))
           #text(63, 140, paste('lake depth = ', level))
       })
    }
)