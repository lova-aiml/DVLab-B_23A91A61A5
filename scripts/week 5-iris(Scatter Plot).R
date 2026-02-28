#Load and Understand the iris Dataset
data(iris)
str(iris)
View(iris)

#Basic Scatter Plot Sepal Length vs Sepal Width
plot(iris$Sepal.Length,iris$Sepal.Width)

#Labelled Scatter plot
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  main="SepalLength vs SepalWidth",
  xlab="Sepal Length(cm)",
  ylab="Sepal Width(cm)",
  col="blue",
  pch=16
)

#Colored Scatter Plot by Species
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col=as.numeric(iris$Species),
  pch=16,
  main="Sepal Dimensions by Species"
)

legend(
  "topright",
  legend=levels(iris$Species),
  col=1.3,
  pch=16
)

#Multivariate Scatter
#Add size as a third variable
plot(
  iris$Sepal.Length,
  iris$Sepal.Width,
  col=iris$Petal.Length/max(iris$Petal.Length),
  main="Multivariate Scatter plot(color+size)"
)

#Scatter Plot Matrix
#All numerix variables against each other
pairs(
  iris[,1:4],
  col=as.numeric(iris$Species),
  pch=16,
  main="Scatter Plot Matrix of iris Dataset"
)

#Load ggplot2
library(ggplot2)

#Basic scatter plot
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+
  geom_point()

#Colored Scatter by Species
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,color = Species))+
  geom_point(size=2)+
  theme_minimal()

#Multivariate Scatter Plot
#Color + Size Encoding
ggplot(
  iris,
  aes(
    x=Sepal.Length,
    y=Sepal.Width,
    color=Species,
    size=Petal.Length
  )
)+
  geom_point(alpha=0.7)+
  theme_minimal()

#Scatter Plot Matrix
#Using GGally(extension of ggplot2)
library(GGally)


ggpairs(
  iris,
  columns=1:4,
  aes(color=Species,alpha=0.6)
)
