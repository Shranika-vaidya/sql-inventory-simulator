-- Correct: products with their supplier names
SELECT p.product_name, p.price, s.supplier_name
FROM products p
INNER JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- BROKEN: wrong join column (this will error or give wrong results)
SELECT p.product_name, s.supplier_name
FROM products p
INNER JOIN suppliers s ON p.product_id = s.supplier_id;
-- Bug: should be p.supplier_id, not p.product_id

-- This misses products with no supplier
SELECT product_name FROM products WHERE supplier_id = NULL;  -- WRONG!

-- Correct way
SELECT product_name FROM products WHERE supplier_id IS NULL;
