library(sqldf)
usage <-read.csv.sql("household_power_consumption.txt", sql ="select * from file where Date ='1/2/2007' OR Date ='2/2/2007' ", header =TRUE, sep =";")
View(usage)
closeAllConnections() # to get rid of warning message for closing unused connection.
usage[usage == "?"] <-NA
# paste will concatenate strings. Create a new variable named DateTime in usage.
usage$DateTime <- strptime(paste(usage$Date,usage$Time),"%d/%m/%Y %H:%M:%S") 

png(filename = "plot2.png",width= 480, height =480)
# type = "l" for line graph. remove xlab
plot(usage$DateTime,usage$Global_active_power,ylab ="Global Active Power (kilowatts)",type ="l", xlab = "")
dev.off()