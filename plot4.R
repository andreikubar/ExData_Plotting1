library(RSQLite)
library(sqldf)

t<-read.csv.sql(file="household_power_consumption.txt", 
                sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                sep=';')

dt <- strptime ( paste (t$Date,t$Time,sep=" ") , format='%d/%m/%Y %H:%M:%S')
t<-cbind(DateTime=dt, t)
str(t)



windows()

par(mfrow= c(2,2))
plot ( t$DateTime, t$Global_active_power , type="l", ylab="Global Active Power", xlab="datetime")
plot ( t$DateTime, t$Voltage , type="l", ylab="Voltage", xlab="datetime")

plot ( t$DateTime, t$Sub_metering_1, ylab="Energy sub metering", xlab=NA, col="black", type="l")
lines ( t$DateTime, t$Sub_metering_2, col="red", xlab=NA)
lines ( t$DateTime, t$Sub_metering_3, col="blue", xlab=NA)
legend ( "topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black","red","blue"), lty=1)

plot ( t$DateTime, t$Global_reactive_power , type="l", ylab="Global reactive Power", xlab="datetime")
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
