USE RestaurantDB;

-- Transaction 1: Create a new order

START TRANSACTION;

INSERT INTO Orders
(customer_id, employee_id, order_type, order_status, total_amount)
VALUES
(1, 2, 'Dine-in', 'Pending', 0);

SET @new_order_id = LAST_INSERT_ID();

INSERT INTO Order_Details
(order_id, item_id, quantity, unit_price, subtotal)
VALUES
(@new_order_id, 3, 2, 280, 560);

UPDATE Orders
SET total_amount = (
    SELECT COALESCE(SUM(subtotal), 0)
    FROM Order_Details
    WHERE order_id = @new_order_id
)
WHERE order_id = @new_order_id;

COMMIT;

-- Check newly created order
SELECT * FROM Orders
ORDER BY order_id DESC;


-- Transaction 2: Rollback example

START TRANSACTION;

UPDATE Menu_Items
SET price = 500
WHERE item_id = 1;

ROLLBACK;

-- Check original price
SELECT * FROM Menu_Items
WHERE item_id = 1;