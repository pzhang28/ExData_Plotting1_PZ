library(sqldf)
usage <-read.csv.sql("household_power_consumption.txt", sql ="select * from file where Date ='1/2/2007' OR Date ='2/2/2007' ", header =TRUE, sep =";")
View(usage)
closeAllConnections() # to get rid of warning message for closing unused connection.
#change NA value from ?.
usage[usage == "?"] <-NA
# paste will concatenate strings. Create a new variable named DateTime in usage.
usage$DateTime <- strptime(paste(usage$Date,usage$Time),"%d/%m/%Y %H:%M:%S") 

png(filename = "plot4.png",width= 480, height =480)
par(mfrow=c(2,2),mai = c(0.65,0.65,0.65,0.65))
with(usage,{
  plot(usage$DateTime,usage$Global_active_power,ylab ="Global Active Power",type ="l", xlab = "",cex.axis =0.75,cex.lab=0.75)
  plot(usage$DateTime,usage$Voltage,ylab ="Voltage",type ="l", xlab = "datetime",cex.axis =0.75,cex.lab=0.75)
  plot(usage$DateTime,usage$Sub_metering_1,ylab ="Energy sub metering",type ="l", xlab = "",cex.axis =0.75,cex.lab=0.75)
  # add lines in base plotting
  lines(usage$DateTime,usage$Sub_metering_2,col="red")
  lines(usage$DateTime,usage$Sub_metering_3,col="blue")
  # cex is the character expansion factor relative to current par.
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.75, lty = 1, col =c("black","red","blue"),box.col="white")
  plot(usage$DateTime,usage$Global_reactive_power,type ="l",ylab = "Global_reactive_power", xlab = "datetime",ylim= c(0.0,0.5),cex.axis =0.75,cex.lab=0.75)
})
dev.off()