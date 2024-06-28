-- Question: List the employee number, last name, first name, sex, and salary of each employee.
-- SELECT used to obtain the required cells/columns
-- FROM used to grab those cells/columns from the employees table
-- Then JOIN is used to bring in the salaries table, connected through emp_no in order for the corresponding names to emp no to salary, etc
SELECT emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries USING (emp_no);

-- Question: List the first name, last name, and hire date for the employees who were hired in 1986.
-- SELECT and FROM are used in a similar way
-- WHERE is used by basing the selected data off of the hire_date, 
-- specifically relating to BETWEEN the two set dates, using AND to separate them
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Question: List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- SELECT and FROM are used a similar way
-- I started using aliases here to make it a bit easier.
-- dm means dept_manager
-- d means departments
-- e means employees
SELECT dm.emp_no, d.dept_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- Question: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- Nothing to note
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- Question: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
-- WHERE is used to look for a specific value, basically a limiter on what information to look for
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Question: List each employee in the Sales department, including their employee number, last name, and first name.
-- Since it's Sales, WHERE looks for Sales.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Question: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Since it's within Sales and Development, WHERE and IN
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- Question: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
-- GROUP BY is used for grouping by last name, then the group is reorganized with ORDER BY using frequency and DESCending.
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
