plot3 <- function (info = FALSE)
{
  
  ## The program construct the plot and save it to a PNG file 
  ## with a width of 480 pixels and a height of 480 pixels, in ypur
  ## working directory (getwd()).
  
  ## Name of the plot file: plot3.png
  
  ## info: logical. If FALSE (default) the saved png file location is not listed.
  
  ## Tested and created on Windows!
  
  if (!sum(list.files(getwd()) == "household_power_consumption.txt"))
    stop(paste("Please copy 'household_power_consumption.txt' in your working directory: ", getwd(), sep=""))
  
  electric <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  eRows <- which((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007"))
  i <- min(eRows)
  j <- max(eRows)
  
  png("plot3.png", width=480, height=480)
  
  plot(electric[i:j, 7], xlab="", ylab="Energy sub metering", type="l", xaxt="n", xlim=c(-1,3001))
  lines(electric[i:j, 8],col="red")
  lines(electric[i:j, 9],col="blue")
  axis(1, seq(0, 3000, length=3), c("Thu", "Fri", "Sat"))
  legend("topright", colnames(electric)[7:9], lwd=1, col=c("black", "red", "blue"))
  
  invisible(dev.off())
  
  ### Save PNG
  plot(electric[i:j, 7], xlab="", ylab="Energy sub metering", type="l", xaxt="n", xlim=c(-1,3001))
  lines(electric[i:j, 8],col="red")
  lines(electric[i:j, 9],col="blue")
  axis(1, seq(0, 3000, length=3), c("Thu", "Fri", "Sat"))
  legend("topright", colnames(electric)[7:9], lwd=1, col=c("black", "red", "blue"))
  
  if (info) message(paste("Plot saved: ", getwd(), sep=""))    
}
