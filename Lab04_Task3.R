install.packages("ggplot2")

# Load the library
library(ggplot2)

# Create a basic scatterplot: Sepal.Length vs Petal.Length from iris dataset
ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point() +
  ggtitle("Scatterplot of Sepal Length vs Petal Length")


# Install and load dplyr
install.packages("dplyr")
library(dplyr)

# Filter rows for species 'setosa' and arrange by Sepal.Length
filtered_data <- iris %>%
  filter(Species == "setosa") %>%
  arrange(Sepal.Length)

# View result
print(filtered_data)


# Install and load tidyr
install.packages("tidyr")
library(tidyr)

# Create a sample wide-format dataset
wide_data <- data.frame(
  Name = c("Alice", "Bob"),
  Math = c(90, 85),
  Science = c(88, 92)
)

# Pivot from wide to long format
long_data <- pivot_longer(wide_data, cols = c(Math, Science), names_to = "Subject", values_to = "Score")
print(long_data)

# Pivot back from long to wide
wide_again <- pivot_wider(long_data, names_from = Subject, values_from = Score)
print(wide_again)


# Install and load data.table
install.packages("data.table")
library(data.table)

# Create a sample data table
dt <- data.table(
  Student = c("Alice", "Bob", "Alice", "Bob"),
  Subject = c("Math", "Math", "Science", "Science"),
  Score = c(90, 85, 88, 92)
)

# Simple aggregation: average score by student
avg_scores <- dt[, .(Average_Score = mean(Score)), by = Student]
print(avg_scores)

# Aggregation by subject
avg_subject <- dt[, .(Average_Score = mean(Score)), by = Subject]
print(avg_subject)



