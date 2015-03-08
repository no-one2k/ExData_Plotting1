plot2 <- function(data_read = NULL){
  if(is.null(data_read)){
    data_raw <- subset(read.csv2("exdata_cp1.txt", na.strings = "?", dec = "."), 
                        Date %in% c("1/2/2007","2/2/2007") )
    dts <- strptime(paste(data_raw[,1],data_raw[,2]), "%d/%m/%Y %H:%M:%S")
    data_plot <- cbind(data_raw,dts)
  }else{
    data_plot <- data_read
  }
  png(file  = "plot2.png")
  with(data_plot,plot(dts,Global_active_power, 
                      type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
  #dev.copy(png, file  = "plot2.png")
  #dev.off()
  dev.off()
}