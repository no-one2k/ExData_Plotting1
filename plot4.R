plot4 <- function(data_read = NULL){
  if(is.null(data_read)){
    data_raw <- subset(read.csv2("exdata_cp1.txt", na.strings = "?", dec = "."), 
                       Date %in% c("1/2/2007","2/2/2007") )
    dts <- strptime(paste(data_raw[,1],data_raw[,2]), "%d/%m/%Y %H:%M:%S")
    data_plot <- cbind(data_raw,dts)
  }else{
    data_plot <- data_read
  }
  png(file  = "plot4.png")
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  with(data_plot,{
    plot(dts,Global_active_power, 
         type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
    plot(dts,Voltage, 
         type = "l",xlab = "datetime",ylab = "Voltage")
    plot(dts,Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub metering")
      lines(dts,Sub_metering_2, type = "l",col = "red")
      lines(dts,Sub_metering_3, type = "l",col = "blue")
      legend("topright",  col = c("black", "red", "blue"), 
              legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd = 1)
    plot(dts,Global_reactive_power, 
         type = "l",xlab = "datetime")})
  dev.off()
}