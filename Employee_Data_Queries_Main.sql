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

--Display Employee First Name/Last Name/Gender/Salary
SELECT employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

--Display Employees Hired in 1986
SELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';