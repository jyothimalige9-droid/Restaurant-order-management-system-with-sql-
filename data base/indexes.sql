USE RestaurantDB;

CREATE INDEX idx_customer_name
ON Customers(customer_name);

CREATE INDEX idx_order_date
ON Orders(order_date);

CREATE INDEX idx_order_customer
ON Orders(customer_id);

CREATE INDEX idx_menu_category
ON Menu_Items(category_id);

CREATE INDEX idx_payment_status
ON Payments(payment_status);

-- Check indexes
SHOW INDEX FROM Customers;

SHOW INDEX FROM Orders;

SHOW INDEX FROM Menu_Items;

SHOW INDEX FROM Payments;