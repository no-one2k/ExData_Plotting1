plot1 <- function(data_read = NULL){
  if(is.null(data_read)){
    data_plot <- subset(read.csv2("exdata_cp1.txt", na.strings = "?", dec = "."), 
                        Date %in% c("1/2/2007","2/2/2007") )
  }else{
    data_plot <- data_read
  }
  png(file  = "plot1.png")
  hist(data_plot$Global_active_power, main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)",col = "red")
  #dev.copy(png, file  = "plot1.png")
  #dev.off()
  dev.off()
}