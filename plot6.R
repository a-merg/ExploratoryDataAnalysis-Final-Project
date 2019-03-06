## Read in data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset data for only Baltimore City and On Road equipment

BaltOnRoad <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"), ]

## Subset data for only LA and On Road equipment

LAonRoad <- NEI[(NEI$fips == "06037") & (NEI$type == "ON-ROAD"), ]

## Create county names for graphing label purposes

BaltOnRoad$County <- "Baltimore"
LAonRoad$County <- "Los Angeles"

## Combine data frames

BaltLAbind <- rbind(BaltOnRoad, LAonRoad)

## ## Group total emissions by year and County

BaltLAtotal <- aggregate(Emissions ~ year + County, BaltLAbind, sum)

## Plot the data

png("plot6.png")
ggplot(BaltLAtotal, aes(year, Emissions, fill = County, label = round(Emissions, 0))) + 
                                         geom_bar(stat = "identity") + 
                                         facet_grid(County ~ ., scales = "free") + 
                                         xlab("year") + ylab(expression('Total PM'[2.5]*' emmission')) + 
                                         ggtitle("Motor vehicle emmissions in LA and Baltimore") + 
                                         theme(plot.title = element_text(hjust = 0.5)) + 
                                         geom_label(aes(fill = County), color = "white")
dev.off()

