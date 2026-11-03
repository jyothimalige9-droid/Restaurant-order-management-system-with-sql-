USE RestaurantDB;

DELIMITER //

CREATE PROCEDURE GetAllOrders()
BEGIN
    SELECT * FROM Orders;
END //

CREATE PROCEDURE GetCustomerOrders(
    IN cust_id INT
)
BEGIN
    SELECT *
    FROM Orders
    WHERE customer_id = cust_id;
END //

CREATE PROCEDURE AddCustomer(
    IN p_name VARCHAR(100),
    IN p_phone VARCHAR(15),
    IN p_email VARCHAR(100),
    IN p_address VARCHAR(255)
)
BEGIN
    INSERT INTO Customers
    (customer_name, phone, email, address)
    VALUES
    (p_name, p_phone, p_email, p_address);
END //

DELIMITER ;

-- Execute procedures
CALL GetAllOrders();

CALL GetCustomerOrders(1);

CALL AddCustomer(
    'Vikram Singh',
    '9876543215',
    'vikram@gmail.com',
    'Miyapur'
);