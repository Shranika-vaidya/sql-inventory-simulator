-- Insert suppliers
INSERT INTO suppliers (supplier_name, country, contact_email) VALUES
('TechParts Ltd', 'India', 'info@techparts.com'),
('GlobalGoods', 'USA', 'sales@globalgoods.com'),
('EuroSupply', 'Germany', NULL);   -- intentional: missing email

-- Insert products (one has no supplier — intentional NULL)
INSERT INTO products (product_name, category, price, stock_quantity, supplier_id) VALUES
('Wireless Mouse', 'Electronics', 799.00, 50, 1),
('USB Hub', 'Electronics', 1299.00, 30, 1),
('Office Chair', 'Furniture', 8999.00, 10, 2),
('Standing Desk', 'Furniture', 14999.00, 5, 2),
('Notebook Pack', 'Stationery', 199.00, 100, NULL),  -- no supplier
('Pen Set', 'Stationery', 99.00, 200, 3),
('Wireless Mouse', 'Electronics', 750.00, 15, 2);    -- DUPLICATE product name!

-- Insert customers
INSERT INTO customers (customer_name, city, email) VALUES
('Ravi Sharma', 'Pune', 'ravi@email.com'),
('Priya Singh', 'Mumbai', 'priya@email.com'),
('Amit Patel', 'Delhi', NULL);   -- missing email

-- Insert orders
INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
(1, 1, 2, '2025-01-10'),
(1, 3, 1, '2025-01-15'),
(2, 2, 3, '2025-02-01'),
(3, 5, 5, '2025-02-10'),
(2, 4, 1, '2025-03-05'),
(1, 7, 2, '2025-03-10');
