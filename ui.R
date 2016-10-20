library(shiny)
library(shinythemes)

shinyUI <- fluidPage(theme=shinytheme("superhero"),
    titlePanel("Population changes in Wild British Birds"),
    
    sidebarLayout(
        sidebarPanel(
            h5("Discover the population changes in four wild bird groups in the UK from 1975 to 2014"),
            br(),
            selectInput(inputId = "birdtype", 
                        label = "Select a bird grouping:",
                        choices = c("Farmland.Birds", "Woodland.Birds", "Water.And.Wetland.Birds", "Wintering.Water.Birds"),
                        selected = "Farmland.Birds"),
        
        br(),
        helpText("The data covers the years 1975 to 2014 and is obtained from the dataset 'Wild Bird Populations in the UK' under a OGL ('Open Government Licence'). Click ", tags$a(href="http://data.defra.gov.uk/statistics_2015/env/bd/uk_birds_2015d.csv", "here"), "for the source datset. The source webapge with further notes on dataset can be found ", tags$a(href="https://data.gov.uk/dataset/wild_bird_populations/resource/16bcd620-c404-47ed-8cda-5315b24bf0c5", "here."))
    ),
        mainPanel(
            plotOutput("plot1")
            )
    )
)