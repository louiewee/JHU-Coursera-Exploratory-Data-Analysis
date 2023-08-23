## Assignment #Q6: Compare emissions from motor vehicle sources in Baltimore 
## City with emissions from motor vehicle sources in Los Angeles County, 
## California (fips == "06037"). Which city has seen greater changes over time 
## in motor vehicle emissions?

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(url, temp, mode = "wb")
unzip(temp, exdir = "data")
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

SCCsub <- SCC[grepl("Veh" , SCC$Short.Name), ]
VhclsNEI <- NEI[NEI$SCC %in% SCCsub$SCC, ]

VhclsBaltimoreNEI <- VhclsNEI[VhclsNEI$fips == 24510,]
VhclsBaltimoreNEI$city <- "Baltimore City"
VhclsLANEI <- VhclsNEI[VhclsNEI$fips=="06037",]
VhclsLANEI$city <- "Los Angeles County"
bothNEI <- rbind(VhclsBaltimoreNEI,VhclsLANEI)

library(ggplot2)

png("Plot6.png",width=500,height=400,units="px",bg="transparent")

g6 <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(g6)
dev.off()