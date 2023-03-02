
SELECT
    o.order_id,
	CONCAT(c.first_name,' ', c.last_name) AS 'customer_name',
	c.city,
	c.state,
	o.order_date,
	SUM(oi.quantity) AS 'total_price',
	SUM(oi.quantity * oi.list_price) AS 'revenue',
	p.product_name,
	pc.category_name,
	s.store_name,
	CONCAT(ss.first_name, ' ', ss.last_name) AS 'sales_representative',
	pb.brand_name
FROM sales.orders o
INNER JOIN sales.customers c
ON o.customer_id = c.customer_id
INNER JOIN sales.order_items oi
ON o.order_id = oi.order_id
INNER JOIN production.products p
ON oi.product_id = p.product_id
INNER JOIN production.categories pc
ON p.category_id = pc.category_id
INNER JOIN sales.stores s
ON o.store_id = s.store_id
INNER JOIN sales.staffs ss
ON o.staff_id = ss.staff_id
INNER JOIN production.brands pb
ON p.brand_id = pb.brand_id
GROUP BY
	o.order_id,
	CONCAT(c.first_name,' ', c.last_name),
	c.city,
	c.state,
	o.order_date,
	p.product_name,
	pc.category_name,
	s.store_name,
	CONCAT(ss.first_name, ' ', ss.last_name),
	pb.brand_name
