# Example 1 Part 1
SELECT orderNumber, orderLineNumber, quantityOrdered * priceEach
FROM orderdetails
ORDER BY 3 DESC;

# Example 1 Part 2
SELECT orderNumber, orderLineNumber, quantityOrdered * priceEach AS subtotal
FROM orderdetails
ORDER BY 3 DESC;

# Example 2 Part 1
SELECT firstName, lastName, reportsTo
FROM employees
ORDER BY 3;

# Example 2 Part 2
SELECT firstName, lastName, reportsTo
FROM employees
ORDER BY 3 DESC;