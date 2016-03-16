--1. Get all customers and their addresses.

SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip
FROM customers
INNER JOIN addresses
ON customers.id = addresses.customer_id;

--2. Get all orders and their line items.

SELECT orders.id, orders.order_date, orders.total, line_items.unit_price, line_items.quantity
FROM orders
INNER JOIN line_items
ON orders.id = line_items.order_id;

--3. Which warehouses have cheetos?

SELECT *
FROM warehouse
INNER JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id
INNER JOIN products
ON products.id = warehouse_product.product_id
WHERE description = 'cheetos';

--4. Which warehouses have diet pepsi?

SELECT *
FROM warehouse
INNER JOIN warehouse_product
ON warehouse.id = warehouse_product.warehouse_id
INNER JOIN products
ON products.id = warehouse_product.product_id
WHERE description = 'diet pepsi';

--5.  Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT *
FROM customers
INNER JOIN addresses
ON customers.id = addresses.customer_id
INNER JOIN orders
ON addresses.id = orders.address_id;

--6.  How many customers do we have?

SELECT COUNT(*)
FROM customers

--7.  How many products do we carry?

SELECT COUNT(*)
FROM products

--8.  What is the total available on-hand quantity of diet pepsi?

SELECT SUM(warehouse_product.on_hand)
FROM products
INNER JOIN warehouse_product
ON products.id = warehouse_product.product_id
WHERE description = 'diet pepsi';