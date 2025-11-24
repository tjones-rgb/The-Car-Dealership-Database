
 -- DROP DATABASE IF EXISTS cardealershipdatabase;

-- CREATE DATABASE cardealershipdatabase;

USE cardealershipdatabase;

DROP TABLE IF EXISTS sales_contracts;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS dealerships;


CREATE TABLE dealerships (
dealership_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(50),
phone VARCHAR(12)
);
INSERT INTO dealerships (name, address, phone) VALUES
('Auto World', '123 Main St', '555-111-2222'),
('Speed Motors', '456 High St', '555-333-4444'),
('Budget Cars', '789 Elm St', '555-555-6666');




CREATE TABLE vehicles (
VIN VARCHAR(17) PRIMARY KEY,
make VARCHAR(30),
model VARCHAR(30),
year INT,
color VARCHAR(20),
price DECIMAL(10,2),
SOLD BOOLEAN DEFAULT 0
);
INSERT INTO vehicles (VIN, make, model, year, color, price, SOLD) VALUES
('1HGCM82633A004352', 'Honda', 'Civic', 2020, 'Blue', 18000.00, 0),
('2FMDK3GC4BBA12345', 'Ford', 'Escape', 2019, 'Red', 15000.00, 0),
('3N1AB7AP4FY267890', 'Nissan', 'Sentra', 2021, 'Black', 19000.00, 1);




CREATE TABLE inventory (
dealership_id INT,
VIN VARCHAR(17),

FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A004352'),
(1, '2FMDK3GC4BBA12345'),
(2, '3N1AB7AP4FY267890');




CREATE TABLE sales_contracts (
contract_id INT AUTO_INCREMENT PRIMARY KEY,
VIN VARCHAR(17),
customer_name VARCHAR(50),
sales_price DECIMAL(10,2),
SALES_DATE DATE,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
INSERT INTO sales_contracts (VIN, customer_name, sales_price, SALES_DATE) VALUES
('3N1AB7AP4FY267890', 'John Smith', 18500.00, '2024-10-12');



