NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips == "24510" & type == "ON-ROAD")
baltimore$year <- factor(baltimore$year, levels = c('1999', '2002', '2005', '2008'))
tot <- aggregate(baltimore$Emissions, by = list(baltimore$year), sum)
names(tot) <- c("Year", "Emisions")
tot$Year <- as.numeric(tot$Year)

dev.copy(png, "plot5good.png")
qplot(Year, Emissions, data = tot, xlab = "Year", ylab = c("Emissions of PM2.5"), main = c("Total Emissions from Motor Vehicles in Baltimore City, MD"), geom = "line")
dev.off()

