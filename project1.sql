select count(*) as total_orders
from superstore_sales;
select round(sum(sales), 2) as total_sales
from superstore_sales;
-- sales by region 
select Region, 
	round(sum(sales), 2) as total_sales 
from superstore_sales
group by region 
order by total_sales DESC; 
-- sales by product category 
SELECT category,
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;
-- top 10 customers by revenue 
SELECT "Customer Name",
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY "Customer Name"
ORDER BY total_sales DESC
LIMIT 10;
-- top 10 products by revenue 
SELECT "product name",
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY "product name"
ORDER BY total_sales DESC
LIMIT 10;
-- sales by customer segment 
SELECT segment,
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;
-- monthly sales trend 
SELECT 
    strftime('%Y-%m', "Order Date") AS month,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY month
ORDER BY month;
-- average order value 
SELECT 
    ROUND(AVG(sales),2) AS average_order_value
FROM superstore_sales;
-- sales by subcategory 
SELECT "sub-category",
       ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY "sub-category"
ORDER BY total_sales DESC;
-- sales by shipping method 
SELECT "Ship Mode",
       ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY "Ship Mode"
ORDER BY total_sales DESC;
-- top states by sales 
SELECT state,
       ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;
-- sales by year 
SELECT 
    strftime('%Y', "Order Date") AS year,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY year
ORDER BY year;
-- CASE 
SELECT category,
       CASE
           WHEN SUM(sales) > 500000 THEN 'High Revenue'
           WHEN SUM(sales) > 200000 THEN 'Medium Revenue'
           ELSE 'Low Revenue'
       END AS revenue_tier,
       ROUND(SUM(sales),2) AS total_sales
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

