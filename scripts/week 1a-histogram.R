#Accesing information about the Data set
?VADeaths
#Checking the type of Data set
class(VADeaths)
#accessing help for unknown functions or classes
help(class)
#converting given data set into data frame
va_df<-as.data.frame(VADeaths)
#checking to confirm if the data set is changed to Data frame
class(va_df)
#Creating a view of the data set in the form of a table 
View(va_df)
#Creating a new column in the data frame
va_df$AgeGroups <-row.names(VADeaths)
View(va_df)
#changing the data into "Long" Format using "reshape" function
va_long=reshape(va_df,
                direction="long",
                varying=colnames(VADeaths),
                v.names="DeathRate",
                timevar="Population",
                times=colnames(VADeaths)
)
View(va_long)
#Building a basic Histogram
#png("Basic_hist.png")
hist(va_long$DeathRate)
#dev.off()

#Changing the Title and lables
hist(va_long$DeathRate,
     main="Basic Histogram of VA Deathrates",
     xlab="VA Deathrates",
     ylab="Frequency",
     labels=TRUE)


#changing the color and border of histogram
hist(va_long$DeathRate,
     breaks=5,
     main="Basic Histogram of VA Deathrates",
     xlab="VA Deathrates",
     ylab="Frequency",
     labels=TRUE,
     col="green",
     border="red")

#Changing the Number of bins/bin-width

#Data
#Asthetics
#Geometry
#Facets
#Statsical
#Coordinates
#Themes
#Labels

library(ggplot2)
ggplot(
  va_long,
  aes(x=DeathRate)
)+
  geom_histogram(
    bins=8,
    fill="steelblue",
    col="red")+
  labs(
    title="GGPLOT-Histogram of DeathRate",
    y="Frequency")

  

