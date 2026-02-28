
# Load the built-in dataset
data(airquality)

# Check structure of dataset
class(airquality)
str(airquality)
ozone_clean <- as.numeric(na.omit(airquality$Ozone))


# 1. Basic Bar Plot 
barplot(
  ozone_clean,
  col = "lightblue",
  main = "Bar Plot of Ozone Values (NA Removed)",
  xlab = "Observation Index",
  ylab = "Ozone (ppb)"
)

#Calculate Monthly Mean Ozone
mean_ozone <- tapply(
  airquality$Ozone,
  airquality$Month,
  mean,
  na.rm = TRUE
)

# Bar plot of average monthly ozone
barplot(
  mean_ozone,
  col = "red",
  main = "Average Monthly Ozone Concentration",
  xlab = "Month",
  ylab = "Mean Ozone (ppb)"
)


#Calculate Monthly Mean Solar Radiation
mean_solar <- tapply(
  airquality$Solar.R,
  airquality$Month,
  mean,
  na.rm = TRUE
)

# Create Matrix for Grouped & Stacked Charts
group_means <- rbind(mean_ozone, mean_solar)


# Grouped Bar Chart
barplot(
  group_means,
  beside = TRUE,
  col = c("blue", "orange"),
  legend.text = c("Ozone", "Solar Radiation"),
  main = "Grouped Bar Chart: Ozone vs Solar Radiation",
  xlab = "Month",
  ylab = "Average Value"
)

# Stacked Bar Chart
barplot(
  group_means,
  beside = FALSE,
  col = c("blue", "orange"),
  legend.text = c("Ozone", "Solar Radiation"),
  main = "Stacked Bar Chart: Ozone vs Solar Radiation",
  xlab = "Month",
  ylab = "Average Value"
)

