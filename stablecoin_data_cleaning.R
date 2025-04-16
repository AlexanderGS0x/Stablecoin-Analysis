# Load required libraries
library(dplyr)

# Read the original CSV file (adjust the file name if needed)
data <- read.csv("stablecoin_data.csv")

# Clean the data
# Remove rows with missing values
data_cleaned <- data %>% filter_all(all_vars(!is.na(.)))

# Ensure Date is in the correct format
data_cleaned$Date <- as.Date(data_cleaned$Date, format = "%Y-%m-%d")

# Calculate Deviation (Price - 1.00)
data_cleaned <- data_cleaned %>%
  mutate(Deviation = Price - 1.00)

# Save the cleaned data
write.csv(data_cleaned, "stablecoin_data_cleaned.csv", row.names = FALSE)