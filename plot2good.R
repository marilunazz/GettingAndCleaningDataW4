NEI <- readRDS("summarySCC_PM25.rds")

sub <- subset(NEI, NEI$fips =="24510")
sub$type <- as.factor(sub$type)
tot <- aggregate(sub$Emissions, list(year = sub$year), sum)

dev.copy(png, "plot22good.png")
plot(tot$year, tot$x, xlab = "Year", ylab = c("Emissions of PM2.5"), main = c("Total Emissions of PM2.5 in Baltimore, MD"), type = "b", col = "blue")
dev.off()