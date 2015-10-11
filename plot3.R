png("plot3.png", width = 480, height = 480)
ylimits = range(c(power_household$Sub_metering_1, power_household$Sub_metering_2, power_household$Sub_metering_3))
plot(power_household$DateTime, power_household$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
par(new = TRUE)
plot(power_household$DateTime, power_household$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
par(new = TRUE)
plot(power_household$DateTime, power_household$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       #bg = "transparent",
       #bty = "n",
       lty = c(1,1,1),
       col = c("black", "red", "blue")
)
dev.off()