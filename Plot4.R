## Assignment #Q4: Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999-2008?
##

library(ggplot2)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(url, temp, mode = "wb")
unzip(temp, exdir = "data")
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

SCCsub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEIsub <- NEI[NEI$SCC %in% SCCsub$SCC, ]

png("Plot4.png",width=400,height=400,units="px",bg="transparent")

g4 <- ggplot(NEIsub, aes(x = factor(year), y = Emissions, fill =type)) + 
  geom_bar(stat= "identity", width = .4) + xlab("year") +
  ylab("Coal-Related PM2.5 Emissions") + 
  ggtitle("Total Coal-Related PM2.5 Emissions")

print(g4)
dev.off()