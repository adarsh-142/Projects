# ETL Data Analysis with Dashboard Visualization (ongoing)
## Introduction
This project utilizes multiple synthetic tables that all represent aspects of sales made by a ficitional coffee company over a 43-month period across UK, USA and Ireland. The goal behind the project is to identify which coffee bean type amongst Arabica, Excelsa, Robust, Liberica yields the most profitable products through the sales made. An emphasis is made on answering the question while portraying various visualizations pertaining to each coffee and each country in a Sales Dashboard analysis.<br><br>
## Dataset Analysis
### customers.csv
- Dimensions: 9 Columns | 1000 Rows<br><br>
- Synopsis: This dataset represents each and every customer involved in sales.
- Dataset Description<br><br>
  - Customer ID: Serves as an identifier for each customer involved in sales
  - Customer Name: Name of each customer involved
  - Email: Email ID of each customer involved
  - Phone Number: Phone Number of each customer involved
  - Address Line: Address where the customer lives
  - City: City of residence
  - Country: Country of residence
  - Postcode: Postcode of residence
  - Loyalty Card(Yes/No): Whether the customer is a loyalty card holder or not.
- Columns with Null Values: Email, Phone Number
- Columns with Other Inconsistencies: Postcode(Multiple Data Types)<br><br>

### orders.csv
- Dimensions: 13 Columns | 1000 Rows<br><br>
- Synopsis: This dataset represents each and every order involved in sales.
- Dataset Description<br><br>
  - Order ID: Serves as an identifier for each order involved in sales
  - Order Date: The date at which the order is made
  - Customer ID: Serves as an identifier for each customer involved in sales
  - Product ID: Serves as an identifier for each product involved in sales
  - Quantity: Quantity of Product ordered
  - Customer Name: Name of each customer involved
  - Email: Email ID of each customer involved
  - Country: Country of residence
  - Coffee Type: Type of coffee bean used in the product
  - Roast Type: Level of coffee roast
  - Size: Size of Product
  - Unit Price: Unit Price of Product
  - Sales: Sales made through a particular order
- Columns with Null Values: Customer Name, Email, Country, Coffee Type, Roast Type, Size, Unit Price, Sales
- Columns with Other Inconsistencies: N/A<br><br>

### products.csv
- Dimensions: 7 Columns | 48 Rows<br><br>
- Synopsis: This dataset represents the products that were sold.
- Dataset Description<br><br>
  - Product ID: Serves as an identifier for each product involved in sales
  - Coffee Type: Type of coffee bean used in the product
  - Roast Type: Level of coffee roast
  - Size: Size of Product
  - Unit Price: Unit Price of Product
  - Price per 100g: Price per 100 grams of the product
  - Profit: Profit made through each product
- Columns with Null Values: N/A
- Columns with Other Inconsistencies: N/A<br><br>

### Summary
The orders table is set to be the main table as it has 8 null columns which are filled in other tables that act as dimension tables to the orders table. Product ID and Customer ID are foreign keys in this table and can be used to join all three tables to create a main table for further analysis. The Sales column is to be computed as it does not exist in any other table. This can be done by multiplying Quantity and Unit Price.<br><br>
While the products table has clean data, the same cannot be said for the customers table as the Email and Phone Number columns have a fair amount of null values. This can be explained through the assumption that certain customers may not enter either of this during registration. Another issue that was found in the customers table was inconsistencies within data types of the contents within the Postcode column of the customer table detected through Microsoft Excel.<br><br>

## Execution of Steps
### Excel
- Step 1: Extracted tables from Kaggle.
- Step 2: Uploaded tables into a single .xlsx file (Coffee_Data_v1.xlsx).
- Step 3: Employed data transformation using Power Query on Excel to deal with data inconsistencies, namely Postcode column (consists both numerical and string-based based codes, causing conflicting data types)
- Step 4: Saved a second .xlsx file to be imported to Microsoft SQL Server (Coffee_Data_V2.xlsx).
### SQL
- Step 5: Noted presence of tables in a database after importing .xlsx file.
- Step 6: Accessed the tables from the database using SELECT queries.
- Step 7: Employed a COMMON TABLE EXPRESSION (CTE) to incorporate an INNER JOIN between customers and orders, to obtain accurate orders made by each customer while excluding the null columns from the orders table and, to then employ LEFT JOIN on the CTE and products to obtain matching records and all the data from the CTE.
- Step 8: Added SALES column back to the main table using ALTER TABLE with the DECIMAL data type.
- Step 9: Altered Quantity column to INT to remove decimal points as quantities are normally whole.
- Step 10: Altered Unit Price column to DECIMAL.
- Step 11: Set Sales column values to the multiplied value of Quantity and Unit Price using UPDATE query.
- Step 12: Dropped Email and Phone Number columns as it has null values using ALTER TABLE and DROP.
- Step 13: Deabbreviated values using UPDATE query in Coffee Type and Roast Type columns to make better sense of the values within.
- Step 14: Loaded the table to a .csv file before loading it to Microsoft Power BI (Coffee_Data_v3.csv).
### Power BI
- Step 15: Facilitated the use of slicers based on Country and Coffee Type to filter graphical data representations.
- Step 16: Implemented the use of KPI visuals to portray numerical statistics regarding certain sales metrics using DAX queries.
- Step 17: Implemented a horizontal bar chart to visualize average sales contributed by cities across the countries listed, subject to changes due to both slicers.
- Step 18: Implemented a time series line graph to portray the monthly gross sales made by a coffee type across the recorded time period, subject to changes due to both slicers.
- Step 19: Visualized a vertical bar chart to visualize the customer preference with regards to the roast type based on presence of loyalty card or not, subject to change due to both slicers.
- Step 20: Engineered two gauge charts analyzing both sales and inventory turnovers based on coffee type with a fictional target threshold set at 900 for units sold and 11.28K for sales volume, subject to change due to both slicers.
