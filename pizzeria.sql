create database pizzeria
use pizzeria

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address VARCHAR(255),
    postal_code VARCHAR(20),
    city VARCHAR(100),
    province VARCHAR(100),
    phone_number VARCHAR(20)
);


CREATE TABLE Stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    postal_code VARCHAR(20),
    city VARCHAR(100),
    province VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    nif VARCHAR(20) UNIQUE,
    phone_number VARCHAR(20),
    role ENUM('Cook', 'Delivery'),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);


CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(10, 2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    store_id INT,
    order_datetime DATETIME,
    delivery_or_pickup ENUM('Delivery', 'Pickup'),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);


CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE TABLE Deliveries (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    employee_id INT,
    delivery_datetime DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Clients (first_name, last_name, address, postal_code, city, province, phone_number) VALUES
('John', 'Doe', '123 Main St', '08001', 'Barcelona', 'Catalonia', '123456789'),
('Jane', 'Smith', '456 Elm St', '08002', 'Barcelona', 'Catalonia', '987654321'),
('Albert', 'Einstein', '789 Oak St', '08003', 'Barcelona', 'Catalonia', '456123789');


INSERT INTO Stores (address, postal_code, city, province) VALUES
('123 Market St', '08004', 'Barcelona', 'Catalonia'),
('456 Broadway', '08005', 'Barcelona', 'Catalonia');


INSERT INTO Employees (first_name, last_name, nif, phone_number, role, store_id) VALUES
('Alice', 'Brown', '12345678A', '111222333', 'Cook', 1),
('Bob', 'White', '87654321B', '444555666', 'Delivery', 1),
('Charlie', 'Black', '11223344C', '777888999', 'Cook', 2),
('David', 'Green', '44332211D', '000111222', 'Delivery', 2);


INSERT INTO Categories (name) VALUES
('Pizza'),
('Hamburger'),
('Drink');


INSERT INTO Products (name, description, image, price, category_id) VALUES
('Margherita Pizza', 'Tomato sauce, mozzarella, and basil', 'margherita.jpg', 8.50, 1),
('Pepperoni Pizza', 'Tomato sauce, mozzarella, and pepperoni', 'pepperoni.jpg', 9.50, 1),
('Cheeseburger', 'Beef patty with cheese, lettuce, and tomato', 'cheeseburger.jpg', 7.00, 2),
('Coca Cola', '330ml can', 'cocacola.jpg', 1.50, 3),
('Sprite', '330ml can', 'sprite.jpg', 1.50, 3);


INSERT INTO Orders (client_id, store_id, order_datetime, delivery_or_pickup, total_price) VALUES
(1, 1, '2024-07-15 12:00:00', 'Delivery', 20.00),
(2, 1, '2024-07-15 13:00:00', 'Pickup', 15.00),
(3, 2, '2024-07-15 14:00:00', 'Delivery', 30.00);


INSERT INTO OrderItems (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 4, 3),
(2, 2, 1),
(2, 5, 4),
(3, 3, 5);


INSERT INTO Deliveries (order_id, employee_id, delivery_datetime) VALUES
(1, 2, '2024-07-15 12:30:00'),
(3, 4, '2024-07-15 14:30:00');
