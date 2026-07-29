-- ECOMMERCE SALES 2024-2025 SQL EDA PROJECT
--
-- Objective:
-- Analyze sales performance, customer purchasing behavior,
-- product performance, profitability,
-- regional trends, and discount impact
-- to generate actionable business insights.

-- ============================
-- 1. DATA UNDERSTANDING
-- ============================


-- Quantity Statistics
SELECT MAX(Quantity) AS max_quantity,MIN(Quantity) AS min_quantity,AVG(Quantity) AS avg_quantity
FROM clean_ecommerce_data;


-- Unit Price Statistics
SELECT MAX(`Unit Price`) AS max_unit_price,MIN(`Unit Price`) AS min_unit_price,ROUND(AVG(`Unit Price`),2) AS avg_unit_price
FROM clean_ecommerce_data;

-- Discount Statistics
SELECT MAX(`Discount`) AS max_discount,MIN(`Discount`) AS min_discount,AVG(`Discount`) AS avg_discount
FROM clean_ecommerce_data;

-- Sales Statistics
SELECT MAX(`Sales`) AS max_sales,MIN(`Sales`) AS min_sales,ROUND(AVG(`Sales`),2) AS avg_sales
FROM clean_ecommerce_data;

-- Profit Statistics
SELECT MAX(`Profit`) AS max_profit,MIN(`Profit`) AS min_profit,round(avg(`Profit`),2) AS avg_profit
FROM clean_ecommerce_data;

-- ==================================================
-- 2. DATA VALIDATION
-- ==================================================

-- Calculate Gross Revenue
SELECT
    ROUND(SUM(Quantity * `Unit Price`), 2) AS gross_revenue
FROM clean_ecommerce_data;


-- Verify Sales Calculation
SELECT
    Quantity,
    `Unit Price`,
    Discount,
    Sales,
    ROUND(Quantity * `Unit Price`,2) AS calculated_before_discount,
    ROUND(
        Quantity * `Unit Price` * (1 - Discount/100),
        2
    ) AS calculated_after_discount
FROM clean_ecommerce_data
LIMIT 10;


-- ==================================================
-- 3. OVERALL BUSINESS KPIs
-- ==================================================


-- Overall Business KPIs
SELECT
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer Name`) AS total_customers,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100,2) AS overall_profit_margin
FROM clean_ecommerce_data;

-- ==================================================
-- 4. PRODUCT PERFORMANCE
-- ==================================================


-- Top 5 products by total sales

SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM clean_ecommerce_data
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 5;



-- Top Categories by Sales

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM clean_ecommerce_data
GROUP BY Category
ORDER BY total_sales DESC
LIMIT 5;

-- Top Categories by profit
SELECT
    Category,
    ROUND(SUM(Profit), 2) AS total_profit
FROM clean_ecommerce_data
GROUP BY Category
ORDER BY total_profit DESC
LIMIT 5;


-- Top Sub-Categories by Sales

SELECT
   `Sub-Category` ,
    ROUND(SUM(Sales), 2) AS total_sales
FROM clean_ecommerce_data
GROUP BY `Sub-Category`
ORDER BY total_sales DESC
LIMIT 5;



-- ==================================================
-- 5. CUSTOMER ANALYSIS
-- ==================================================


-- Most Valuable Customers

SELECT
     `Customer Name`,
     ROUND(SUM(Sales), 2) AS total_sales,
     ROUND(SUM(Profit), 2) AS total_profit,
     COUNT(DISTINCT `Order ID`) AS number_of_orders
FROM clean_ecommerce_data
GROUP BY `Customer Name` 
ORDER BY total_sales DESC
LIMIT 5;


-- ==================================================
-- 6. GEOGRAPHIC ANALYSIS
-- ==================================================


-- Sales & Profit by Region
SELECT 
region,
ROUND(SUM(Sales), 2) AS region_total_sales,
ROUND(SUM(Profit), 2) AS region_total_profit
FROM clean_ecommerce_data
GROUP BY Region
ORDER BY region_total_sales DESC;

-- Sales & Profit by City
SELECT 
City,
ROUND(SUM(Sales), 2) AS  city_total_sales,
ROUND(SUM(Profit), 2) AS city_total_profit
FROM clean_ecommerce_data
GROUP BY City
ORDER BY city_total_sales DESC;



-- ==================================================
-- 7. SALES TREND ANALYSIS
-- ==================================================


-- Monthly Best-Selling Products

WITH monthly_trends AS 
(

SELECT
	YEAR(`Order Date`) AS order_year, 
    MONTH(`Order Date`) AS order_month ,
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM clean_ecommerce_data
GROUP BY YEAR(`Order Date`), MONTH(`Order Date`), `Product Name`
), ranked_products as
(

SELECT * ,
	RANK() OVER(PARTITION BY order_year , order_month ORDER BY total_sales DESC ) AS product_rank
FROM monthly_trends

)
SELECT order_year,order_month,  `Product Name`, total_sales
FROM ranked_products
WHERE product_rank =1
ORDER BY  order_year,order_month;


-- Yearly Sales & Profit

SELECT 
YEAR(`Order Date`) AS  order_year,
ROUND(SUM(Sales), 2) AS  yearly_total_sales,
ROUND(SUM(profit), 2) AS yearly_total_profit
FROM clean_ecommerce_data
GROUP BY  order_year
ORDER BY  order_year ASC;


-- Year-over-Year (YoY) Sales Growth

WITH yearly_sales AS
(
    SELECT
        YEAR(`Order Date`) AS order_year,
        ROUND(SUM(Sales),2) AS total_sales
    FROM clean_ecommerce_data
    GROUP BY YEAR(`Order Date`)
),
growth AS
(
    SELECT
        *,
        LAG(total_sales) OVER(ORDER BY order_year) AS previous_year_sales
    FROM yearly_sales
)

SELECT
    order_year,
    total_sales,
    previous_year_sales,
    CASE
        WHEN previous_year_sales IS NULL THEN 'N/A'
        ELSE
		ROUND(
			((total_sales - previous_year_sales)
			/ previous_year_sales) * 100,
			2
		)
    END AS yoy_growth_rate
FROM growth;


-- Peak Sales Month

SELECT YEAR(`Order Date`) as order_year , MONTHNAME(`Order Date`) AS order_month , ROUND(SUM(Sales), 2) AS monthly_total_sales
FROM clean_ecommerce_data
GROUP BY order_year,order_month
ORDER BY monthly_total_sales DESC
LIMIT 1;



-- ==================================================
-- 8. DISCOUNT ANALYSIS
-- ==================================================

-- Discount Performance
SELECT
    Discount,
    COUNT(DISTINCT `Order ID`) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(
        SUM(Profit) / COUNT(DISTINCT `Order ID`),
        2
    ) AS avg_profit_per_order,
    ROUND(
        (SUM(Profit) / SUM(Sales)) * 100,
        2
    ) AS profit_margin
FROM clean_ecommerce_data
GROUP BY Discount
ORDER BY Discount;

