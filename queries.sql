-- Ecommerce Sales Analysis - MySQL Queries

-- 1. KPI Summary
SELECT COUNT(DISTINCT Order_ID) AS Total_orders,
COUNT(DISTINCT Customer_ID) AS Total_Customers,
ROUND(SUM(Cleansales), 2) AS Total_Revenue,
ROUND(AVG(Cleansales), 2) AS Avg_Order_Value 
FROM ecommerce_sales1;

-- 2. Top 5 Categories by Revenue
SELECT Category, COUNT(Order_ID) as orders, ROUND(SUM(Cleansales), 2) AS Revenue
FROM ecommerce_sales1
GROUP BY Category
ORDER BY Revenue DESC
LIMIT 5;

-- 3. Top 5 Cities by Revenue
SELECT city, COUNT(Order_ID) as orders, ROUND(SUM(Cleansales), 2) AS revenue
FROM ecommerce_sales1
GROUP BY city
ORDER BY revenue DESC
LIMIT 5;

-- 4. Monthly Sales Trend
SELECT DATE_FORMAT(Cleaned_order_date, '%Y-%m') AS Month,
COUNT(Order_ID) As Orders,
ROUND(SUM(Cleansales), 2) AS Revenue
FROM ecommerce_sales1
GROUP BY DATE_FORMAT(Cleaned_order_date, '%Y-%m')
ORDER BY Month;

-- 5. Sales by Region
SELECT Region, ROUND(SUM(Cleansales), 2) AS Revenue, ROUND(SUM(Profit), 2) AS Profit
FROM ecommerce_sales1
GROUP BY Region
ORDER BY Revenue DESC;

-- 6. Payment Method Analysis
SELECT Payment_Method, COUNT(Order_ID) As orders,
ROUND(SUM(Cleansales), 2) as Revenue
FROM ecommerce_sales1
GROUP BY Payment_Method
ORDER BY Revenue DESC;

-- 7. Order Status Distribution
SELECT Order_Status, COUNT(*) AS count,
ROUND(COUNT(*)* 100.0/(SELECT COUNT(*) FROM ecommerce_sales1),2) AS percentage 
FROM ecommerce_sales1 
GROUP BY Order_Status;
