# Hospital Inpatient Discharge Analysis

This project analyzes a dataset containing hospital inpatient discharge records. The primary objective is to clean and preprocess the data for further analysis, including handling missing values, converting variables, removing outliers, and conducting statistical tests. After which, a brief EDA process is focused on the dependent variable, Length of Stay (LoS) with relationships against the other independent variables explored, which in turn gives a small glimpse into the significant factors affecting LoS for both subgroups before the modelling phase.

## Project Overview

The dataset contains information about hospital admissions, including details such as length of stay, diagnosis codes, procedures, and charges. This project focuses on data cleaning, normalization, statistical analysis, data visualizations, statistical modelling and explainable AI with the final goal centered around differences between importances of significant factors affecting LoS for elective and emergency admissions.

## Libraries Used

- `pandas`: For data manipulation and cleaning
- `matplotlib`: For data visualizations and supplementing them with further applications.
- `scipy.stats`: For performing statistical tests (e.g., T-test)
- `sklearn`: For anomaly detection using the Isolation Forest algorithm and other ML models.
- `seaborn`: For data visualizations.

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

7. **Data Overview**
   - The first 10 rows and the data types of both subgroups are displayed for initial inspection.

8. **Categorical Columns Analysis**
   - The unique number of categories for each categorical column in both subgroups are computed and printed.

9. **Length of Stay (LoS) Distribution**
   - The distribution of Length of Stay (LoS) for both elective and emergency admissions is visualized using kernel density estimates.
   - Additionally, the percentages of days for LoS are computed and displayed.

10. **Correlation Analysis Using Correlation Ratio**
   - The correlation ratio (eta squared) is used to assess the relationship between categorical variables and LoS for both subgroups. The `correlation_ratio` function calculates this for each categorical column.
   - The correlation results are displayed for both elective and emergency admissions.

11. **Pearson's Correlation Matrix**
   - A correlation matrix of numerical variables is created for both datasets, with a custom color map to indicate the strength of correlations leveraging `matplotlib.colors` and `LinearSegmentedColormap`.
   - The `correlation_matrix` function generates and visualizes the correlation matrix for both elective and emergency admissions.

12. **Data Overview**
   - The first 10 rows and the data types of both subgroups are displayed for initial inspection.
