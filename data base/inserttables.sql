INSERT INTO Customers
(customer_name, phone, email, address)
VALUES
('Rahul Sharma','9876543210','rahul@gmail.com','Hyderabad'),
('Priya Reddy','9876543211','priya@gmail.com','Secunderabad'),
('Amit Kumar','9876543212','amit@gmail.com','Madhapur'),
('Sneha Rao','9876543213','sneha@gmail.com','Kukatpally'),
('Arjun Verma','9876543214','arjun@gmail.com','Gachibowli');

INSERT INTO Employees
(employee_name, role, salary, phone)
VALUES
('Ramesh','Manager',35000,'9000000001'),
('Suresh','Waiter',18000,'9000000002'),
('Kiran','Chef',25000,'9000000003'),
('Manoj','Cashier',20000,'9000000004');

INSERT INTO Categories (category_name)
VALUES
('Starters'),
('Main Course'),
('Desserts'),
('Beverages');

INSERT INTO Menu_Items
(item_name, category_id, price, availability)
VALUES
('Chicken 65',1,220,TRUE),
('Paneer Tikka',1,180,TRUE),
('Chicken Biryani',2,280,TRUE),
('Veg Biryani',2,200,TRUE),
('Chocolate Cake',3,120,TRUE),
('Ice Cream',3,80,TRUE),
('Fresh Lime Soda',4,60,TRUE),
('Cold Coffee',4,100,TRUE);

INSERT INTO Orders
(customer_id, employee_id, order_type, order_status, total_amount)
VALUES
(1,2,'Dine-in','Completed',500),
(2,2,'Takeaway','Completed',380),
(3,3,'Online','Pending',400),
(4,2,'Dine-in','Completed',300),
(5,4,'Online','Completed',480);

INSERT INTO Order_Details
(order_id, item_id, quantity, unit_price, subtotal)
VALUES
(1,1,1,220,220),
(1,3,1,280,280),
(2,2,1,180,180),
(2,4,1,200,200),
(3,3,1,280,280),
(3,7,2,60,120),
(4,5,1,120,120),
(4,6,1,80,80),
(4,7,1,60,60),
(5,3,1,280,280),
(5,8,2,100,200);

INSERT INTO Payments
(order_id, payment_method, amount, payment_status)
VALUES
(1,'Cash',500,'Paid'),
(2,'UPI',380,'Paid'),
(3,'Card',400,'Pending'),
(4,'Cash',300,'Paid'),
(5,'UPI',480,'Paid');