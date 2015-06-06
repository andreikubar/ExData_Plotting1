library(RSQLite)
library(sqldf)

t<-read.csv.sql(file="household_power_consumption.txt", 
                sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                sep=';')

dt <- strptime ( paste (t$Date,t$Time,sep=" ") , format='%d/%m/%Y %H:%M:%S')
t<-cbind(DateTime=dt, t)
str(t)

hist (t$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

