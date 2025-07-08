--SQL project sales analysis 
--CREATE TABLE--SQL project sales analysis 
--CREATE TABLE
--PRIMARYKEY(ENSURE NO DUPLICATES)
CREATE TABLE retail_sales(
    transactions_id INT PRIMARY KEY,
	sale_date  DATE,
    sale_time TIME,
    customer_id INT ,
    gender VARCHAR(15),
    age INT, 
    category VARCHAR(25),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
--TO VIEW DATA
SELECT * FROM retail_sales;
--TO COUNT THE NO OF DATA
SELECT COUNT(*) FROM retail_sales


--TO VIEW DATA
SELECT * FROM retail_sales;

--TO COUNT THE NO OF DATA
SELECT COUNT(*) FROM retail_sales;

--to deal with data that has NULL values
SELECT * FROM retail_sales 
WHERE
    transactions_id IS NULL
	OR
	sale_date  IS NULL
	OR
    sale_time IS NULL
	OR
    customer_id IS NULL
	OR
    gender IS NULL
	OR
    age IS NULL
	OR
    category IS NULL
	OR
    quantiy IS NULL
	OR
    price_per_unit IS NULL
	OR
    cogs IS NULL
	OR
    total_sale IS NULL
	
 -- TO DELETE NULL DATA
DELETE FROM retail_sales
WHERE
     transactions_id IS NULL
	OR
	sale_date  IS NULL
	OR
    sale_time IS NULL
	OR
    customer_id IS NULL
	OR
    gender IS NULL
	OR
    age IS NULL
	OR
    category IS NULL
	OR
    quantiy IS NULL
	OR
    price_per_unit IS NULL
	OR
    cogs IS NULL
	OR
    total_sale IS NULL

--DATA EXPLORATION
--to check now how many sales we have
SELECT COUNT(*) AS total_no_sales FROM retail_sales;

--to check how many unique customers we having with customer_id
SELECT COUNT(DISTINCT customer_id) AS total_no_uniq_cust FROM retail_sales;

--to check distinct categories
SELECT DISTINCT category  AS category_det FROM retail_sales;

--DATA ANALYSIS(BUISNESS ANALYSIS)
--write a sql query to retrieve all coloumns for sales made on '2022-11-05'
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'

--write a sql query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 10 in the month of nov-2022
SELECT * FROM retail_sales
WHERE
category='Clothing'
AND
TO_CHAR(sale_date , 'YYYY-MM')='2022-11'
AND
quantiy >=4

--write a sql query to calculate total no of sales for each category
SELECT category,
       SUM(total_sale) as net_sale,
	   COUNT(*) as total_orders
	   FROM retail_sales
	   GROUP BY 1

--write a sql query to find the average age of customers who purchased items from the 'beauty' category
SELECT 
    AVG(age) AS avg_age
	 FROM retail_sales
	 WHERE category='beauty'

--write a sql query to display transactions where price per unit is less than 100
SELECT * FROM retail_sales
WHERE 
   price_per_unit <=100

--write a sql queryto find total no of transactions made by each gender in each category
SELECT category,gender,
       COUNT(*) AS total_trans
	   FROM retail_sales
GROUP BY
category,
gender

--write a sql query to find top 5 customers based on the highest total sales
SELECT 
 customer_id,
 SUM(total_sale) AS total_sales
 FROM retail_sales
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 5

--write a query to find the avg quantity bought under electronic category
SELECT category,
       AVG(quantiy) AS avg_quan_bought
	   FROM retail_sales
	   WHERE category='Electronics'
	   GROUP BY 1

--find the total sales generated under beauty category
SELECT category,
       SUM(total_sale) AS total_sales
	   FROM retail_sales
	   WHERE category='Beauty'
	   GROUP BY category
--write a query to find how many males use beauty products
SELECT category,
       COUNT(gender) as no_of_males
	   FROM retail_sales
	   WHERE 
	   category='Beauty'
	   AND
	   gender='Male'
	   GROUP BY category
	   
-- END OF PROJECT

