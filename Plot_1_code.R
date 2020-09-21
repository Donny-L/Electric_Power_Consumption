### Set working directory
setwd("/Users/donnyliu/Desktop/Coursera_R_programming/Exploratory_Data_Analysis/Electric_Power_Consumption")

### The data txt file is already downloaded into the working directory
# 1. read the data file into r
electricity <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(electricity) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3")

# 2. Since we only need data for "2007-02-01" and "2007-02-02", we can create a subset of data
sub_e <- subset(electricity, electricity$Date == c("1/2/2007", "2/2/2007"))

# 3. Now move on to the 1st plot which is a "histogram"
hist(as.numeric(sub_e$Global_active_power), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylim = c(0, 700))

# 4. To finish annotating the graph, we add a title
title(main = "Global Active Power")

# 5. Export the graph in a PNG format
png("plot1.png", width=480, height=480)
dev.off()

