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



dx[,"Date"] <- dmy(dx[,"Date"])
dx[,"Time"] <- hms(dx[, "Time"])


plot(dx$Global_active_power,
     type = "l",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)"
     )

axis(1, at= 1:3, labels= c("Thu", "Fri", "Sat"), tick = TRUE)

dev.copy(png, file= "plot2.png", width = 480, height = 480)
dev.off()
# axis(1, xaxp = c(2, 9, 7))
