### Set Working Directory
setwd("/Users/donnyliu/Desktop/Coursera_R_programming/Exploratory_Data_Analysis/Electric_Power_Consumption")

### The data txt file is already downloaded into the working directory
# 1. read the data file into r
electricity <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(electricity) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3")

# 2. Since we only need data for "2007-02-01" and "2007-02-02", we can create a subset of data
sub_e <- subset(electricity, electricity$Date == c("1/2/2007", "2/2/2007"))

# 3. Transform the "Date" and "Time" variables
sub_e$Date <- as.Date(sub_e$Date, format="%d/%m/%Y")
date_time <- paste(as.Date(sub_e$Date), sub_e$Time)
sub_e$Date_and_Time <- as.POSIXct(date_time)

# 4. calling the basic plot function
with(sub_e, plot(Global_active_power ~ Date_and_Time, type = "l",
                 ylab = "Global Active Power (kilowatts", xlab = ""))

# 5. Export the graph in a PNG format
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()

