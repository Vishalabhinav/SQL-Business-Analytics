-- View all data
SELECT * FROM ecommerce_sales;

-- Total revenue
SELECT SUM(price * quantity) AS total_revenue
FROM ecommerce_sales;

-- Total orders per category
SELECT category, COUNT(order_id) AS total_orders
FROM ecommerce_sales
GROUP BY category;

-- Revenue by category
SELECT category, SUM(price * quantity) AS revenue
FROM ecommerce_sales
GROUP BY category
ORDER BY revenue DESC;

-- Orders by region
SELECT region, COUNT(order_id) AS orders
FROM ecommerce_sales
GROUP BY region;

