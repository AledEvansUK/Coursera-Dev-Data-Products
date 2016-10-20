library(shiny)


birdData <- read.csv('birdData.csv')
source("uk-bird-data-4-groups.R")


function(input, output) {
    output$plot1 <- renderPlot({
        birdtype = input$birdtype
        barplot(birdData[, birdtype], main = birdtype, ylab="Number of birds - relative to 1970 index value of '100'", xlab="Year", col="gold2", border="white", xaxt = "n")
        axis(side=1, at=c(0, 8, 18, 28, 38, 46), labels=c("1975","1980","1990","2000", "2010", "2015"))
        
    })
}


