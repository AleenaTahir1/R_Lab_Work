# --------------------------------------------
# 1. Basic Descriptive Statistics
# --------------------------------------------

# Numeric vector
num_vector <- c(10, 20, 15, 25, 30, 25, 20)

# Mean
mean_val <- mean(num_vector)
cat("Mean:", mean_val, "\n")

# Median
median_val <- median(num_vector)
cat("Median:", median_val, "\n")

# Mode function (R doesn't have a built-in mode function)
get_mode <- function(v) {
  uniq_vals <- unique(v)
  uniq_vals[which.max(tabulate(match(v, uniq_vals)))]
}
mode_val <- get_mode(num_vector)
cat("Mode:", mode_val, "\n")

# --------------------------------------------
# 2. Sequence & Sum of Even Numbers
# --------------------------------------------

# Generate sequence 1 to 100
seq_100 <- 1:100

# Sum of even numbers
sum_even <- sum(seq_100[seq_100 %% 2 == 0])
cat("Sum of even numbers from 1 to 100:", sum_even, "\n")

# --------------------------------------------
# 3. paste() Function - Concatenate Strings
# --------------------------------------------

str1 <- "Hello"
str2 <- "World"
str3 <- "R Language"

# Using paste with a separator
result_string <- paste(str1, str2, str3, sep = " - ")
cat("Concatenated string:", result_string, "\n")

# --------------------------------------------
# 4. Matrix Operations
# --------------------------------------------

# Create a 3x3 matrix
mat <- matrix(c(2, 4, 6, 1, 3, 5, 7, 8, 9), nrow = 3, byrow = TRUE)
cat("Matrix:\n")
print(mat)

# Transpose
transpose_mat <- t(mat)
cat("Transposed Matrix:\n")
print(transpose_mat)

# Determinant
det_mat <- det(mat)
cat("Determinant of Matrix:", det_mat, "\n")

# Inverse (only if determinant ≠ 0)
if (det_mat != 0) {
  inverse_mat <- solve(mat)
  cat("Inverse of Matrix:\n")
  print(inverse_mat)
} else {
  cat("Matrix is singular, inverse does not exist.\n")
}
