--list employees with employee number, last name, first name, gender, and salary
select employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
from salaries
inner join employees on
employees.emp_no=salaries.emp_no;

--list employees who were hired in 1986
select * from employees 
where EXTRACT(year FROM "hire_date") = 1986;

--list manager of each department with department number, department name, manager's employee number, last name, first name, start 
--and end of employment dates
select employees.emp_no, employees.first_name, employees.last_name, employees.hire_date, dept_manager.to_date, 
dept_manager.dept_no, departments.dept_name
from dept_manager
inner join employees on employees.emp_no=dept_manager.emp_no
inner join departments on departments.dept_no = dept_manager.dept_no;

--list departments of each employee with employee number, last name, first name, and department name
select departments.dept_name, employees.emp_no, employees.first_name, employees.last_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

--list all employees whose first name is 'Hercules' and last names begin with a 'B'
select first_name, last_name, emp_no from employees where first_name = 'Hercules' and last_name ~ 'B';

--List all employees in the Sales department with employee number, last name, first name, and department name
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

--List all employees in Sales and Development departments with employee number, last name, first name, department name
select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name in ('Development','Sales');

--In descending order, list the frequency count of employee last names
select last_name, count(*) from employees
group by last_name
order by count DESC;