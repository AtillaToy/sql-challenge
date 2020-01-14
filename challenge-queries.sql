---1: List employee number, last name, first name, gender, and salary.

select 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
from employees
inner join salaries on
employees.emp_no = salaries.emp_no;

---2: List employees who were hired in 1986.


select 
	employees.last_name, 
	employees.first_name,
	EXTRACT(YEAR FROM hire_date)
from employees
where EXTRACT(YEAR FROM hire_date) = 1986;

---3:List the manager of each department with the following information: 
-----department number, department name, the manager's employee number, 
-----last name, first name, and start and end employment dates.

select 
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name, 
	employees.first_name,
	dept_emp.from_date, 
	dept_emp.to_date
from dept_manager
join employees on
dept_manager.emp_no = employees.emp_no
join departments on
dept_manager.dept_no = departments.dept_no
join dept_emp on
dept_manager.emp_no = dept_emp.emp_no;


---4:List the department of each employee with the following information: 
----employee number, last name, first name, and department name.

select
	employees.emp_no,
	employees.last_name, 
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on
employees.emp_no = dept_emp.emp_no
join departments on
dept_emp.dept_no = departments.dept_no;

---5:List  "Hercules", last names begin with "B."

select
	employees.first_name,
	employees.last_name 
from employees
where employees.first_name = 'Hercules' and employees.last_name like 'B%';

---6:List employees in Sales, with employee number, last name, first name, and department name

select
	employees.emp_no,
	employees.last_name, 
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on
employees.emp_no = dept_emp.emp_no
join departments on
dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

---7:List employees in Sales & Development
select
	employees.emp_no,
	employees.last_name, 
	employees.first_name,
	departments.dept_name
from employees
join dept_emp on
employees.emp_no = dept_emp.emp_no
join departments on
dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

---8:In descending order, list the frequency count of employee last names

select employees.last_name, count(*)
from employees
group by employees.last_name

