# Employee-Database-Analysis

The goal of this project was to extract, process, and analyze corporate employee data contained in multiple CSV datasets. The former tasks were completed using SQL queries (through PostgreSQL) to store and inspect the data, and the latter was performed using Python with Pandas, Numpy, and Matplotlib (through Jupyter Notebooks) to generate meaningful visualizations.

## Questions

### Data Modeling

1. How do the datasets of employee data relate to each other?

### Data Engineering

1. What is the employee number, last name, first name, gender, and salary of each employee?
2. What is the last name, first name, and hire date of each employee hired in 1986?
3. What is/are the department number(s), department name(s), employee number, last name, first name, start date(s), and end date(s) of each department manager?
4. What is/are the employee number, last name, first name, and department name(s) of each employee?
5. What is the last name and first name of each employee whose last name begins with B and first name is Hercules?
6. What is the employee number, last name, and first name of each employee ever assigned to the sales department?
7. What is the employee number, last name, and first name of each employee ever assigned to the sales and development departments?
8. In descending order, what is the frequency count of employee last names?

### Data Analysis

1. What are the most common employee salary ranges?
2. What is the average salary for each employee title?

## Datasets

1. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Data/departments.csv
2. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Data/dept_emp.csv
3. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Data/dept_manager.csv
4. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Data/employees.csv
5. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Data/salaries.csv
6. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Data/titles.csv

## Tasks

### Data Modeling

1. Inspect employee data CSV datasets.
2. Determine parameters for primary and foreign keys.
3. Create table schema in online entity relationship diagram (ERD) software (http://www.quickdatabasediagrams.com/).
4. Connect tables with foreign keys to tables with matching primary keys.

### Data Engineering

1. Create PostgreSQL database for employee data.
2. Create table schema in database.
3. Import employee data CSV datasets into appropriate tables.
4. Perform appropriate queries, within and between tables, to obtain desired data.

### Data Analysis

1. Establish connection between PostgreSQL database and Jupyter Notebook file.
2. Extract list of table names from database.
3. Extract table metadata from database.
4. Extract table data from database to identically named Pandas data frames.
5. Replace null values in each data frame with appropriate default values.
6. Calculate minimum and maximum employee salary.
7. Generate equally sized salary range bins based on minimum and maximum salaries.
8. Calculate number of salaries within each bin.
9. Plot histogram of employee salary frequencies.
10. Merge employee salary and title data frames into single data frame.
11. Group data by title and calculate average salary for each title.
12. Plot bar chart of average employee salary by title.

## Results

### Data Modeling

<img src = https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Images/Employee_Data_ERD.PNG>

### Data Engineering

1. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%201%20Results.csv
2. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%202%20Results.csv
3. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%203%20Results.csv
4. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%204%20Results.csv
5. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%205%20Results.csv
6. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%206%20Results.csv
7. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%207%20Results.csv
8. https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Employee%20Query%20Data/Employee%20Data%20Query%208%20Results.csv

### Data Analysis

<img src = https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Images/Employee_Salary_Distribution.png>

<img src = https://github.com/mjknj18/Employee-Database-Analysis/blob/master/Images/Average_Employee_Salary.png>

## Observations

### Data Modeling

1. There are two primary keys of employee number and department number in the employees and departments tables respectively.
2. Employee number is a foreign key in the titles, salaries, and department employee tables, which links them to the employees table.
3. Department number is a foreign key in the department manager and department employee tables, which links them to the departments table.

### Data Engineering

1. There are 300,024 employees in the database for whom a salary record is present.
2. There were 36,150 employees hired in 1986.
3. Only 24 employees have been managers of the 9 departments.
4. There are 331,603 employees in the database for whom a department assignment is present.
5. Only 20 employees have a last name that begins with B and a first name of Hercules.
6. A total of 52,245 employees have been assigned to the sales department.
7. A total of 137,952 employees have been assigned to either the sales or development departments.
8. There are 1,638 unique last names, with all but one having over 140 occurences.

### Data Analysis

1. The vast majority of employees have salaries between $40,000 and $50,000, with a significant decrease in frequency between that and the $50,000 to $60,000 range.
2. The decreases in frequency slowly reduce across the remaining salary ranges, as the total salary counts drop off towards zero.
3. Senior staff and staff have the highest average salaries, followed by managers.
4. Senior engineers, engineers, assistant engineers, and technique leaders all have roughly the same average salary.

## Disclaimer

The baseline data used for this analysis was provided by a third party source and its accuracy in relation to actual corporate employee data is unknown.