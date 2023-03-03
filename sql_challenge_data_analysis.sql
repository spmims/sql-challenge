--1
--Employee Details
--	Employee Number, Last Name, First Name, Sex, Salary
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" AS e
INNER JOIN "Salaries" AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

--2
--Employees Hired in 1986
SELECT emp_no, last_name, first_name, hire_date 
FROM "Employees" 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3
--Manager of Each Department Information
--Department Number, Department Name
--	Employee Number, Last Name, First Name
SELECT d.dept_no,d.dept_name,e.title_id,e.last_name,e.first_name
FROM "Dept_Emp" as de
LEFT JOIN "Employees" as e
ON e.emp_no = de.emp_no
LEFT JOIN "Departments" as d
ON d.dept_no = de.dept_no
WHERE e.title_id LIKE 'm%'

--4
--List Department Number For Employees Based on the Following
--	Employee Number, Last Name, First Name, Department Name
CREATE VIEW All_Employees AS
SELECT e.emp_no,e.title_id, e.birth_date, e.last_name, e.first_name, e.sex, e.hire_date, d.dept_name, d.dept_no
FROM "Dept_Emp" as de
LEFT JOIN "Employees" as e
ON e.emp_no = de.emp_no
LEFT JOIN "Departments" as d
ON d.dept_no = de.dept_no;

SELECT * FROM All_Employees;

--Display in a Table
SELECT emp_no, last_name, first_name, dept_name
FROM All_Employees;

--5
--List Employees Named Hercules
SELECT e.last_name, e.first_name
FROM "Employees" AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%')
ORDER BY e.last_name;

--Set Up Current Departments Table
SELECT DISTINCT ON (emp_no) *
INTO current_dept_emp
FROM "Dept_Emp"
ORDER BY emp_no DESC;

--6
--List All Employees From Sales Department
--Including the Following Information
--	Employee Number, Last Name, First Name, Department Name
CREATE VIEW Sales_Table as
SELECT emp_no,last_name, first_name, dept_name
FROM All_Employees;

--Display in a Table
SELECT * FROM Sales_Table
WHERE dept_name = 'Sales';

--7
--List All Employees in the Sales and Development Departments
--Including the Following Information
--	Employee Number, Last Name, First Name, Department Name
SELECT emp_no, last_name, first_name, dept_name FROM All_Employees
WHERE dept_name IN ('Sales', 'Development')

--8
--List Frequency Couunt of Employee Last Names in Descending Order
SELECT last_name, COUNT(last_name) as Frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;