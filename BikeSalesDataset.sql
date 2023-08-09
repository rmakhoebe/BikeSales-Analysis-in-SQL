
SELECT
	orders.order_id,
	CONCAT(customers.first_name,' ',customers.last_name) as Customer_Name,
	customers.city,
	customers.state,
	orders.order_date,
	SUM(items.quantity) AS Sales_volume,
	SUM(items.quantity * items.list_price) AS revenue,
	product.product_name,
	cat.category_name,
	brand.brand_name,
	store.store_name,
	CONCAT(staff.first_name,' ',staff.last_name) as sales_person
FROM sales.orders as orders
JOIN sales.customers as customers
ON orders.customer_id = customers.customer_id
JOIN sales.order_items as items
ON orders.order_id = items.order_id
JOIN production.products as product
ON product.product_id = items.product_id
JOIN production.categories as cat
ON cat.category_id = product.category_id
JOIN production.brands as brand
ON brand.brand_id = product.brand_id
JOIN sales.stores as store
ON store.store_id = orders.store_id
JOIN sales.staffs as  staff
On staff.staff_id = orders.staff_id
GROUP BY 
	orders.order_id,
	CONCAT(customers.first_name,' ',customers.last_name),
	customers.city,
	customers.state,
	orders.order_date,
	product.product_name,
	cat.category_name,
	brand.brand_name,
	store.store_name,
	CONCAT(staff.first_name,' ',staff.last_name)

	