## Read in data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset SCC data for coal

CoalSCC <- SCC[grepl("Coal", SCC$EI.Sector), ]

## Subset NEI data for coal

CoalNEI <- NEI[(NEI$SCC %in% CoalSCC$SCC),]

## Group total emissions from coal by year

CoalEmissions <- aggregate(Emissions ~ year, CoalNEI, sum)

## Plot the data

png('plot4.png')
ggplot(CoalEmissions, aes(year, Emissions/1000, label = round(Emissions/1000, 0))) + 
                      geom_bar(stat = "identity") + 
                      xlab("year") + 
                      ylab(expression('Total PM'[2.5]*' emmission (kilotons)')) + 
                      ggtitle(expression('Total PM'[2.5]*' emmission from coal')) + 
                      theme(plot.title = element_text(hjust = 0.5)) + 
                      geom_label(aes(fill = year), color = "white")
dev.off()
