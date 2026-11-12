-- Fictional e-commerce schema for local PostgreSQL QA practice.
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  status VARCHAR(20) NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  sku VARCHAR(50) NOT NULL UNIQUE,
  product_name VARCHAR(200) NOT NULL,
  unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
  stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0)
);

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
  order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) NOT NULL CHECK (status IN ('PENDING', 'PAID', 'CANCELLED', 'SHIPPED')),
  order_total NUMERIC(10,2) NOT NULL CHECK (order_total >= 0)
);

CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES orders(order_id),
  product_id INTEGER NOT NULL REFERENCES products(product_id),
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0)
);

INSERT INTO customers VALUES
(1, 'alex.qa@example.test', 'ACTIVE'),
(2, 'sam.qa@example.test', 'INACTIVE');

INSERT INTO products VALUES
(101, 'SKU-101', 'Demo Keyboard', 1200.00, 15),
(102, 'SKU-102', 'Demo Mouse', 650.00, 30);

INSERT INTO orders (order_id, customer_id, status, order_total) VALUES
(5001, 1, 'PAID', 2500.00),
(5002, 2, 'CANCELLED', 650.00);

INSERT INTO order_items VALUES
(1, 5001, 101, 1, 1200.00),
(2, 5001, 102, 2, 650.00),
(3, 5002, 102, 1, 650.00);
