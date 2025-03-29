# Install and load the datasets package (contains built-in datasets)
install.packages("datasets")
library(datasets)

# Load the iris dataset
data_iris <- iris

# Display the first few rows of the dataset
head(data_iris)

# Remove rows with missing values (if any)
clean_data <- na.omit(data_iris)

# Install and load dplyr for data manipulation
install.packages("dplyr")
library(dplyr)

# Filter rows where Sepal.Length is greater than 5
filtered_data <- data_iris %>% filter(Sepal.Length > 5)

# Select specific columns
selected_data <- data_iris %>% select(Sepal.Length, Sepal.Width, Species)

# Group data by species and calculate the mean sepal length
summary_data <- data_iris %>%
  group_by(Species) %>%
  summarize(mean_sepal_length = mean(Sepal.Length, na.rm = TRUE))

# Print the summarized data
print(summary_data)

# Create a new column 'Petal.Area' (Petal.Length * Petal.Width)
transformed_data <- data_iris %>% mutate(Petal.Area = Petal.Length * Petal.Width)

# Install and load ggplot2 for data visualization
install.packages("ggplot2")
library(ggplot2)

# Create a bar plot for Sepal Length by Species
ggplot(data_iris, aes(x = Species, y = Sepal.Length)) +
  geom_bar(stat = "identity") +
  labs(title = "Sepal Length by Species", x = "Species", y = "Sepal Length")

# Create a scatter plot for Sepal.Length vs Petal.Length
ggplot(data_iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  labs(title = "Scatter Plot of Sepal vs Petal Length", x = "Sepal Length", y = "Petal Length")

# Install and load plotly for interactive plots
install.packages("plotly")
library(plotly)

# Create an interactive scatter plot
plot_ly(data = data_iris, x = ~Sepal.Length, y = ~Petal.Length, type = "scatter", mode = "markers", color = ~Species)

# Save the bar chart as an image file
ggsave("iris_bar_chart.png")

# Create a linear model to predict Sepal.Length using Petal.Length
model <- lm(Sepal.Length ~ Petal.Length, data = data_iris)

# Display model summary
summary(model)

# Perform K-means clustering with 3 clusters on Sepal measurements
clusters <- kmeans(data_iris[, c("Sepal.Length", "Sepal.Width")], centers = 3)

# Add cluster labels to the dataset
data_iris$cluster <- clusters$cluster

# Install and load caret for machine learning
install.packages("caret")
library(caret)

# Train a random forest model to predict species
model <- train(Species ~ ., data = data_iris, method = "rf", trControl = trainControl(method = "cv", number = 5))

# Print model details
print(model)

# Plot Sepal Length vs Sepal Width
plot(data_iris$Sepal.Length, data_iris$Sepal.Width)

# Save cleaned data to a CSV file
write.csv(clean_data, "cleaned_iris_data.csv")
