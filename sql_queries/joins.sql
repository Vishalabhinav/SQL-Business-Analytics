-- Create a customers table (for join demonstration)
CREATE TABLE customers (
    customer_id VARCHAR(10),
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert sample customer data
INSERT INTO customers VALUES
('C001', 'Amit', 'Delhi'),
('C002', 'Priya', 'Bangalore'),
('C003', 'Rahul', 'Kolkata'),
('C004', 'Sneha', 'Mumbai'),
('C005', 'Arjun', 'Chennai'),
('C006', 'Neha', 'Hyderabad');

-- INNER JOIN: Customer order details
SELECT 
    o.order_id,
    c.customer_name,
    o.product,
    o.category,
    o.price,
    o.quantity,
    (o.price * o.quantity) AS order_value
FROM ecommerce_sales o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- Total spend by each customer
SELECT
    c.customer_name,
    SUM(o.price * o.quantity) AS total_spent
FROM ecommerce_sales o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;

-- Orders count by city
SELECT
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN ecommerce_sales o
ON c.customer_id = o.customer_id
GROUP BY c.city;

