NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

graph <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

png('plot1.png', width=480, height=480)

plot(graph$year, graph$Emissions, type = "l", 
     main = "Total PM2.5 Emission in the US 1999-2008",
     xlab = "Year", ylab = "Emissions")

dev.off()


