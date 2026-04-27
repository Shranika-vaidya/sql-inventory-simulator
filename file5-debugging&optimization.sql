-- Find duplicate product names
SELECT product_name, COUNT(*) AS occurrences
FROM products
GROUP BY product_name
HAVING COUNT(*) > 1;


-- Categories where total stock is more than 50 units
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category
HAVING SUM(stock_quantity) > 50;

-- Customers who placed more than 1 order
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Show ALL products, even those with no supplier
SELECT p.product_name, p.category, s.supplier_name
FROM products p
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- BROKEN: forgot the join condition entirely
SELECT p.product_name, s.supplier_name
FROM products p
LEFT JOIN suppliers s;
-- Fix: add --> ON p.supplier_id = s.supplier_id

-- FIXED version
SELECT p.product_name, s.supplier_name
FROM products p
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- Products that HAVE been ordered
SELECT product_name, price
FROM products
WHERE product_id IN (
    SELECT DISTINCT product_id FROM orders
);


-- Products that have NEVER been ordered
SELECT product_name
FROM products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM orders
);

SELECT 
    c.customer_name,
    p.product_name,
    s.supplier_name,
    o.quantity,
    (o.quantity * p.price) AS total_spent,
    o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p  ON o.product_id  = p.product_id
LEFT  JOIN suppliers s ON p.supplier_id = s.supplier_id
ORDER BY total_spent DESC;