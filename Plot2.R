## Assignment #Q2: Have total emissions from PM2.5 decreased in the Baltimore 
## City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
## system to make a plot answering this question.

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(url, temp, mode = "wb")
unzip(temp, exdir = "data")
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

data <- subset(NEI, fips == "24510")
Balt <- tapply(data$Emissions, as.integer(data$year), sum)

png("Plot2.png",width=500,height=480)

plot(Balt, type = "l", main = "Total PM2.5 Emissions in Baltimore County", 
     xlab = "Year", ylab = "PM2.5 Emissions", pch = 18, col = "darkgreen", 
     lty = 5, lwd=5)

dev.off()