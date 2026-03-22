SELECT *
FROM customers;

SELECT *
FROM orders;

SELECT *
FROM products;

/*JOIN TYPES
- Inner join / Join:- Matches records that are presents in both 
- Left Join - almost similar
- Right Join - almost similar
- Full Outer Join
- Cross Join

- Union
- Intersect
- Except
*/

SELECT *
FROM orders JOIN customers
ON orders.customer_id = customers.customer_id;

SELECT *
FROM orders JOIN products
ON orders.product_id = products.product_id;