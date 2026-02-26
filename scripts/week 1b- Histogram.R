airquality
class(airquality)
hist(airquality$Temp)

View(airquality)

hist(airquality$Temp,
     breaks=5,
     main= "Histogram of Air Quality",
     xlab= "Temperature",
     ylab= "Wind",
     labels = TRUE,
     col = "yellow",
     border = "purple")



library(ggplot2)
ggplot(
  airquality,
  aes(x=Temp)
)+
  geom_histogram(
    bins = 8,
    fill = "skyblue",
    col = "yellow")+
  labs(
    title= "GGPLOT- Histogram for Air Quality",
    y = "Wind" ) +
  theme_dark()