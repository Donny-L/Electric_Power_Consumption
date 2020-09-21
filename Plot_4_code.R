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

# 4. Set up the graph pane and margins
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# 5. Plot the graphs
with(sub_e, {
        plot(Global_active_power~Date_and_Time, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Date_and_Time, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Date_and_Time, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_and_Time,col='Red')
        lines(Sub_metering_3~Date_and_Time,col='Blue')
        legend("topleft", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Date_and_Time, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

# 6. Export the graph(s) as a PNG file
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()





