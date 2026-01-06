-- Window Function 1: Rank customers by total spend
SELECT
    customer_id,
    SUM(price * quantity) AS total_spent,
    RANK() OVER (ORDER BY SUM(price * quantity) DESC) AS spending_rank
FROM ecommerce_sales
GROUP BY customer_id;


-- =========================================
-- Window Function 2: Running total of revenue
-- =========================================

SELECT
    order_date,
    SUM(price * quantity) AS daily_revenue,
    SUM(SUM(price * quantity)) OVER (ORDER BY order_date) AS running_total_revenue
FROM ecommerce_sales
GROUP BY order_date
ORDER BY order_date;


-- =========================================
-- Window Function 3: Revenue share by category
-- =========================================

SELECT
    category,
    SUM(price * quantity) AS category_revenue,
    ROUND(
        SUM(price * quantity) * 100.0 /
        SUM(SUM(price * quantity)) OVER (),
        2
    ) AS revenue_percentage
FROM ecommerce_sales
GROUP BY category;

