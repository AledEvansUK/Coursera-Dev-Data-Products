# This data is from 'Wild Bird Populations in the UK' under a OGL ('Open Government Licence') the http://data.defra.gov.uk/statistics_2015/env/bd/uk_birds_2015d.csv. Source webapge with further notes on dataset can be found at the url <https://data.gov.uk/dataset/wild_bird_populations/resource/16bcd620-c404-47ed-8cda-5315b24bf0c5>.

# The data uses an index of 100 at 1970. The bird indes is relative tthis "100" baseline figure. 

# Data processing
# The time period 1975 to 2014 was selected so four groups ("Farmland Birds", "Woodland Birds", "WaterAnd Wetland Birds", "Wintering Water Birds") could all be used for comparision. The fifth bird grouping - "Sea Birds" were ecluded as the records only started in 1986.

library(dplyr) 



dim(ukbirdsData)

# filter year for rows that only all four variables - mssing values for some varaible in 1970-1975 period and in 2015.
ukbirdsData2 <- filter(ukbirdsData, Year > 1975)
ukbirdsData3 <- filter(ukbirdsData2, Year < 2014)

dim(ukbirdsData3)
str(ukbirdsData3)
colnames(ukbirdsData3)

# Reamne columns of four selected variables. The unsmoothed figures for each group are used for this project.
names(ukbirdsData3)[names(ukbirdsData3) == "Farmland.birds.All..19..Unsmoothed.data"] <- "Farmland.Birds"
names(ukbirdsData3)[names(ukbirdsData3) == "Woodland.birds.All..37..Unsmoothed.data"] <- "Woodland.Birds"
names(ukbirdsData3)[names(ukbirdsData3) == "Water.and.Wetland.birds.All..26..Unsmoothed.data"] <- "Water.And.Wetland.Birds"
names(ukbirdsData3)[names(ukbirdsData3) == "Wintering.Water.birds.All..46...Unsmoothed.data"] <- "Wintering.Water.Birds"
ukbirdsData3

colnames(ukbirdsData3)

# Take four selected bird groups into a new dataframe along with "Year" variable.
birdData <- select(ukbirdsData3, Year, Farmland.Birds, Woodland.Birds, Water.And.Wetland.Birds, Wintering.Water.Birds)

colnames(birdData)
dim(birdData)

# write .csv file to used by server.R file for the Shiny App.
write.csv(birdData, 'birdData.csv')

