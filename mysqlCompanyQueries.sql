-- MySql exercise
-- 1.Write a query to display the name (first_name and last_name) and
-- department ID of all employees in departments 30 or 100 in ascending order.
SELECT CONCAT(first_name, " ", last_name) AS name, department_id
FROM employees
WHERE (department_id=30 OR department_id=100)
ORDER BY name;

-- 2. Write a query to find the manager ID and the salary of the lowest-paid
-- employee for that manager.
