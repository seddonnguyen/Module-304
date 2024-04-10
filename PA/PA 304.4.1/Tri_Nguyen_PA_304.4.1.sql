# Task 1

SELECT productName AS 'Name', productLine AS 'Product Line', buyPrice AS 'Buy Price'
FROM products
ORDER BY buyPrice DESC;

# Task 2
SELECT contactFirstName AS 'First Name', contactLastName AS 'Last Name', city AS 'City'
FROM customers
WHERE country = 'Germany'
ORDER BY 2;

# Task 3
SELECT DISTINCT status
FROM orders
ORDER BY 1;

# Task 4
SELECT *
FROM payments
WHERE paymentDate >= '2005-01-01'
ORDER BY paymentDate DESC;

# Task 5
SELECT lastName AS 'Last Name', firstName AS 'First Name', email AS 'Email', jobTitle AS 'Job Title'
FROM employees e
         LEFT JOIN offices o ON e.officeCode = o.officeCode
WHERE city = 'San Francisco'
ORDER BY 1;

# Task 6
SELECT productName AS 'Name', productLine AS 'Product Line', productScale AS 'Scale', productVendor AS 'Vendor'
FROM products
WHERE productLine IN ('Classic Cars', 'Vintage Cars')
ORDER BY 2 DESC, 1;