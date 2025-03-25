install.packages("rpart.plot")

# Load necessary libraries
library(dplyr)
library(ggplot2)
library(caret)
library(rpart)
library(rpart.plot)

# Load dataset
data(iris)

# Preprocess data: Convert Species to factor
iris$Species <- as.factor(iris$Species)

# Split into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(iris$Species, p=0.8, list=FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]

# Train a Decision Tree model
model <- rpart(Species ~ ., data=trainData, method="class")

# Make predictions
predictions <- predict(model, testData, type="class")

# Evaluate model performance
confMat <- confusionMatrix(predictions, testData$Species)
print(confMat)

# Visualize the decision tree
rpart.plot(model)
