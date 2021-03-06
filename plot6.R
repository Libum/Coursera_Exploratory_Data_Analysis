file = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(file,temp)
NEI <- readRDS(unz(temp,"summarySCC_PM25.rds"))
SCC <- readRDS(unz(temp, "Source_Classification_Code.rds"))
unlink(temp)
library(dplyr)
par(mfrow = c(1,2))
sum_year = NEI %>% filter(., fips == "24510" & type == "ON-ROAD") %>% group_by(., year) %>% summarize(., sumPH25 = sum(Emissions))
plot(sum_year)
lines(sum_year)
title(main="Baltimore - MV pollution") 
sum_year = NEI %>% filter(., fips == "06037" & type == "ON-ROAD") %>% group_by(., year) %>% summarize(., sumPH25 = sum(Emissions))
plot(sum_year)
lines(sum_year)
title(main="Los Angeles - MV pollution")  
dev.copy(png, file = "plot6.png")  
dev.off()  