library(data.table)
setwd("C:/Users/Borja/Documents/Workspace coursera/4-Exploratory_Data_Analysis/Week1/Final project")
data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

data <- data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Generate DateTime
data<- data[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


#Filter data between  2007-02-01 and 2007-02-03
data <- data[(DateTime >= "2007-02-01") & (DateTime <= "2007-02-03")]


#Graph plots
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(x = data[,DateTime], y=data[,Global_active_power], type = "l", ylab = "Global Active Power")
plot(x = data[,DateTime], y=data[,Voltaje], type = "l", ylab = "Voltaje")

plot(x = data[,DateTime], y=data[,Sub_metering_1], type = "l", ylab = "Energy sub metering")
lines(x = data[,DateTime], y=data[,Sub_metering_2], col = "red", type = "l")
lines(x = data[,DateTime], y=data[,Sub_metering_3], col = "blue", type = "l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"),lty=c(1,1), lwd=c(1,1))

plot(x = data[,DateTime], y=data[,Global_reactive_power], type = "l", ylab = "Global Reactive Power")
dev.off()

#View plot
windows()
par(mfrow=c(2,2))

plot(x = data[,DateTime], y=data[,Global_active_power], type = "l", ylab = "Global Active Power")
plot(x = data[,DateTime], y=data[,Voltaje], type = "l", ylab = "Voltaje")

plot(x = data[,DateTime], y=data[,Sub_metering_1], type = "l", ylab = "Energy sub metering")
lines(x = data[,DateTime], y=data[,Sub_metering_2], col = "red", type = "l")
lines(x = data[,DateTime], y=data[,Sub_metering_3], col = "blue", type = "l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"),lty=c(1,1), lwd=c(1,1))

plot(x = data[,DateTime], y=data[,Global_reactive_power], type = "l", ylab = "Global Reactive Power")