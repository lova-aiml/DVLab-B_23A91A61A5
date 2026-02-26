#load the Dataset
AirPassengers

#Verify the Dataset
class(AirPassengers)
View(AirPassengers)

# Convert the Dataset to dataframe
ap_df <- data.frame(
  year = time(AirPassengers),
  passengers = as.numeric(AirPassengers)
)

ap_df_months <- data.frame(
  year = floor(time(AirPassengers)),
  month = cycle(time(AirPassengers)),
  passengers = as.numeric(AirPassengers)
)

ap_df_months

# Basic plot
plot(AirPassengers)

plot(AirPassengers,
     main = "AirPassengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col = "blue"
)
# Changing the Line Width
plot(AirPassengers,
     type = 'o',
     lwd = 2,
     main = "AirPassengers Trend Analysis",
     xlab = "Months",
     ylab = "No.of Passengers",
     col = "green"
)     
points(AirPassengers,
       type = 'o',
       pch = 17,
       col = "red"
)
grid()

library(ggplot2)
ggplot(ap_df,
       aes(x=year,y=passengers)
)+
  geom_line(
    col="blue",
    linewidth = 0.5)+
  labs(
    title="GGPLOT-Line Graph of AirPassengers",
    caption = "Using AirPassengers Dataset",
    subtitle = "From 1949-1960",
    x = "Months",
    y = "No.of Passengers"
  )+
  geom_point(color = 'red')+
  geom_smooth(se=FALSE, color = 'green')

