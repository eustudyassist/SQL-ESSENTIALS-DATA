-- CREATE TABLES
CREATE TABLE customers (
	customer_id SMALLINT,
	name TEXT,
	city TEXT
);

CREATE TABLE orders (
	order_id SMALLINT,
	customer_id SMALLINT,
	product_id SMALLINT,
	order_date DATE
);

CREATE TABLE products (
	product_id SMALLINT,
	product_name TEXT,
	price INT
);

-- IMPORT DATA 

COPY customers
FROM 'C:\Users\eustudyassist\Documents\SQL-ESSENTIALS-DATA\data\store_data\customers.txt'
WITH (FORMAT CSV, HEADER);

COPY orders
FROM 'C:\Users\eustudyassist\Documents\SQL-ESSENTIALS-DATA\data\store_data\orders.csv'
WITH (FORMAT CSV, HEADER, NULL 'NULL');

COPY products
FROM 'C:\Users\eustudyassist\Documents\SQL-ESSENTIALS-DATA\data\store_data\products.csv'
WITH (FORMAT CSV, HEADER);

-- PREVIEW TABLE

SELECT *
FROM customers;

SELECT *
FROM orders;

SELECT *
FROM products;