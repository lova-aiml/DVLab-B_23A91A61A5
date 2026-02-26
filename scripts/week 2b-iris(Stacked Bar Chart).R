data(iris)
?iris
#Inspect the data
head(iris)
str(iris)
View(iris)
class(iris)
#very basic bar chart(chart R)
#count of each species

barplot(table(iris$Species))

#labeled bar chart
barplot(
  table(iris$Species),
  main = "Count of Iris Species",
  xlab = "Species",
  ylab = "Number of Flowers",
  col = "pink"
)

#Bar chart from aggregated data
#mean sepal length per species
mean_sepal <- tapply(iris$Sepal.Length, iris$Species, mean)
mean_sepal

barplot(
  mean_sepal,
  col = 'blue',
  main = "Average sepal Length by Species",
  ylab = "Mean Sepal Length"
)

#Grouped (CLUSTERED) BAR CHART 

#compare sepal and petal length(mean)

group_means <- rbind(
  Sepal = tapply(iris$Sepal.Length, iris$Species,mean),
  Petal = tapply(iris$Petal.Length, iris$Species,mean)
)
group_means

group_means <- rbind(
  Sepal_l = tapply(iris$Sepal.Length, iris$Species,mean),
  Sepal_w = tapply(iris$Sepal.Width, iris$Species,mean),
  Petal_l = tapply(iris$Petal.Length, iris$Species,mean),
  Petal_w = tapply(iris$Petal.Width, iris$Species,mean)
)
#group_means
barplot(
  group_means,
  beside = TRUE,
  col = c("yellow", "blue"),
  legend.text = TRUE,
  main = "Grouped Bar chart: Sepal vs Petal Length"
)

#Stacked bar chart
barplot(
  group_means,
  beside = FALSE,
  col = c("yellow", "blue"),
  legend.text = TRUE,
  main = "Stacked Bar chart: Sepal vs Petal Length"
)

# Load ggplot2
library(ggplot2)


# Count bar chart
ggplot(iris, aes(x = Species)) +
  geom_bar()
# ggplot counts automatically


# LAYER 7: STYLED BAR CHART (ggplot2)
ggplot(iris, aes(x = Species)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Distribution of Iris Species",
    y = "Count"
  ) +
  theme_minimal()


# LAYER 8: BAR CHART WITH AGGREGATION (ggplot2)

# Mean Sepal Length per Species
ggplot(iris, aes(x = Species, y = Sepal.Length)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    fill = "orange"
  ) +
  labs(
    title = "Mean Sepal Length by Species",
    y = "Mean Sepal Length"
  ) +
  theme_minimal()
# stat_summary() performs aggregation



# LAYER 9: GROUPED BAR CHART (ggplot2)
ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar(position = "dodge") +
  theme_minimal()

# Or with aggregated values:
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = "dodge"
  ) +
  theme_minimal()
# Easy comparison across categories


# LAYER 10: STACKED BAR CHART (ggplot2)
# Count-based stacked bar chart
ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar(position = "stack") +
  theme_minimal()


# Stacked bar with another categorical variable (example)
ggplot(iris, aes(x = Species, fill = cut(Sepal.Length,50))) +
  geom_bar(position = "stack") +
  labs(fill = "Sepal Length Group") +
  theme_minimal()
# Shows sub-category composition



# Or with aggregated values:
library(tidyr)

iris_long <- pivot_longer(
  iris,
  cols = c(Sepal.Length, Petal.Length),
  names_to = "Measurement",
  values_to = "Value"
)

# Plot
ggplot(iris_long, aes(x = Species, y = Value, fill = Measurement)) +
  stat_summary(
    fun = mean,
    geom = "bar",
    position = "stack"
  ) +
  labs(
    title = "Stacked Bar Chart of Mean Measurements (Iris)",
    y = "Mean Value"
  ) +
  theme_minimal()