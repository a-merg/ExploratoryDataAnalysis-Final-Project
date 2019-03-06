## Read in data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data for only Baltimore City

BaltSubT <- subset(NEI, fips == 24510)

## Group total emissions by year 

BaltTotalEm <- aggregate(Emissions ~ year, BaltSubT, sum)

## Plot the data

png('plot2.png')
barplot(BaltTotalEm$Emissions, names.arg = BaltTotalEm$year, 
                                  ylim = c(0, 4000), 
                                  xlab = "Years", 
                                  ylab = expression('Total PM'[2.5]*' emmission'), 
                                  main = expression('Total PM'[2.5]*' emmissions in Baltimore City'))
dev.off()