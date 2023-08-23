## Assignment #Q1:  Have total emissions from PM2.5 decreased in the United  
## States from 1999 to 2008? Using the base plotting system, make a plot showing  
## the total PM2.5 emission from all sources for each of the years 1999, 2002, 
## 2005, and 2008.


url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(url, temp, mode = "wb")
unzip(temp, exdir = "data")
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

data <- with(NEI, aggregate(Emissions, by = list(year), sum))

png("Plot1.png",width=480,height=480)

plot(data, type = "l", main = "Total PM2.5 Emissions by Year", xlab = "Year", 
     ylab = "PM2.5 Emissions", pch = 4, col = "darkgreen", lty = 2, lwd = 2)

dev.off()