-- Create database
CREATE DATABASE hive_sqoop_demo;

-- Use default database
USE hive_sqoop_demo;

-- Create table
CREATE TABLE employee(eid INT PRIMARY KEY, name VARCHAR(50), salary FLOAT, designation VARCHAR(100));

-- Insert data
INSERT INTO employee VALUES (1, 'Eko', 3500750.50, 'Main salary');
INSERT INTO employee VALUES (2, 'Teguh', 4850000.25, 'Bonus');
INSERT INTO employee VALUES (3, 'Widodo', 675000.00, 'Trip bonus');

-- Sample query
SELECT * FROM employee;