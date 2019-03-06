## Read in data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Group total emissions by year

TotalEmissions <- aggregate(Emissions ~ year, NEI, sum)

## Plot the data

png('plot1.png')
barplot(Emissions$Emissions/1000, Emissions$year, ylim = c(0, 8000), 
                                                  xlab = "Years", 
                                                  ylab = expression('Total PM'[2.5]*' emmission in kilotons'), 
                                                  main = expression('Total PM'[2.5]*' emmissions in kilotons by year'))
dev.off()