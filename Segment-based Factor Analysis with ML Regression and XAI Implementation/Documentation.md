# Hospital Inpatient Discharge Analysis

This project analyzes a dataset containing hospital inpatient discharge records. The primary objective is to clean and preprocess the data for further analysis, including handling missing values, converting variables, removing outliers, and conducting statistical tests.

## Project Overview

The dataset contains information about hospital admissions, including details such as length of stay, diagnosis codes, procedures, and charges. This project focuses on data cleaning, normalization, and statistical analysis, with the final goal of splitting the data based on admission types (elective and emergency).

## Libraries Used

- `pandas`: For data manipulation and cleaning
- `matplotlib`: For visualizing missing data and outliers
- `scipy.stats`: For performing statistical tests (e.g., T-test)
- `sklearn`: For anomaly detection using the Isolation Forest algorithm

## Steps

1. **Data Importing & Exploration**
   - The dataset is loaded using `pandas.read_csv()`.
   - The first 100 rows are displayed to get an overview of the data.
   
2. **Data Cleaning**
   - Convert specific columns (e.g., `float64` columns) to integer types.
   - Handle missing values using various strategies, including:
     - Dropping rows with missing values in critical columns.
     - Visualizing missing data.
   
3. **Handling Outliers**
   - The IQR method is used to identify outliers in the `Total Charges` column.
   - Anomaly detection is applied using the `IsolationForest` algorithm.

4. **Normalization and Conversion**
   - Normalize the `Zip Code - 3 digits` column to eliminate unnecessary decimal points and correct incorrect entries.
   - Convert `Length of Stay` from categorical to numerical format for regression analysis.

5. **Statistical Analysis**
   - A T-test is performed to compare the means of `Length of Stay` between elective and emergency admissions to determine if the differences are statistically significant.

6. **Data Splitting**
   - The dataset is split into two subgroups: **Elective** and **Emergency** admissions.
   - These subgroups are saved into separate CSV files for further analysis.
