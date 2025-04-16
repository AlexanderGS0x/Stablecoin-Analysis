# Stablecoin Analysis Project

## Overview
This project analyzes the stability of four stablecoins—USDT, USDC, DAI, and TUSD—using data from April 14, 2024, to April 14, 2025. The analysis includes data cleaning, statistical analysis, and interactive visualizations to assess price stability and deviations.

## Tools and Technologies
- **R**: Used for data cleaning and statistical analysis.
- **SQLite**: Used for SQL queries to explore the data.
- **Tableau Public**: Created visualizations to display the findings.

## Project Files
- `stablecoin_data_cleaned.csv`: Cleaned dataset with price, volume, and deviation data.
- `stablecoin_data_cleaning.R`: R script for data cleaning and calculating deviations.
- `sql_queries.sql`: SQL queries for data exploration.
- `stablecoin_analysis.R`: R script for statistical analysis (summary stats, volatility, t-tests).
- `summary_stats.csv`: Summary statistics for each stablecoin.
- `volatility.csv`: Volatility comparison based on standard deviation.
- `t_test_results.csv`: Results of t-tests for deviations.

## Visualizations
Check out the interactive visualizations on Tableau Public:
- [Stablecoin Analysis Visualizations](https://public.tableau.com/app/profile/alexander.gallagher/viz/StablecoinAnalysisVisualizations/Dashboard1)

## Findings
- **USDC and DAI**: Showed almost no price variation (min/max of 1.0000), possibly due to data rounding or cleaning.
- **USDT**: Remained stable with minor fluctuations (min 0.9980, max 1.0000).
- **TUSD**: Exhibited significant deviations (min 0.9920, max 1.0300), indicating potential instability.

## How to Run
1. Clone this repository: `git clone https://github.com/AlexanderGS0x/Stablecoin-Analysis.git`.
2. Install R and required libraries (e.g., `dplyr`, `stats`).
3. Run `stablecoin_data_cleaning.R` and `stablecoin_analysis.R` in R to reproduce the analysis.
4. Explore the SQL queries in `sql_queries.sql` with a SQLite database.

## Contact
For questions or collaboration, connect with me on [LinkedIn](https://www.linkedin.com/in/alexander-gallagher).
