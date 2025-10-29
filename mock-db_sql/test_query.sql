/*
 exercise1
 Write a query to see a list of all employees working at Chrome & Burger.
*/

-- SELECT * FROM staff; 


/*
 exercise2
 Write a query to find all menu items that fall under the 'Burger' category.
*/

/*
SELECT *
FROM menuitems
WHERE category = 'Burger'
*/

 /*
 exercise3 
Write a query to show all menu items, but list them from the most expensive to the least expensive.
 เรียงราคา มาก-->น้อย DESC
 */

-- SELECT * FROM menuitems ORDER BY price  DESC;

-- เรียงราคา น้อย--มาก ASC
-- SELECT * FROM menuitems ORDER BY price  ASC;



 /* 4 
 Write a query 
 to find the three 
 cheapest items available on the menu.
 default น้อย-->มาก ASC 
*/

-- ถูกที่สุด 3เมนู
/*
SELECT *
FROM menuitems 
ORDER BY price ASC
LIMIT 3;
*/

-- แพงสุด 5 เมนู
/*
SELECT *
FROM menuitems
ORDER BY price DESC
LIMIT 5;
*/

-- SELECT name,price 
-- FROM menuitems ORDER BY 
-- price LIMIT 3;

/* 5
Write a query 
to find all the ingredients supplied 
by 'Patty''s Premium Meats'.
*/

/*
SELECT ingredients.name, suppliers.name
FROM ingredients
JOIN suppliers on suppliers.supplier_id = ingredients.supplier_id
where suppliers.name = 'Patty''s Premium Meats'
*/


/*
SELECT ingredients.name as ingredients
FROM ingredients
JOIN suppliers on suppliers.supplier_id = ingredients.supplier_id
WHERE suppliers.name = ' Patty''s Premium meats';
*/

/* 6 
Write a query to see all orders processed by the staff member with staff_id = 1
เขียนคำสั่ง SQL เพื่อดูรายการออเดอร์ทั้งหมดที่ถูกประมวลผลโดยพนักงานที่มี staff_id = 1
*/

-- SELECT* FROM orders WHERE staff_id = 1;

/* 7 
Write a query to find out how many 
orders each staff member has processed.
 Show the staff member's first name, last name, and their total order count.

เขียนคำสั่ง SQL เพื่อหาว่า พนักงานแต่ละคนได้ 
ประมวลผลออเดอร์ไปทั้งหมดกี่รายการ
และให้แสดง
ชื่อ (first_name)
นามสกุล (last_name)
จำนวนออเดอร์ที่พนักงานคนนั้นทำ (total order count)
*/



-- SELECT staff.staff_id, first_name, last_name, COUNT(staff.staff_id) as count
-- FROM orders
-- JOIN staff on order.staff_id = staff_id
-- GROUP BY staff.staff_id

/*
SELECT 
    s.first_name,
    s.last_name,
    COUNT(o.order_id) as order_count
FROM Staff s
JOIN Orders o on s.staff_id = o.staff_id
GROUP BY s.staff_id
ORDER BY order_count DESC;
*/


-- 8  Write a query to calculate the total revenue for each day of sales.

-- เขียนคำสั่ง SQL เพื่อคำนวณรายได้รวมของการขายในแต่ละวัน

/*
SELECT 
    date(order_date) AS sales_day,
    SUM(total_price) AS total_revenue
FROM orders
GROUP BY sales_day
order by sales_day;
*/












/*
SELECT 
    DATE(order_date) AS sale_date,
    SUM(total_price) AS total_revenue
FROM public.orders
GROUP BY DATE(order_date)
ORDER BY sale_date;
*/

-- 9 Write a query to find out which menu item has been ordered the most.

/*
SELECT 
    mi.name,
    SUM(oi.oi.quantity) as total_sold
from orderitems oi 
join menuitems mi on mi.item_id = oi.item_id
GROUP BY mi.name
ORDER BY total_sold DESC
LIMIT 1;
*/

/*
SELECT
    m.item_id,
    m.name,
    SUM(oi.quantity) AS total_ordered
FROM orderitems oi
JOIN menuitems m ON oi.item_id = m.item_id
GROUP BY
    m.item_id, m.name
ORDER BY
    total_ordered DESC
LIMIT 1;
*/

-- 10
-- List All Ingredients for the 'Bacon Cheeseburger'


/*
SELECT 
    i.name AS ingredient_name, 
    ri.quantity_needed, 
    i.unit
FROM menuitems m
JOIN recipeitems ri ON m.item_id = ri.item_id
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE m.name = 'Bacon Cheeseburger';
*/