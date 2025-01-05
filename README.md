# Predicting Next-Season Player Goals in the Premier League

This project investigates the predictive power of **Expected Goals (xG)** and **Previous Season Goals** for forecasting a player's goal-scoring performance in the following season. Using Premier League data from the 2014-15 to 2019-20 seasons, the analysis determines whether xG or past goals is a better predictor of future performance.

---

## Overview

- **Import**:
  - Combines datasets for six Premier League seasons.
  - Ensures consistent column naming and format.

- **Wrangling**:
  - Filters players with valid consecutive seasons for analysis.
  - Adds necessary columns for **Expected Goals** and **Previous Season Goals** modeling.

- **Model**:
  - Builds two predictive models:
    1. Using Expected Goals (xG) to predict next-season goals.
    2. Using Previous Season Goals to predict next-season goals.

- **Visualize**:
  - Generates scatter plots to compare:
    - **Expected Goals vs. Next Season Goals**.
    - **Previous Season Goals vs. Next Season Goals**.

- **Evaluate**:
  - Calculates **Root Mean Square Error (RMSE)** for both models to measure prediction accuracy.

---

## Installation Guide
Clone the Repository:
   ```bash
   https://github.com/WilliamBlochNielsen/xG-analysis.git
 ```
Install required packages
```bash
install.packages(c("tidyverse", "janitor"))
```
# Important Notes on Model Results
The Expected Goals Model (xG) gave an RMSE value of 2.7
The Previous Season Goals Model gave an RMSE value of 3.2

As the RMSE value of the Expected Goals Model we can conclude that expecting goals is a better predictor of future goals than previous goals scored. 
