plot4 <- function (info = FALSE)
{
  
  ## The program construct the plot and save it to a PNG file 
  ## with a width of 480 pixels and a height of 480 pixels, in ypur
  ## working directory (getwd()).
  
  ## Name of the plot file: plot4.png
  
  ## info: logical. If FALSE (default) the saved png file location is not listed.
  
  ## Tested and created on Windows!
  
  if (!sum(list.files(getwd()) == "household_power_consumption.txt"))
    stop(paste("Please copy 'household_power_consumption.txt' in your working directory: ", getwd(), sep=""))
  
  collectData <- function()
  {
    electric <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
    eRows <- which((electric$Date == "1/2/2007") | (electric$Date == "2/2/2007"))
    i <- min(eRows)
    j <- max(eRows)
    
    invisible(list(i = i, j = j, electric = electric))
  }
  
  plotData <- function(i, j, electric)
  {
    par(cex = .8)
    
    split.screen(c(2, 2))
    
    screen(1)
    plot(electric[i:j, 3], xlab="", ylab="Global Active Power", type="l", xaxt="n", xlim=c(-1,3001))
    axis(1, seq(0, 3000, length=3), c("Thu", "Fri", "Sat"))
    
    screen(2)
    plot(electric[i:j, 5], xlab="datetime", ylab="Voltage", type="l", xaxt="n", xlim=c(-1,3001))
    axis(1, seq(0, 3000, length=3), c("Thu", "Fri", "Sat"))
    
    screen(3)
    plot(electric[i:j, 7], xlab="", ylab="Energy sub metering", type="l", xaxt="n", xlim=c(-1,3001))
    lines(electric[i:j, 8],col="red")
    lines(electric[i:j, 9],col="blue")
    axis(1, seq(0, 3000, length=3), c("Thu", "Fri", "Sat"))
    legend("topright", colnames(electric)[7:9], lwd=1, col=c("black", "red", "blue"), bty="n", cex=.9)
    
    screen(4)
    plot(electric[i:j, 4], xlab="datetime", ylab="Global_reactive_power", type="l", xaxt="n", xlim=c(-1,3001))
    axis(1, seq(0, 3000, length=3), c("Thu", "Fri", "Sat"))
    
    close.screen(all = TRUE)
    
  }
  
  savePlot1 <- function()
  {
    png("plot4.png", width=480, height=480)
  }
  
  savePlot2 <- function()
  {
    invisible(dev.off())
  }
  
  collect <- collectData()
  plotData(i = collect$i, j = collect$j, electric = collect$electric)
  savePlot1()
  plotData(i = collect$i, j = collect$j, electric = collect$electric)
  savePlot2()
  
  if (info) message(paste("Plot saved: ", getwd(), sep=""))
}
