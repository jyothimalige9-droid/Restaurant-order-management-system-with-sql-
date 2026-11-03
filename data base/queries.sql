SELECT * FROM Customers;
SELECT * FROM Menu_Items;
SELECT item_name, price
FROM Menu_Items
WHERE price > 150;
SELECT *
FROM Orders
WHERE order_status = 'Completed';
SELECT COUNT(*) AS Total_Orders
FROM Orders;
SELECT SUM(amount) AS Total_Revenue
FROM Payments
WHERE payment_status = 'Paid';
SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.order_status
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;
SELECT
    m.item_name,
    SUM(od.quantity) AS Total_Quantity_Sold
FROM Order_Details od
JOIN Menu_Items m
ON od.item_id = m.item_id
GROUP BY m.item_name
ORDER BY Total_Quantity_Sold DESC;
SELECT
    c.category_name,
    m.item_name,
    m.price
FROM Categories c
JOIN Menu_Items m
ON c.category_id = m.category_id;
SELECT
    c.customer_name,
    COUNT(o.order_id) AS Total_Orders
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;
