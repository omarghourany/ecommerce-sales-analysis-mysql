# 📊 E-commerce Sales 2024–2025 MySQL EDA Project

## Project Overview

This project analyzes an E-commerce Sales 2024–2025 dataset using **MySQL**. The objective is to explore sales performance, product profitability, customer purchasing behavior, regional trends, and the impact of discounts to generate actionable business insights.

This project demonstrates practical SQL skills by solving real business questions through Exploratory Data Analysis (EDA).

---

## Objectives

* Analyze overall business performance.
* Identify the best-selling products and categories.
* Discover the most valuable customers.
* Compare sales and profit across regions and cities.
* Analyze sales trends over time.
* Evaluate the impact of discounts on profitability.

---

## Dataset

The dataset contains **5,000 sales transactions** from an e-commerce business.

The dataset includes the following key fields:

* Order ID
* Order Date
* Customer Name
* Product Name
* Category
* Sub-Category
* Quantity
* Unit Price
* Discount
* Sales
* Profit
* City
* Region

---

## Data Cleaning Summary

The dataset was assessed for common data quality issues before analysis.

* No duplicate records were found.
* No missing or blank values were identified.
* No inconsistent text values or spelling issues were detected.
* No invalid numeric values were found.
* The primary key contained unique values.
* The `Order Date` column was originally stored as **TEXT** and was converted to the **DATE** data type to enable accurate date-based analysis.

---

## SQL Skills Demonstrated

* Aggregate Functions (`SUM`, `AVG`, `COUNT`, `MAX`, `MIN`)
* `GROUP BY`
* `ORDER BY`
* Common Table Expressions (CTEs)
* Window Functions

  * `RANK()`
  * `LAG()`
* `CASE`
* Date Functions
* Business KPI Calculations
* Exploratory Data Analysis (EDA)

---

## Exploratory Data Analysis (EDA)

### 1. Data Understanding

* Quantity statistics
* Unit price statistics
* Discount statistics
* Sales statistics
* Profit statistics

### 2. Data Validation

* Calculated gross revenue
* Verified the sales calculation after discount

### 3. Overall Business KPIs

* Total Orders
* Total Customers
* Total Sales
* Total Profit
* Overall Profit Margin

### 4. Product Performance

* Top-selling products
* Top product categories
* Most profitable categories
* Top-performing sub-categories

### 5. Customer Analysis

* Most valuable customers based on total sales

### 6. Geographic Analysis

* Sales by region
* Profit by region
* Sales by city
* Profit by city

### 7. Sales Trend Analysis

* Monthly best-selling products
* Yearly sales and profit
* Year-over-Year (YoY) sales growth
* Peak sales month

### 8. Discount Analysis

* Orders by discount level
* Total sales by discount
* Profit margin by discount

---

## Key Business Insights

* Home Decor generated the highest total sales.
* The North region generated the highest sales and profit.
* Profit margin declined as discount levels increased.
* May 2025 recorded the highest monthly sales.
* Sales increased by **324.37%** from 2023 to 2024.

---

## What I Learned

Through this project, I practiced:

* Writing clean and organized SQL queries.
* Structuring a complete Exploratory Data Analysis (EDA) project.
* Solving business problems using SQL.
* Applying Common Table Expressions (CTEs) and window functions to analyze business data.
* Presenting analytical findings in a clear and professional format.





# 📊 E-commerce Sales 2024–2025 MySQL EDA Project

## Project Overview

This project analyzes an E-commerce Sales 2024–2025 dataset using **MySQL**. The objective is to explore sales performance, product profitability, customer purchasing behavior, regional trends, and the impact of discounts to generate actionable business insights.

This project demonstrates practical SQL skills by solving real business questions through Exploratory Data Analysis (EDA).

---

## Objectives

* Analyze overall business performance.
* Identify the best-selling products and categories.
* Discover the most valuable customers.
* Compare sales and profit across regions and cities.
* Analyze sales trends over time.
* Evaluate the impact of discounts on profitability.

---

## Dataset

The dataset contains **5,000 sales transactions** from an e-commerce business.

The dataset includes the following key fields:

* Order ID
* Order Date
* Customer Name
* Product Name
* Category
* Sub-Category
* Quantity
* Unit Price
* Discount
* Sales
* Profit
* City
* Region

---

## Data Cleaning Summary

The dataset was assessed for common data quality issues before analysis.

* No duplicate records were found.
* No missing or blank values were identified.
* No inconsistent text values or spelling issues were detected.
* No invalid numeric values were found.
* The primary key contained unique values.
* The `Order Date` column was originally stored as **TEXT** and was converted to the **DATE** data type to enable accurate date-based analysis.

---

## SQL Skills Demonstrated

* Aggregate Functions (`SUM`, `AVG`, `COUNT`, `MAX`, `MIN`)
* `GROUP BY`
* `ORDER BY`
* Common Table Expressions (CTEs)
* Window Functions

  * `RANK()`
  * `LAG()`
* `CASE`
* Date Functions
* Business KPI Calculations
* Exploratory Data Analysis (EDA)

---

## Exploratory Data Analysis (EDA)

### 1. Data Understanding

* Quantity statistics
* Unit price statistics
* Discount statistics
* Sales statistics
* Profit statistics

### 2. Data Validation

* Calculated gross revenue
* Verified the sales calculation after discount

### 3. Overall Business KPIs

* Total Orders
* Total Customers
* Total Sales
* Total Profit
* Overall Profit Margin

### 4. Product Performance

* Top-selling products
* Top product categories
* Most profitable categories
* Top-performing sub-categories

### 5. Customer Analysis

* Most valuable customers based on total sales

### 6. Geographic Analysis

* Sales by region
* Profit by region
* Sales by city
* Profit by city

### 7. Sales Trend Analysis

* Monthly best-selling products
* Yearly sales and profit
* Year-over-Year (YoY) sales growth
* Peak sales month

### 8. Discount Analysis

* Orders by discount level
* Total sales by discount
* Profit margin by discount

---

## Key Business Insights

* Home Decor generated the highest total sales.
* The North region generated the highest sales and profit.
* Profit margin declined as discount levels increased.
* May 2025 recorded the highest monthly sales.
* Sales increased by **324.37%** from 2023 to 2024.

---

## What I Learned

Through this project, I practiced:

* Writing clean and organized SQL queries.
* Structuring a complete Exploratory Data Analysis (EDA) project.
* Solving business problems using SQL.
* Applying Common Table Expressions (CTEs) and window functions to analyze business data.
* Presenting analytical findings in a clear and professional format.

## Repository Structure

---
ecommerce-sales-mysql-eda/
│
├── README.md
├── SQL/
│   └── ecommerce_sales_eda.sql
│
└── Dataset/
    ├── ecommerce_sales_original.csv
    └── clean_ecommerce_data.csv





