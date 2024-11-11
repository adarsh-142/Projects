-- Previewing Customers Table
SELECT * FROM customers;

-- Previewing Orders Table
SELECT * FROM orders;

-- Previewing Products Table
SELECT * FROM products;

-- Joining all tables
WITH CTE1 AS (
SELECT o.[Order ID], o.[Order Date], u.[Customer ID], u.[Customer Name], u.Email, u.[Phone Number], u.[Address Line 1], u.City, u.Country, u.Postcode, u.[Loyalty Card], o.[Product ID], o.Quantity
FROM orders o INNER JOIN customers u 
ON o.[Customer ID] = u.[Customer ID]
)
SELECT c.[Order ID], c.[Order Date], c.[Customer ID], c.[Customer Name], c.Email, c.[Phone Number], c.[Address Line 1], c.City, c.Country, c.Postcode, c.[Loyalty Card], p.[Product ID], p.[Coffee Type], p.[Roast Type], c.Quantity, p.Size, p.[Unit Price], p.[Price per 100g], p.Profit
INTO Coffee_Data
FROM CTE1 c LEFT JOIN products p
ON c.[Product ID] = p.[Product ID]

-- Getting Data from Coffee_Data
SELECT * FROM Coffee_Data;

-- Creating a new Column
ALTER TABLE Coffee_Data
ADD Sales DECIMAL(7, 3);

-- Changing Datatypes
ALTER TABLE Coffee_Data
ALTER COLUMN Quantity INT;

-- Changing Datatypes
ALTER TABLE Coffee_Data
ALTER COLUMN [Unit Price] DECIMAL(5, 3);

--Updating Sales
UPDATE Coffee_Data
SET Sales = Quantity * [Unit Price];

--Dropping Email Column
ALTER TABLE Coffee_Data
DROP COLUMN Email;

--Dropping Phone Number Column
ALTER TABLE Coffee_Data
DROP COLUMN [Phone Number];

--Updating Coffee Type
UPDATE Coffee_Data
SET [Coffee Type] = (CASE 
WHEN [Coffee Type] = 'Rob' THEN 'Robust'
WHEN [Coffee Type] = 'Exc' THEN 'Excelsa'
WHEN [Coffee Type] = 'Ara' THEN 'Arabica'
WHEN [Coffee Type] = 'Lib' THEN 'Liberica'
ELSE [Coffee Type] END)

--Updating Roast Type
UPDATE Coffee_Data
SET [Roast Type] = (CASE 
WHEN [Roast Type] = 'L' THEN 'Light'
WHEN [Roast Type] = 'M' THEN 'Medium'
WHEN [Roast Type] = 'D' THEN 'Dark'
ELSE [Roast Type] END)