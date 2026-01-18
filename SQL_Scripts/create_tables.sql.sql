-- Creating Departments Table

CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(100) NOT NULL,
location VARCHAR(100)
);

-- Creating Employees table

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


-- Creating Attendance Table

CREATE TABLE attendance (
attendance_id INT PRIMARY KEY,
emp_id INT,
work_date DATE,
status VARCHAR(20),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);



