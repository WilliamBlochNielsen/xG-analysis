# Predicting Next-Season Player Goals in the Premier League

This project investigates the predictive power of **Expected Goals (xG)** and **Previous Season Goals** for forecasting a player's goal-scoring performance in the following season. Using Premier League data from the 2014-15 to 2019-20 seasons, the analysis determines whether xG or past goals is a better predictor of future performance.

---

## Features

- **Data Preparation**:
  - Combines datasets for six Premier League seasons.
  - Filters players with valid consecutive seasons for analysis.
  - Adds necessary columns for **Expected Goals** and **Previous Season Goals** modeling.

- **Analysis**:
  - Two predictive models are built:
    1. Using Expected Goals (xG) to predict next-season goals.
    2. Using Previous Season Goals to predict next-season goals.

- **Visualization**:
  - Generates scatter plots to compare:
    - **Expected Goals vs. Next Season Goals**.
    - **Previous Season Goals vs. Next Season Goals**.

- **Evaluation**:
  - Calculates **Root Mean Square Error (RMSE)** for both models to measure prediction accuracy.

---

## Installation Guide

1. **Clone the Repository**:
   ```bash
   [git clone https://github.com/YourUsername/PL-Goals-Prediction.git](https://github.com/WilliamBlochNielsen/xG-analysis.git)
 ``` 
