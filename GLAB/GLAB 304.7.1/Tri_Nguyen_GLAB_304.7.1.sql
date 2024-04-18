SELECT *
FROM departments
WHERE location_id = 1700;

SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id IN (1, 3, 9, 10, 11)
ORDER BY first_name, last_name;

-- Subqueries with WHERE clause

-- Using IN operator
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM departments
                        WHERE location_id = 1700)
ORDER BY first_name, last_name;

-- Using NOT IN operator
SELECT employee_id, first_name, last_name
FROM employees
WHERE department_id NOT IN (SELECT department_id
                            FROM departments
                            WHERE location_id = 1700)
ORDER BY first_name, last_name;

-- Using = operator
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees)
ORDER BY first_name, last_name;

-- Using > operator
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Using EXISTS operator
SELECT department_name
FROM departments d
WHERE EXISTS (SELECT *
              FROM employees e
              WHERE salary > 10000 AND e.department_id = d.department_id)
ORDER BY department_name;

-- Using NOT EXISTS operator
SELECT department_name
FROM departments d
WHERE NOT EXISTS (SELECT *
                  FROM employees e
                  WHERE salary > 10000 AND e.department_id = d.department_id)
ORDER BY department_name;

-- Subqueries with FROM clause
-- Average salary of each department
SELECT AVG(salary) average_salary
FROM employees
GROUP BY department_id;

-- Average salary of all departments
SELECT ROUND(AVG(average_salary), 0)
FROM (SELECT AVG(salary) AS average_salary
      FROM employees
      GROUP BY department_id) department_salary;

-- Product sales in 2003
SELECT productCode, ROUND(SUM(quantityOrdered * priceEach)) AS sales
FROM classicmodels.orderdetails
    INNER JOIN classicmodels.orders USING (orderNumber)
WHERE YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;

SELECT productName, sales
FROM (SELECT productCode, ROUND(SUM(quantityOrdered * priceEach)) AS sales
      FROM classicmodels.orderdetails
          INNER JOIN classicmodels.orders USING (orderNumber)
      WHERE YEAR(shippedDate) = 2003
      GROUP BY productCode
      ORDER BY sales DESC
      LIMIT 5) AS top5products2003
    INNER JOIN classicmodels.products USING (productCode);