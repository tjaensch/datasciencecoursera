NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
graph <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year), sum)

png('plot2.png', width=480, height=480)

plot(graph$year, graph$Emissions, type = "l", 
     main = "Total PM2.5 Emission in Baltimore 1999-2008",
     xlab = "Year", ylab = "Emissions")

dev.off()


