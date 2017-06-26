NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == 24510, select = c(year,Emissions,type))
totalEmissions <- aggregate(Emissions~year+type, data=baltimore, sum)
png(file = "plot3.png")
names(totalEmissions) <- c("Year","Type_Variable", "Emissions")
ggplot(totalEmissions, aes(Year, Emissions,color=Type_Variable)) + geom_line() + labs(y="PM2.5 Emissions") + labs(title = "PM2.5 Emissions in Baltimore City, Maryland")

dev.off()


