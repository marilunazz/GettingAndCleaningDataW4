NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get data only from 1999, 2002, 2005, 2008 with relevant columns
sub <- subset(NEI, year == 1999 | year == 2002 |  year == 2005 |  year == 2008, select = c(Emissions, type, year) )
sub$year <- as.factor(sub$year)

#find the total emission per source
tot <- aggregate(sub$Emissions, by = list(sub$year), FUN = sum)
names(tot) <- c("Year", "Total Emissions")
#plot the barplot and save it as a png
dev.copy(png, "plot11.png")
barplot(tot$`Total Emission`, xlab = "Year", ylab =c("Emissions of PM2.5"), main = c("Total Emssions of PM2.5"), col = c("red", "blue", "green", "yellow"), names.arg = c("1999", "2002", "2005", "2008"))
dev.off()

