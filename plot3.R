## Read in data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data for only Baltimore City

BaltSubT <- subset(NEI, fips == 24510)

## Group total emissions by year and type

BaltByType <- aggregate(Emissions ~ year + type, BaltSubT, sum)

## Plot the data

png('plot3.png')
ggplot(BaltByType, aes(year, Emissions, color = type)) + 
                    geom_line() + 
                    xlab("year") + 
                    ylab(expression('Total PM'[2.5]*' emmission')) + 
                    ggtitle(expression('Total PM'[2.5]*' emmission by type')) +
                    theme(plot.title = element_text(hjust = 0.5))
dev.off()