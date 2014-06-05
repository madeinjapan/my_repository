plot1 <- function (info = FALSE)
{
  
  ## The program construct the plot and save it to a PNG file 
  ## with a width of 480 pixels and a height of 480 pixels, in ypur
  ## working directory (getwd()).
  
  ## Name of the plot file: plot3.png
  
  ## info: logical. If FALSE (default) the saved png file location is not listed.
  
  ## Tested and created on Windows!
  
  electric <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  eRows <- which((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007"))
  i <- min(eRows)
  j <- max(eRows)
  
  hist(electric[i:j, 3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  
  ### Save PNG
  png("plot1.png", width=480, height=480)
  hist(electric[i:j, 3], col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  invisible(dev.off())
  
  if (info) message(paste("Plot saved: ", getwd(),sep=""))
}
