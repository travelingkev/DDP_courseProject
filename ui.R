library(shiny)


shinyUI(pageWithSidebar(
    # Application title
    headerPanel("Lake Huron Depths"),
    
    sidebarPanel(
       sliderInput('level', 'Choose an example Lake Level', value=579, min=575, max=582, step = 0.01),
       verbatimTextOutput('oPercentile'),
       p('Use the slider above to see the percentile rank below for various lake depth measurements')
       ),
    mainPanel(
       plotOutput('LakeLevelHist')
    )
))