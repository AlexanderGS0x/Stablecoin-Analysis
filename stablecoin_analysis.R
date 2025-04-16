# Load required libraries
library(dplyr)    # For data manipulation
library(ggplot2)  # For plotting (we might use this later)
library(stats)    # For statistical tests

# Read the cleaned CSV file
data <- read.csv("stablecoin_data_cleaned.csv")

# Preview the data to make sure it loaded correctly
head(data)

# Calculate summary statistics for Price and Deviation by Coin
summary_stats <- data %>%
  group_by(Coin) %>%
  summarise(
    Mean_Price = mean(Price),
    Median_Price = median(Price),
    SD_Price = sd(Price),
    Min_Price = min(Price),
    Max_Price = max(Price),
    Mean_Deviation = mean(Deviation),
    Mean_Abs_Deviation = mean(abs(Deviation)),
    SD_Deviation = sd(Deviation),
    Min_Deviation = min(Deviation),
    Max_Deviation = max(Deviation)
  )

# Round the results to 4 decimal places for readability
summary_stats <- summary_stats %>%
  mutate(across(where(is.numeric), ~ round(.x, 4)))

# Display the summary statistics
print(summary_stats)

# Check the Price and Deviation for DAI
dai_data <- data %>% filter(Coin == "DAI")
summary(dai_data$Price)
summary(dai_data$Deviation)

# Check the Price and Deviation for USDC
usdc_data <- data %>% filter(Coin == "USDC")
summary(usdc_data$Price)
summary(usdc_data$Deviation)
  

# Check TUSD's extreme deviations
tusd_data <- data %>% filter(Coin == "TUSD")
# Find days with large deviations
tusd_extremes <- tusd_data %>% filter(abs(Deviation) > 0.005)
print(tusd_extremes)


# Extract and sort by standard deviation of Price to compare volatility
volatility <- summary_stats %>%
  select(Coin, SD_Price) %>%
  arrange(SD_Price)

# Display the volatility results
print(volatility)

# Perform a one-sample t-test for each stablecoin's Deviation
t_test_results <- data %>%
  group_by(Coin) %>%
  summarise(
    T_Statistic = t.test(Deviation, mu = 0)$statistic,
    P_Value = t.test(Deviation, mu = 0)$p.value
  ) %>%
  mutate(P_Value = round(P_Value, 4))

# Display the t-test results
print(t_test_results)

# Save the results to CSV files
write.csv(summary_stats, "summary_stats.csv", row.names = FALSE)
write.csv(volatility, "volatility.csv", row.names = FALSE)
write.csv(t_test_results, "t_test_results.csv", row.names = FALSE)
