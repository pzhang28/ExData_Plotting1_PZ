library(sqldf)
usage <-read.csv.sql("household_power_consumption.txt", sql ="select * from file where Date ='1/2/2007' OR Date ='2/2/2007' ", header =TRUE, sep =";")
View(usage)
closeAllConnections() # to get rid of warning message for closing unused connection.
#change NA value from ?.
usage[usage == "?"] <-NA
# use cex to change text font size
png(filename = "plot1.png",width= 480, height =480)
hist(usage$Global_active_power,col ="red", xlab = "Global Active Power (kilowatts)",main = "global Active Power",cex.axis=0.75)
dev.off()


