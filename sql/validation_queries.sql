-- 1. Reconcile stored order total against calculated line-item total.
SELECT o.order_id, o.order_total AS stored_total,
       SUM(oi.quantity * oi.unit_price) AS calculated_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.order_total
HAVING o.order_total <> SUM(oi.quantity * oi.unit_price);

-- 2. Find orders with no line items.
SELECT o.order_id
FROM orders o
LEFT JOIN order_items oi ON oi.order_id = o.order_id
WHERE oi.order_item_id IS NULL;

-- 3. Find order items linked to products currently out of stock.
SELECT oi.order_id, oi.product_id, p.stock_quantity
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
WHERE p.stock_quantity = 0;

-- 4. Find duplicate emails ignoring case (normally prevented by exact UNIQUE constraint only).
SELECT LOWER(email) AS normalized_email, COUNT(*)
FROM customers
GROUP BY LOWER(email)
HAVING COUNT(*) > 1;

-- 5. Summarize orders by status.
SELECT status, COUNT(*) AS order_count, SUM(order_total) AS total_value
FROM orders
GROUP BY status
ORDER BY status;

-- 6. Review paid orders belonging to inactive customers.
SELECT DISTINCT c.customer_id, c.email, o.order_id, o.status
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE c.status = 'INACTIVE' AND o.status = 'PAID';
