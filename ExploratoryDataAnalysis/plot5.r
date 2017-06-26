NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCcodes <- SCC$SCC[grepl("[m|M]obile",SCC$EI.Sector)]

subsetSCC <- subset(NEI, SCC %in% SCCcodes & fips == "24510", select = c(year,Emissions))

emissionsBaltimoreMotor <- aggregate(Emissions ~ year, data = subsetSCC, FUN = sum)

png(file = "plot5.png")
with(emissionsBaltimoreMotor, plot(year,Emissions,type="o",pch=19,xaxt = 'n',
              col = "blue", ylab="PM2.5 Emissions", 
              main="PM2.5 Emissions of Motor vehicles in Baltimore",
              xlab="Year",
              xlim = c(1999,2008))
)
axis(side = 1, at = emissionsBaltimoreMotor$year) # Labeling the x axis

dev.off()


