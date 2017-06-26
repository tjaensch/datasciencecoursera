NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCcodes <- SCC$SCC[grepl("[C|c]oal",SCC$EI.Sector)]
subsetSCC <- subset(NEI, SCC %in% SCCcodes, select = c(year,Emissions))
emissionsUSACoal <- aggregate(Emissions ~ year, data = subsetSCC, FUN = sum)
png(file = "plot4.png")
with(emissionsUSACoal, plot(year,Emissions,type="o",pch=19,xaxt = 'n',
              col = "blue", ylab="PM2.5 Emissions", 
              main="PM2.5 Emissions of Coal Combustion-related sources",
              xlab="Year",
              xlim = c(1999,2008))
)
axis(side = 1, at = emissionsUSACoal$year)

dev.off()


