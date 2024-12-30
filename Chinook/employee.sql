CREATE TABLE employee(
employee_id INT PRIMARY KEY,
last_name VARCHAR(255),
first_name VARCHAR(255),
title VARCHAR(100),
reports_to INT,
birth_date DATE,
hire_date DATE,
address VARCHAR(255),
city VARCHAR(255),
state VARCHAR(50),
country VARCHAR(50),
postal_code VARCHAR(35),
phone VARCHAR(50),
fax VARCHAR(50),
email VARCHAR(100),
FOREIGN KEY (reports_to) REFERENCES employee(employee_id)
);

/*
List all employees who directly report to a specific manager along with the manager's name.
*/

SELECT
    e.employee_id AS EmployeeId,
    e.first_name AS EmployeeFirstName,
    e.last_name AS EmployeeLastName,
    m.employee_id AS ManagerId,
    m.first_name AS ManagerFirstName,
    m.last_name AS ManagerLastName
FROM 
    employee e
JOIN 
    employee m ON e.reports_to = m.employee_id
WHERE 
    m.employee_id = 2;

        










































































		