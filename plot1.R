setwd("~/Documents/R/coursera")
datafr <- read.table("household_power_consumption.txt",
                     +                      sep = ";",
                     +                      header=TRUE,
                     +                      na.string=c("?",""))
                     

datafr$Date <- as.Date(datafr$Date, format = "%d/%m/%Y")
str(datafr)
datafr$timetemp <- paste(datafr$Date, datafr$Time)
head(datafr$timetemp)
datafr$Time <- strptime(datafr$timetemp, format = "%Y-%m-%d %H:%M:%S")
str(datafr)
datafr <- subset(datafr, Date >= "2007-02-01" & Date <= "2007-02-02")
head(datafr)
tail(datafr)

with(datafr,hist(Global_active_power,main = "Golbal Active Power", xlab = "Gobal Active Power (kilowatts)", col = "red"))
dev.copy(png, file = "plot1.png")
dev.off()
