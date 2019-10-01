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
SELECT * FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders on orders.address_id = addresses.id;

--	6.	How many customers do we have?
SELECT count(*) FROM customers;

--	7.	How many products do we carry?
SELECT count(*) FROM products;

--	8.	What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand) AS total_diet_pepsis FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';

