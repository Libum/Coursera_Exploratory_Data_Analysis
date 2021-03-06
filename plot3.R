file = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(file,temp)
NEI <- readRDS(unz(temp,"summarySCC_PM25.rds"))
SCC <- readRDS(unz(temp, "Source_Classification_Code.rds"))
unlink(temp)
library(dplyr)
library(ggplot2)
plot3 = ggplot(NEI, aes(year, Emissions))
plot3 + geom_line(color = type)
dev.copy(png, file = "plot3.png")  
dev.off()  