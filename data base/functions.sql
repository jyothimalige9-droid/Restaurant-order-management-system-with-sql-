USE RestaurantDB;

DELIMITER //

CREATE FUNCTION CalculateOrderTotal(
    p_order_id INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE order_total DECIMAL(10,2);

    SELECT COALESCE(SUM(subtotal),0)
    INTO order_total
    FROM Order_Details
    WHERE order_id = p_order_id;

    RETURN order_total;
END //

CREATE FUNCTION CalculateGST(
    amount DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN amount * 0.05;
END //

DELIMITER ;

-- Execute functions
SELECT CalculateOrderTotal(1) AS Order_Total;

SELECT CalculateGST(1000) AS GST_Amount;