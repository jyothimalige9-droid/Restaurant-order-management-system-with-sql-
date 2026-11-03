CREATE VIEW Customer_Order_View AS
SELECT
    c.customer_name,
    c.phone,
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;
SELECT * FROM Customer_Order_View;
CREATE VIEW Menu_View AS
SELECT
    m.item_id,
    m.item_name,
    c.category_name,
    m.price,
    m.availability
FROM Menu_Items m
JOIN Categories c
ON m.category_id = c.category_id;
SELECT * FROM Menu_View;
CREATE VIEW Payment_View AS
SELECT
    p.payment_id,
    c.customer_name,
    o.order_id,
    p.payment_method,
    p.amount,
    p.payment_status
FROM Payments p
JOIN Orders o
ON p.order_id = o.order_id
JOIN Customers c
ON o.customer_id = c.customer_id;
SELECT * FROM Payment_View;