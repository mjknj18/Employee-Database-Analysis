--Employee Data Analysis

--Create Employee Table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE);
	
--Display Employee Table
SELECT *
FROM employees;

--Create Department Table
CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL);
	
--Display Department Table
SELECT *
FROM departments;

--Create Salary Table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
--Display Salary Table
SELECT *
FROM salaries;

--Create Title Table
CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
--Display Title Table
SELECT *
FROM titles;

--Create Department Manager Table
CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
--Display Department Manager Table
SELECT *
FROM dept_manager

--Create Department Employee Table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
--Display Department Employee Table
SELECT *
FROM dept_emp;

--Display Employee Last Name/First Name/Gender/Salary
SELECT employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

--Display Employees Hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--Display Department Manager Dept #/Dept Name/Emp #/Last Name/First Name/Start Date/End Date
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,
	employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;

--Display Employee Emp #/Last Name/First Name/Department Name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees ON dept_emp.emp_no = employees.emp_no;

--Display Employees with First Name of "Hercules" & Last Name Starting with "B"
SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND LEFT(last_name, 1) = 'B';

--Display Sales Department Employee Emp #/Last Name/First Name/Department Name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

--Display Sales/Development Department Employee Dep #/Last Name/First Name/Department Name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--Display Frequency Count of Employee Last Names
SELECT last_name, count(*)
FROM employees
GROUP BY last_name
ORDER BY count DESC;