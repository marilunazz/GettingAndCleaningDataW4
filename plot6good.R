NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips == "24510" & type == "ON-ROAD")
la <- subset(NEI, NEI$fips == "06037" & type == "ON-ROAD")

btot <- aggregate(baltimore$Emissions, by = list(baltimore$year), sum)
latot <- aggregate(la$Emissions, by = list(la$year), sum)
names(latot) <- c("Year", "LA.Emissions")
names(btot) <- c("Year", "B.Emissions")
both <- merge(latot, btot, by = "Year")

dev.copy(png, "plot6good.png")
ggplot(data = both, aes(x = Year)) + geom_line(aes(y= LA.Emissions), color = "red") + geom_line(aes(y=B.Emisions), color = "blue") + xlab("Year") + ylab("Emissions of PM2.5") + ggtitle("Total Emissions from motor vehicles in Baltimore and Los Angeles")
dev.off()



