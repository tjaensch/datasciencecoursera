NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCcodes <- SCC$SCC[grepl("[m|M]obile",SCC$EI.Sector)]
subsetSCC <- subset(NEI, SCC %in% SCCcodes & (fips == "24510" | fips == "06037")
                 , select = c(year,Emissions,fips))
emissionsBaltimoreAndLa <- aggregate(Emissions ~ year + fips, data = subsetSCC, FUN = sum)
names(emissionsBaltimoreAndLa) <- c("Year", "County", "Emissions")
emissionsBaltimoreAndLa$County<-rep(c("Los Angeles","Baltimore"),each=4)
png(file = "plot6.png")
qplot(Year,Emissions,data=emissionsBaltimoreAndLa,color=County) + geom_line() + labs(y="PM2.5 Emissions") + labs(title = "Total of PM2.5 Emissions by year")

dev.off()


