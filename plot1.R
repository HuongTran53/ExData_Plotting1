library(data.table)
library(lubridate)
# read the file:
df <- read.table("data/household_power_consumption.txt",
                 header = TRUE,
                 sep = ";")

# subset the data:
index1 <- which(df[,"Date"] == "1/2/2007")[1]
index2 <- which(df[,"Date"] == "2/2/2007")
index2 <- index2[length(index2)]
df <- df[index1:index2,]

# change column into numeric:
df[, "Global_active_power"] <- as.numeric(df[, "Global_active_power"])
hist(df$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red",
     main = "Global Active Power")

dev.copy(png, file= "plot1.png", width = 480, height = 480)
dev.off()
