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
- Step 1: Extracted from Kaggle into a database with Microsoft SQL Server.
- Step 2: Accesses the tables from the database using SELECT queries.
- Step 3: Employed a COMMON TABLE EXPRESSION to incorporate an INNER JOIN between 
