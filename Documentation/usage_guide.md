# Repository Usage Guide

This guide demonstrates how to effectively use our repository structure for R lab work.

## Directory Usage Examples

### 1. Working with Tasks

```r
# File: Tasks/Lab1_DataAnalysis.R

# Import required libraries
library(tidyverse)
library(ggplot2)

# Read data from Data/Raw
raw_data <- read.csv("Data/Raw/dataset.csv")

# Process data and save to Data/Processed
processed_data <- clean_data(raw_data)
write.csv(processed_data, "Data/Processed/clean_dataset.csv")

# Create and save plots
ggplot(processed_data, aes(x = variable1, y = variable2)) +
  geom_point() +
  theme_minimal()
ggsave("Plots/scatter_analysis.png")

# Save results
results <- analyze_data(processed_data)
saveRDS(results, "Data/Processed/analysis_results.rds")
```

### 2. Organizing Data

```plaintext
Data/
├── Raw/                   # Original data files
│   ├── lab1_data.csv     # Data for Lab 1
│   └── survey_data.xlsx  # Survey responses
└── Processed/            # Cleaned/transformed data
    ├── clean_lab1.csv   # Processed Lab 1 data
    └── results.rds      # Analysis results
```

### 3. Managing Plots

```plaintext
Plots/
├── Lab1/                # Organize plots by lab/task
│   ├── scatter.png     # Scatter plots
│   └── histogram.png   # Distribution plots
└── Lab2/
    └── analysis.png    # Other visualizations
```

## Best Practices

1. **File Naming Conventions**
   - Use descriptive names: `Lab1_DataAnalysis.R`
   - Avoid spaces, use underscores: `clean_data.csv`
   - Include date if relevant: `2025_03_analysis.R`

2. **Data Management**
   - Always keep raw data unchanged in `Data/Raw/`
   - Save processed data in `Data/Processed/`
   - Document data transformations in your scripts

3. **Code Organization**
   ```r
   # Scripts/helper_functions.R
   clean_data <- function(data) {
     # Data cleaning logic
   }
   
   analyze_data <- function(data) {
     # Analysis logic
   }
   ```

4. **Git Workflow**
   ```bash
   # Before starting work
   git pull                    # Get latest changes

   # After making changes
   git add Tasks/Lab1_Analysis.R
   git add Data/Processed/clean_data.csv
   git add Plots/Lab1/analysis.png
   git commit -m "Add Lab 1 analysis with plots"
   git push
   ```

## Example Workflow

1. **Starting a New Lab Task**
   ```r
   # 1. Create a new R script in Tasks/
   # Tasks/Lab1_Analysis.R
   
   # 2. Source helper functions
   source("Scripts/helper_functions.R")
   
   # 3. Create output directories if needed
   dir.create("Plots/Lab1", recursive = TRUE)
   
   # 4. Read and process data
   data <- read.csv("Data/Raw/input.csv")
   
   # 5. Save outputs in appropriate folders
   write.csv(results, "Data/Processed/results.csv")
   ggsave("Plots/Lab1/visualization.png")
   ```

2. **Collaborating with Team Members**
   - Pull latest changes before starting work
   - Use clear commit messages
   - Document your code
   - Update README.md if adding new features

## Tips for RStudio Integration

1. Set working directory to repository root:
   ```r
   setwd("path/to/R_Lab_Work")
   ```

2. Use relative paths from repository root:
   ```r
   # Good
   data <- read.csv("Data/Raw/dataset.csv")
   
   # Avoid
   data <- read.csv("C:/absolute/path/dataset.csv")
   ```

3. Use RStudio Projects:
   - Create a new project in the repository folder
   - RStudio will maintain the correct working directory
   - Easier package management

## Common Issues and Solutions

1. **File Not Found Errors**
   - Check working directory: `getwd()`
   - Use relative paths from repository root
   - Verify file exists in correct location

2. **Git Conflicts**
   - Pull before starting work
   - Communicate with team members
   - Resolve conflicts carefully

3. **Large Files**
   - Keep large datasets in `.gitignore`
   - Use shared drive for big files
   - Compress data when possible

Remember to regularly commit your changes and push them to GitHub to maintain a clean and organized repository!
