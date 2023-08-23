## Assignment #Q5: How have emissions from motor vehicle sources 
## changed from 1999–2008 in Baltimore City?

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(url, temp, mode = "wb")
unzip(temp, exdir = "data")
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

SCCsub <- SCC[grepl("Veh" , SCC$Short.Name), ]
VhclsNEI <- NEI[NEI$SCC %in% SCCsub$SCC, ]
VhclsBaltimoreNEI <- VhclsNEI[VhclsNEI$fips == 24510,]

baltt <- with(VhclsBaltimoreNEI, aggregate(Emissions, by = list(year), sum))

png("Plot5.png",width=400,height=400)

plot(baltt, type = "o", main = "Total PM2.5 Emissions from Motor Vehicle
     Sources in Baltimore City", xlab = "Year", 
     ylab = "PM2.5 Emissions from Motor Vehicles", 
     pch = 19, col = "darkblue", lty = 6)

dev.off()