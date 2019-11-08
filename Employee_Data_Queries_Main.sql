--Employee Data Queries

--Display Employee Last Name/First Name/Gender/Salary
SELECT employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--Display Employees Hired in 1986
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--Display Department Manager Dept #/Dept Name/Emp #/Last Name/First Name/Start Date/End Date
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name,
	employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

--Display Employee Emp #/Last Name/First Name/Department Name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no;

--Display Employees with First Name of "Hercules" & Last Name Starting with "B"
SELECT last_name, first_name
FROM employees
WHERE first_name = 'Hercules'
AND LEFT(last_name, 1) = 'B';

--Display Sales Department Employee Emp #/Last Name/First Name/Department Name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

--Display Sales/Development Department Employee Dep #/Last Name/First Name/Department Name
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

--Display Frequency Count of Employee Last Names
SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;