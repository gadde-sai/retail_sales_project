# Retail Sales Analysis Through SQL - Project

## Project Overview

**Project Title**: Retail Sales Analysis   
**Database**: `sql_p1`

My project  demonstrates SQL skills and techniques typically used for data analysis to explore, clean, and analyze the  retail sales data. My project involves setting up a retail sales table, performing exploratory data analysis (EDA), and answering specific business questions through the SQL queries.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.


### 1. QUERRIES

```sql

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:
**to check now how many sales we have**:
```sql
SELECT COUNT(*) AS total_no_sales FROM retail_sales;
```
**to check how many unique customers we having with customer_id**
```sql
SELECT COUNT(DISTINCT customer_id) AS total_no_uniq_cust FROM retail_sales;
```
**to check distinct categories**
```sql
SELECT DISTINCT category  AS category_det FROM retail_sales;
```


1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'

```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
SELECT * FROM retail_sales
WHERE
category='Clothing'
AND
TO_CHAR(sale_date , 'YYYY-MM')='2022-11'
AND
quantiy >=4
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
SELECT category,
       SUM(total_sale) as net_sale,
	   COUNT(*) as total_orders
	   FROM retail_sales
	   GROUP BY 1
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
SELECT 
    AVG(age) AS avg_age
	 FROM retail_sales
	 WHERE category='beauty'
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
SELECT * FROM retail_sales
WHERE total_sale > 1000
```

6. **write a sql query to display transactions where price per unit is less than 100.**:
```sql
SELECT * FROM retail_sales
WHERE 
   price_per_unit <=100
```

7. **write a sql queryto find total no of transactions made by each gender in each category**:
```sql
SELECT category,gender,
       COUNT(*) AS total_trans
	   FROM retail_sales
GROUP BY
category,
gender
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
SELECT 
 customer_id,
 SUM(total_sale) AS total_sales
 FROM retail_sales
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 5
```

9. **write a query to find the avg quantity bought under electronic category**:
```sql
SELECT category,
       AVG(quantiy) AS avg_quan_bought
	   FROM retail_sales
	   WHERE category='Electronics'
	   GROUP BY 1
```

10. **write a query to find how many males use beauty products**:
```sql
SELECT category,
       SUM(total_sale) AS total_sales
	   FROM retail_sales
	   WHERE category='Beauty'
	   GROUP BY category
```
11. **write a query to find how many males use beauty products**:
    ```sql
    SELECT category,
       COUNT(gender) as no_of_males
	   FROM retail_sales
	   WHERE 
	   category='Beauty'
	   AND
	   gender='Male'
	   GROUP BY category
    ```
    

## Findings

- **Customer info**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
-**Transactions data**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Customer Insights**: The analysis identifies  most popular product categories.

## Conclusion

In conclusion my project demonstates some basic SQL querries application on real time 
data sets , through which I gained some insights on how to analyse a real - time data 
set.

## linkedIn url
- **LinkedIn**: [Connect with me on LinkedIn](https://www.linkedin.com/in/gadde-sai-spandana-b450b9301)
