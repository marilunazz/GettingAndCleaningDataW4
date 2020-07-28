NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
coal <- merge(NEI, SCC.coal, by = "SCC")
tot <- aggregate(coal$Emissions, by = list(year = coal$year), sum)

dev.copy(png, "plot44.png")
qplot(tot$year, tot$x, xlab = "Year", ylab = c("Emissions of PM2.5"), main = c("Total Emissions from Coal Combustion"), geom = "line")
dev.off()
