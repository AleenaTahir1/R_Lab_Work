install.packages(c("lubridate", "rvest", "caret", "zoo", "xts", "ggplot2", "dplyr"))
# Load required packages
library(lubridate)
library(rvest)
library(caret)
library(zoo)
library(xts)
library(ggplot2)
library(dplyr)

# -------------------------------
# 1. Date Parsing and Formatting (lubridate)
# -------------------------------
dates <- c("2025-03-18", "18-03-2025", "March 18, 2025", "03/18/25")
parsed_dates <- parse_date_time(dates, orders = c("ymd", "dmy", "B d, Y", "mdy"))
formatted_dates <- format(parsed_dates, "%A, %d %B %Y")
print(formatted_dates)

# -------------------------------
# 2. Web Scraping (rvest)
# -------------------------------
# Example: Scraping book titles from a dummy site
url <- "http://books.toscrape.com/"
webpage <- read_html(url)

titles <- webpage %>%
  html_nodes(".product_pod h3 a") %>%
  html_attr("title")

print("Sample Book Titles Scraped:")
print(head(titles))

# -------------------------------
# 3. Classification using caret
# -------------------------------
# Use iris dataset
data(iris)

# Split data
set.seed(123)
train_index <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[train_index, ]
test_data <- iris[-train_index, ]

# Train model
model <- train(Species ~ ., data = train_data, method = "rpart")  # Decision tree
print(model)

# Predict
pred <- predict(model, test_data)
conf_mat <- confusionMatrix(pred, test_data$Species)
print(conf_mat)

# -------------------------------
# 4. Time-Series Visualization (xts + zoo)
# -------------------------------
# Generate sample time-series data
dates <- seq(as.Date("2024-01-01"), by = "day", length.out = 100)
values <- cumsum(rnorm(100))
ts_zoo <- zoo(values, order.by = dates)
ts_xts <- as.xts(ts_zoo)

# Plot using base plot
plot(ts_xts, main = "Sample Time-Series Plot", col = "blue", major.ticks = "months")

# Save model summary and confusion matrix to a text file
sink("ML_results.txt")
cat("---- Decision Tree Model Summary ----\n")
print(model)

cat("\n\n---- Confusion Matrix ----\n")
print(conf_mat)

sink()



library(lubridate)
library(rvest)

# Open connection to text file
sink("Data_Analysis/Task4_results.txt")

# -------------------------------
# 1. Date Parsing and Formatting (lubridate)
# -------------------------------
dates <- c("2025-03-18", "18-03-2025", "March 18, 2025", "03/18/25")
parsed_dates <- parse_date_time(dates, orders = c("ymd", "dmy", "B d, Y", "mdy"))
formatted_dates <- format(parsed_dates, "%A, %d %B %Y")

cat("Formatted Dates:\n")
print(formatted_dates)

# -------------------------------
# 2. Web Scraping (rvest)
# -------------------------------
url <- "http://books.toscrape.com/"
webpage <- read_html(url)

titles <- webpage %>%
  html_nodes(".product_pod h3 a") %>%
  html_attr("title")

cat("\nSample Book Titles Scraped:\n")
print(head(titles))

# Close file connection
sink()


