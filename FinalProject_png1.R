library(data.table)
setwd("C:/Users/Borja/Documents/Workspace coursera/4-Exploratory_Data_Analysis/Week1/Final project")
data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

data <- data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Generate DateTime
data<- data[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


#Filter data between  2007-02-01 and 2007-02-03
data <- data[(DateTime >= "2007-02-01") & (DateTime <= "2007-02-03")]


#Graph plots
png("plot1.png", width = 480, height = 480)
hist(data[,Global_active_power], col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

#View plot
windows()
hist(data[,Global_active_power], col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
