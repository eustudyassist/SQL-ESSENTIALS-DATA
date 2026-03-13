SELECT *
FROM customers;

SELECT *
FROM orders;

SELECT *
FROM products;

SELECT 
	*
FROM customers JOIN orders
ON customers.customer_id = orders.customer_id
