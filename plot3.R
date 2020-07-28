library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sub <- subset(NEI, NEI$fips =="24510")
sub$type <- as.factor(sub$type)

baltimore <- aggregate(sub$Emissions, list(type = sub$type, year = sub$year), sum )
names(baltimore) <- c("Type", "Year", "Emission")

#plot and save the graph
dev.copy(png, "plot33.png")
qplot(Year, Emission, data = baltimore, color = Type, geom = "path", xlab = "Year", ylab = c("Emissions of PM2.5"), main = c("Total Emissions of PM2.5 in Baltimore, MD"))
dev.off()
