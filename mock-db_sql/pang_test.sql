SELECT o.order_id, s.first_name
FROM orders o
INNER JOIN staff s ON o.staff_id = s.staff_id;
