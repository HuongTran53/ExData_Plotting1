library(data.table)
library(dplyr)
library(lubridate)
# read the file:
df <- read.table("data/household_power_consumption.txt",
                 header = TRUE,
                 sep = ";")

# convert the Date column into time:
index1 <- which(df[,"Date"] == "1/2/2007")[1]
index2 <- which(df[,"Date"] == "2/2/2007")
index2 <- index2[length(index2)]

dx <- df[index1:index2,]

dx[,"Sub_metering_1"] <- as.numeric(dx[,"Sub_metering_1"])
dx[,"Sub_metering_2"] <- as.numeric(dx[,"Sub_metering_2"])
dx[,"Sub_metering_3"] <- as.numeric(dx[,"Sub_metering_3"])

par(mfrow = c(2, 2))

# first plot
plot(dx$Global_active_power,
     type = "l",
     xaxt = "n",
     ylab = "Global Active Power"
)
axis(1, at= 1:3, labels= c("Thu", "Fri", "Sat"), tick = TRUE)

# second plot
plot(dx$Voltage,
     type = "l",
     xaxt = "n",
     ylab = "Voltage",
     xlab = "datetime"
)
axis(1, at= 1:3, labels= c("Thu", "Fri", "Sat"), tick = TRUE)

# third plot:
plot(dx$Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt = "n")
points(dx$Sub_metering_2, type = "l", col = "red")
points(dx$Sub_metering_3, type = "l", col = "blue")

axis(1, at= 1:3, labels= c("Thu", "Fri", "Sat"), tick = TRUE)
legend("topright",
       pch = c(NA, NA, NA),
       col = c("black", "blue", "red"), 
       lwd=1, 
       lty=c(1,1,1),
       legend = c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"),
       cex = 0.5)

# forth plot:
plot(dx$Global_reactive_power,
     type = "l",
     xaxt = "n",
     ylab = "Global_reactive_power",
     xlab = "datetime"
)
axis(1, at= 1:3, labels= c("Thu", "Fri", "Sat"), tick = TRUE)


dev.copy(png, file= "plot4.png", width = 480, height = 480)
dev.off()
