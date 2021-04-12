library(sqldf)
usage <-read.csv.sql("household_power_consumption.txt", sql ="select * from file where Date ='1/2/2007' OR Date ='2/2/2007' ", header =TRUE, sep =";")
View(usage)
closeAllConnections() # to get rid of warning message for closing unused connection.
usage[usage == "?"] <-NA
# paste will concatenate strings. Create a new variable named DateTime in usage.
usage$DateTime <- strptime(paste(usage$Date,usage$Time),"%d/%m/%Y %H:%M:%S") 

png(filename = "plot3.png",width= 480, height =480)
plot(usage$DateTime,usage$Sub_metering_1,ylab ="Energy sub metering",type ="l", xlab = "")
# add lines in base plotting
lines(usage$DateTime,usage$Sub_metering_2,col="red")
lines(usage$DateTime,usage$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col =c("black","red","blue"))
dev.off()