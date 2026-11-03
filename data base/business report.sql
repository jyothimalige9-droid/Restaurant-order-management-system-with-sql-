USE RestaurantDB;

-- Report 1: Total Revenue

SELECT
    SUM(amount) AS Total_Revenue
FROM Payments
WHERE payment_status = 'Paid';


-- Report 2: Daily Sales Report

SELECT
    DATE(payment_date) AS Sales_Date,
    SUM(amount) AS Daily_Revenue
FROM Payments
WHERE payment_status = 'Paid'
GROUP BY DATE(payment_date)
ORDER BY Sales_Date;


-- Report 3: Top 5 Best-Selling Food Items

SELECT
    m.item_name,
    SUM(od.quantity) AS Total_Sold
FROM Order_Details od
JOIN Menu_Items m
ON od.item_id = m.item_id
GROUP BY m.item_id, m.item_name
ORDER BY Total_Sold DESC
LIMIT 5;


-- Report 4: Monthly Revenue

SELECT
    YEAR(payment_date) AS Sales_Year,
    MONTH(payment_date) AS Sales_Month,
    SUM(amount) AS Monthly_Revenue
FROM Payments
WHERE payment_status = 'Paid'
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY Sales_Year, Sales_Month;


-- Report 5: Customer-Wise Spending

SELECT
    c.customer_name,
    SUM(p.amount) AS Total_Spending
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Payments p
ON o.order_id = p.order_id
WHERE p.payment_status = 'Paid'
GROUP BY c.customer_id, c.customer_name
ORDER BY Total_Spending DESC;


-- Report 6: Order Status Report

SELECT
    order_status,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY order_status;


-- Report 7: Category-Wise Revenue

SELECT
    c.category_name,
    SUM(od.subtotal) AS Category_Revenue
FROM Order_Details od
JOIN Menu_Items m
ON od.item_id = m.item_id
JOIN Categories c
ON m.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY Category_Revenue DESC;