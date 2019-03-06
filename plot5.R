## Read in data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data for only Baltimore City and On Road equipment

BaltOnRoad <- NEI[(NEI$fips == 24510) & (NEI$type == "ON-ROAD"), ]

## Group total emissions by year and type

BaltOnRoadTotal <- aggregate(Emissions ~ year, BaltOnRoad, sum)

## Plot the data

png('plot5.png')
ggplot(BaltOnRoadTotal, aes(year, Emissions, label = round(Emissions, 0))) + 
                                             geom_bar(stat = "identity") + 
                                             xlab("year") + 
                                             ylab(expression('Total PM'[2.5]*' emmission')) + 
                                             ggtitle(expression('Total PM'[2.5]*' emmission by motor vehicles in Baltimore City')) +
                                             theme(plot.title = element_text(hjust = 0.5)) + 
                                             geom_label(aes(fill = year), color = "white")
dev.off()