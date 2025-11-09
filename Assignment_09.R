Blogger: https://austincurtis4370.blogspot.com/2025/10/module-9-visualization-in-r-base.html

# Setup & Data
data("iris", package = "datasets")
head(iris)

df <- iris


# Base R Graphics

# Scatterplot:
species_cols <- c(setosa = "steelblue", versicolor = "orange", virginica = "forestgreen")
plot(df$Sepal.Length, df$Sepal.Width,
     main = "Base: Sepal.Width vs Sepal.Length",
     xlab = "Sepal Length", ylab = "Sepal Width",
     col = species_cols[df$Species], pch = 19)
legend("topright", legend = levels(df$Species),
       col = species_cols, pch = 19, bty = "n")

# Histogram:
hist(df$Petal.Length,
     main = "Base: Distribution of Petal Length",
     xlab = "Petal Length")


# Lattice Graphics
library(lattice)

# Conditional scatter (small multiples)
xyplot(Sepal.Width ~ Sepal.Length | Species,
       data = df,
       main = "Lattice: Sepal.Width vs Sepal.Length by Species",
       pch = 16)

# Box-and-whisker plot:
bwplot(Petal.Length ~ Species,
       data = df,
       main = "Lattice: Petal Length by Species")


# ggplot2
library(ggplot2)

# Scatter plot with smoothing
ggplot(df, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: Sepal.Width vs Sepal.Length with Linear Trend")

# Faceted histogram:
ggplot(df, aes(Petal.Length)) +
  geom_histogram(binwidth = 0.2) +
  facet_wrap(~ Species) +
  labs(title = "ggplot2: Petal Length Distribution by Species",
       x = "Petal Length", y = "Count")
