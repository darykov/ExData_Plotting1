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
hist(Electric_power$Global_active_power, col="red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)" )

dev.copy(png, filename = "Plot1.png")
dev.off()