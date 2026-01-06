-- CTE 1: Calculate total spend per customer
WITH customer_spend AS (
    SELECT
        customer_id,
        SUM(price * quantity) AS total_spent
    FROM ecommerce_sales
    GROUP BY customer_id
)

-- Customers who spent more than average
SELECT
    customer_id,
    total_spent
FROM customer_spend
WHERE total_spent >
      (SELECT AVG(total_spent) FROM customer_spend);


-- =========================================
-- CTE 2: Monthly revenue analysis
-- =========================================

WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(price * quantity) AS revenue
    FROM ecommerce_sales
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)

SELECT *
FROM monthly_sales
ORDER BY month;

