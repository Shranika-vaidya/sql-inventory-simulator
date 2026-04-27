-- 1. See all products
SELECT * FROM products;

-- 2. Products that cost more than 1000
SELECT product_name, price FROM products WHERE price > 1000;

-- 3. Count products per category
SELECT category, COUNT(*) AS total_products FROM products GROUP BY category;

-- 4. Total stock value per category
SELECT category, SUM(price * stock_quantity) AS total_value
FROM products
GROUP BY category
ORDER BY total_value DESC;
