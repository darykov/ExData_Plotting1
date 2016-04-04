file<-"household_power_consumption.txt"
Electric_power<-read.table(file, sep = ";", header = TRUE, stringsAsFactors = F)

Electric_power$Date<-as.Date(Electric_power$Date, format = "%d/%m/%Y")
date <- Electric_power$Date >= as.Date("2007-02-01") & Electric_power$Date <= as.Date("2007-02-02")
Electric_power<-Electric_power[date,]
Electric_power$Global_active_power<-as.numeric(Electric_power$Global_active_power)
Electric_power$Global_reactive_power<-as.numeric(Electric_power$Global_reactive_power)
Electric_power$Voltage<-as.numeric(Electric_power$Voltage)
Electric_power$Global_intensity<-as.numeric(Electric_power$Global_intensity)
Electric_power$Sub_metering_1<-as.numeric(Electric_power$Sub_metering_1)
Electric_power$Sub_metering_2<-as.numeric(Electric_power$Sub_metering_2)
Electric_power$Sub_metering_3<-as.numeric(Electric_power$Sub_metering_3)

par(mfrow=c(1,1))
with(Electric_power, plot(Sub_metering_1, ylab = "Energy Sub Metering",type = "n", xaxt="n", xlab=""))
with(Electric_power, points(Sub_metering_1, col="black", type="s"))
with(Electric_power, points(Sub_metering_2, col="red", type="s"))
with(Electric_power, points(Sub_metering_3, col="blue", type="s"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
axis(side = 1, at=c(0,dim(Electric_power)[1]/2, dim(Electric_power)[1]+1) , labels = c("Thu", "Fri", "Sat"))
dev.copy(png, filename = "Plot3.png")
dev.off()