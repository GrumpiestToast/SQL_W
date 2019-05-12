CREATE TABLE departments (
	dept_no VARCHAR(55),
	dept_name VARCHAR(55)
);

CREATE TABLE dept_emp(
	emp_no INTEGER,
	dept_no VARCHAR (60),
	from_date DATE,
	to_date DATE
	);
	
	
CREATE TABLE dept_manager(
	dept_no VARCHAR(60),
	emp_no INTEGER,
	from_date DATE,
	to_date DATE
	);

CREATE TABLE employees(
	emp_no INTEGER,
	birth_date DATE,
	first_name VARCHAR(200),
	last_name VARCHAR(200),
	gender VARCHAR(20),
	hire_date DATE
	);
	
CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER,
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles(
	emp_no INTEGER,
	title VARCHAR(200),
	from_date DATE,
	to_date DATE
);

SELECT last_name, first_name, gender, salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no


select last_name, first_name, hire_date
  from employees
 where date_part('year', hire_date) = 1986 
       

--List the manager of each department with the following information: 
--department number, department name, the manager's
--employee number, last name, first name, and start and end employment dates

SELECT  last_name, first_name, from_date, to_date, dept_name, departments.dept_no
from dept_manager
left join employees ON dept_manager.emp_no = employees.emp_no
left join departments ON dept_manager.dept_no = departments.dept_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, last_name, first_name, dept_name 
from dept_emp
LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees ON employees.emp_no = dept_emp.emp_no



--List all employees
--whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
From Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT dept_emp.emp_no, last_name, first_name, dept_name 
FROM dept_emp
LEFT JOIN employees ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.


SELECT dept_emp.emp_no, last_name, first_name, dept_name 
FROM dept_emp
LEFT JOIN employees ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'


--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT DISTINCT last_name, COUNT(last_name)  
FROM employees
GROUP BY last_name
ORDER BY last_name

--Import the SQL database into Pandas. (Yes, you could read the CSVs directly 
--in Pandas, but you are, after all, trying to prove your technical mettle.) 
--This step may require some research. Feel free to use the code below to get started. 
--Be sure to make any necessary modifications 
--for your username, password, host, port, and database name:







