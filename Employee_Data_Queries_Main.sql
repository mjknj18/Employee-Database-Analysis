--Employee Data Analysis

--Create Employee Table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(1),
	hire_date DATE);
	
--Display Employee Table
SELECT *
FROM employees;

--Create Department Table
CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(30));
	
--Display Department Table
SELECT *
FROM departments;

