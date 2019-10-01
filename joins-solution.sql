--Tasks
--	1.	Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id;

--	2.	Get all orders and their line items (orders, quantity and product).
SELECT * FROM orders
JOIN line_items ON orders.id = line_items.order_id
JOIN products ON products.id = line_items.product_id;

--	3.	Which warehouses have cheetos?
SELECT warehouse.warehouse, warehouse_product.on_hand FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'cheetos';

--	5.	Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, count(*) AS total_orders FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders on orders.address_id = addresses.id
GROUP BY customers.first_name;

--	6.	How many customers do we have?
SELECT count(*) FROM customers;

--	7.	How many products do we carry?
SELECT count(*) FROM products;

--	8.	What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand) AS total_diet_pepsis FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';

--Stretch
--	9.	How much was the total cost for each order?
SELECT (line_items.order_id), sum(products.unit_price * line_items.quantity) AS total_cost FROM products
JOIN line_items ON line_items.product_id = products.id
GROUP BY line_items.order_id
ORDER BY line_items.order_id;

--	10.	How much has each customer spent in total?
SELECT (customers.first_name), sum(products.unit_price * line_items.quantity) AS total_cost FROM products
JOIN line_items ON line_items.product_id = products.id
JOIN orders ON orders.id = line_items.order_id
JOIN addresses ON addresses.id = orders.address_id
JOIN customers ON customers.id = addresses.customer_id
GROUP BY customers.first_name
ORDER BY total_cost;

--	11.	How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
