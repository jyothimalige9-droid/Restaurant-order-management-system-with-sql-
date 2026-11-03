USE RestaurantDB;

DELIMITER //

CREATE TRIGGER Before_Order_Insert
BEFORE INSERT ON Order_Details
FOR EACH ROW
BEGIN
    SET NEW.subtotal = NEW.quantity * NEW.unit_price;
END //

CREATE TRIGGER After_Order_Detail_Insert
AFTER INSERT ON Order_Details
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET total_amount = (
        SELECT COALESCE(SUM(subtotal),0)
        FROM Order_Details
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END //

CREATE TRIGGER Before_Menu_Insert
BEFORE INSERT ON Menu_Items
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Menu price cannot be negative';
    END IF;
END //

DELIMITER ;

-- Check triggers
SHOW TRIGGERS;