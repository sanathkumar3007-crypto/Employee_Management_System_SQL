-- This query displays all employees

SELECT * FROM EMPLOYEES;

-- This query displays only employee name and email id

SELECT emp_name, email FROM EMPLOYEES;

-- This query displays employees who working in IT department

SELECT employees.emp_id, employees.emp_name, employees.email, employees.salary, departments.dept_name from employees join departments
on employees.dept_id = departments.dept_id
WHERE departments.dept_name = 'IT';

-- This query displays employee salary greater than 50,000

SELECT * FROM EMPLOYEES
WHERE salary>50000;

-- This query displays employees hired after 2022-01-01

SELECT * FROM EMPLOYEES
WHERE hire_date > '2022-01-01';

-- This query displays employees salary by highest to lowest

SELECT * FROM EMPLOYEES;
ORDER BY salary DESC;

-- This query displays employees name starts with A

SELECT emp_name, emp_id, email, salary FROM EMPLOYEES
WHERE emp_name like 'A%';

-- This query displays employees gmail 

SELECT emp_name, emp_id, email FROM EMPLOYEES
WHERE email LIKE '%gmail%';

-- This query displays total of employees

SELECT COUNT(*) AS Totalemployees FROM EMPLOYEES;

-- This query displays average salary for all employees

SELECT AVG(salary) AS Averagesalary from EMPLOYEES;

-- This query displays total salary paid by each department

SELECT d.dept_name,
      SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- This query displays highest average salary for department

SELECT d.dept_name,
       AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- This query displays departments having more than 1 employee

SELECT departments.dept_name,
       COUNT(employees.emp_id) AS employee_count
FROM Departments 
JOIN Employees  ON departments.dept_id = employees.dept_id
GROUP BY departments.dept_name
HAVING COUNT(employees.emp_id) > 1;

-- This query displays departemnts have average salary greater than 550000

SELECT departments.dept_name, AVG(salary) as Average_salary from departments 
join employees on departments.dept_id = employees.dept_id 
GROUP BY departments.dept_id
HAVING AVG(salary) >55000;

-- This query displays employees name along with departments names

SELECT employees.emp_id, employees.emp_name, employees.email, employees.salary, departments.dept_name from employees LEFT JOIN
departments on employees.dept_id = departments.dept_id;

-- This query displays employees belongs to HR department

SELECT employees.emp_id, employees.emp_name, employees.email, employees.salary, departments.dept_name from employees LEFT JOIN
departments on employees.dept_id = departments.dept_id
WHERE departments.dept_name = 'HR';

-- This query displays attendance details including employee name and status

SELECT attendance.attendance_id, attendance.work_date, attendance.status, employees.emp_name from attendance left join
employees on attendance.emp_id = employees.emp_id;

-- This query displays employees who earn the highest salary

SELECT * from employees 
WHERE salary = (SELECT MAX(salary) from employees);

-- This query displays employees who don't have attendance record

SELECT employees.emp_name, employees.email, employees.salary, attendance.status from employees left join attendance
on employees.emp_id = attendance.emp_id
where attendance.status is NULL;

-- This query displays departments that do not have any employees

SELECT departments.dept_id, departments.dept_name, employees.emp_id from departments left join employees
on departments.dept_id = employees.dept_id
where employees.emp_id is NULL;



