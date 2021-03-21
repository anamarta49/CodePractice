-- MySql exercise
-- 1.Write a query to display the name (first_name and last_name) and
-- department ID of all employees in departments 30 or 100 in ascending order.
SELECT CONCAT(first_name, " ", last_name) AS name, department_id
FROM employees
WHERE (department_id=30 OR department_id=100)
ORDER BY name;

-- 2. Write a query to find the manager ID and the salary of the lowest-paid
-- employee for that manager.
SELECT manager_id, MIN(salary) AS lowest_employee_sal
FROM employees
GROUP BY manager_id;

-- 3. Write a query to find the name (first_name and last_name) and the salary
-- of the employees who earn more than the employee whose last name is Bell.
SELECT CONCAT(first_name, " ", last_name) AS name, salary
FROM employees
WHERE salary>(SELECT salary
              FROM employees
              WHERE last_name='Bell');

-- 4. Write a query to find the name (first_name and last_name), job,
-- department ID and name of all employees that work in London.
SELECT CONCAT(first_name, " ", last_name) AS name, job_title, employees.department_id, department_name
FROM employees, jobs, departments, locations
WHERE employees.job_id=jobs.job_id
  AND employees.department_id=departments.department_id
  AND departments.location_id=locations.location_id
  AND city='London';
