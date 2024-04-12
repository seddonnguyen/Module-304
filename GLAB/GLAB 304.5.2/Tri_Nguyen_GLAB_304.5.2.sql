USE classicmodels;

# Example 1: "OR" Operator Examples
# Returns the customers from the USA or France
SELECT customername, country
FROM customers
WHERE country = 'USA'
   OR country = 'France';

# Example 2: "AND" Operator Examples
# Part A: Returns the customers from the USA or France with a credit limit greater than 100000
SELECT customername, country, creditLimit
FROM customers
WHERE (country = 'USA' OR country = 'France')
  AND creditlimit > 100000;

# Part B: Returns the customers from the USA or France with a credit limit greater than 100000
SELECT customername, country, creditLimit
FROM customers
WHERE country = 'USA'
   OR country = 'France' AND creditlimit > 100000;

# Example 3: "BETWEEN" and "NOT BETWEEN" Examples
# Part A: "BETWEEN" Operator Example
# "BETWEEN" Operator is used to select values within a range
# Returns the products with a buy price between 90 and 100
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice BETWEEN 90 AND 100;

# Part B: Lower and Upper Bound Inclusive Example
# Returns the products with a buy price between 90 and 100
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice >= 90
  AND buyPrice <= 100;

# Part C: "NOT BETWEEN" Operator Example
# "NOT BETWEEN" Operator is used to select values outside a range
# Returns the products with a buy price not between 20 and 100
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice NOT BETWEEN 20 AND 100;

# Example 4: "IN" and "NOT IN" Operator Examples
# Part A: "IN" Operator Example
# "IN" Operator is used to specify multiple values in a WHERE clause
# Returns the products with product codes S10_1678, S10_1949, or S10_2016
SELECT productCode, productName, buyPrice
FROM products
WHERE productCode IN ('S10_1678', 'S10_1949', 'S10_2016');

# Part B: "NOT IN" Operator Example
# "NOT IN" Operator is used to exclude multiple values in a WHERE clause
# Returns the products with product codes other than S10_1678, S10_1949, or S10_2016
SELECT productCode, productName, buyPrice
FROM products
WHERE productCode NOT IN ('S10_1678', 'S10_1949', 'S10_2016');

# Part C: "IN" Operator with Subquery Example
# "IN" Operator can be used with a subquery to compare a value to a list of values
# Returns the products that have been ordered more than 50 times
SELECT productCode, productName, buyPrice
FROM products
WHERE productCode IN (SELECT productCode
                      FROM orderdetails
                      WHERE quantityOrdered > 50);

# Example 5: "IS NULL" and "IS NOT NULL" Operator Examples
# Part A: "IS NULL" Operator Example
# "IS NULL" Operator is used to check if a column has a NULL value
# Returns the customers without a sales representative
SELECT customerName, country, salesrepemployeenumber
FROM customers
WHERE salesrepemployeenumber IS NULL
ORDER BY customerName;

# Part B: "IS NOT NULL" Operator Example
# "IS NOT NULL" Operator is used to check if a column has a non-NULL value
# Returns the customers with a sales representative
SELECT customerName, country, salesrepemployeenumber
FROM customers
WHERE salesrepemployeenumber IS NOT NULL
ORDER BY customerName;

# Part C: "LEFT JOIN" predicate and "IS NULL" Operator Example
# "LEFT JOIN" and "IS NULL" can be used to find rows in one table that do not have a match in another table
# Returns the customers without orders
SELECT c.customerNumber, c.customerName, orderNumber, o.STATUS
FROM customers c
         LEFT JOIN orders o
             ON c.customerNumber = o.customerNumber
WHERE orderNumber IS NULL;

# Example 6: "SOME" and "ALL" Operator Examples
# Part A: "SOME" Operator Example
# "SOME" Operator is used to compare a value to a list of values
# Returns the customers with orders that have been shipped
SELECT customerNumber, customerName
FROM customers
WHERE customerNumber = SOME (SELECT customerNumber
                             FROM orders
                             WHERE status = 'Shipped');

# Part B: "ALL" Operator Example
# "ALL" Operator is used to compare a value to all values in a list
# Returns the customers with all orders that have been shipped
SELECT customerNumber, customerName
FROM customers
WHERE customerNumber = ALL (SELECT customerNumber
                            FROM orders
                            WHERE status = 'Shipped');


# Example 7: "LIKE" Operator Examples
# Part A: "LIKE" Operator with Wildcard Example
# "LIKE" Operator is used to search for a specified pattern in a column
# Returns the customers with a last name starting with "B"
SELECT customerName, contactLastName, contactFirstName
FROM customers
WHERE contactLastName LIKE 'B%';

# Part B: "LIKE" Operator with _ Wildcard Example
# "_" Wildcard is used to match any single character
# Returns the customers with a last name that has "B" as the second letter
SELECT customerName, contactLastName, contactFirstName
FROM customers
WHERE contactLastName LIKE 'B__n';

# Part C: "LIKE" Operator with Wildcard in the Middle Example
# Returns the customers with a last name that contains "B" and ends with "o"
SELECT customerName, contactLastName, contactFirstName
FROM customers
WHERE contactLastName LIKE 'B%o';

# Example 8: "EXISTS" Operator Example
# "EXISTS" Operator is used to check if a subquery returns any row
# Returns the customers with orders that have been shipped
SELECT customerNumber, customerName
FROM customers c
WHERE EXISTS (SELECT 1
              FROM orders o
              WHERE c.customerNumber = o.customerNumber
                AND o.status = 'Shipped');

# Example 9: "EXISTS" Operator with "NOT" Example
# "NOT EXISTS" Operator is used to check if a subquery does not return any row
# Returns the customers without orders that have been shipped
SELECT customerNumber, customerName
FROM customers c
WHERE NOT EXISTS (SELECT 1
                  FROM orders o
                  WHERE c.customerNumber = o.customerNumber
                    AND o.status = 'Shipped');

# Example 10: "EXISTS" Operator with "IN" Operator Example
# "IN" Operator can be used with "EXISTS" Operator to compare a value to a list of values
# Returns the customers with orders that have been shipped
SELECT customerNumber, customerName
FROM customers c
WHERE customerNumber IN (SELECT customerNumber
                         FROM orders
                         WHERE status = 'Shipped');

# Example 11: "ANY" and "ALL" Operator Examples
# Part A: "ANY" Operator Example
# "ANY" Operator is used to compare a value to a list of values
# Returns the customers with orders that have been shipped
SELECT customerNumber, customerName
FROM customers c
WHERE customerNumber = ANY (SELECT customerNumber
                            FROM orders
                            WHERE status = 'Shipped');

# Part B: "ALL" Operator Example
# "ALL" Operator is used to compare a value to all values in a list
# Returns the customers with all orders that have been shipped
SELECT customerNumber, customerName
FROM customers c
WHERE customerNumber = ALL (SELECT customerNumber
                            FROM orders
                            WHERE status = 'Shipped');

# Example 12: "UNION" Operator Example
# "UNION" Operator is used to combine the result of two or more SELECT statements
# Returns the customers from the USA and France without duplicates
SELECT customerNumber, customerName
FROM customers
WHERE country = 'USA'

UNION # Returns all rows from two queries and removes duplicates

SELECT customerNumber, customerName
FROM customers
WHERE country = 'France';

# Example 13: "UNION ALL" Operator Example
# "UNION ALL" Operator is used to combine the result of two or more SELECT statements
# Returns the customers from the USA and France without removing duplicates
SELECT customerNumber, customerName
FROM customers
WHERE country = 'USA'

UNION ALL #  Returns all rows from two queries without removing duplicates

SELECT customerNumber, customerName
FROM customers
WHERE country = 'France';

# Example 14: "INTERSECT" Operator Example
# "INTERSECT" Operator is used to return only the common rows between two queries
# Returns the customers from the USA and France
SELECT customerNumber, customerName
FROM customers
WHERE country = 'USA'

INTERSECT # Returns only the common rows between two queries

SELECT customerNumber, customerName
FROM customers
WHERE country = 'France';

# Example 15: "EXCEPT" Operator Example
# "EXCEPT" Operator is used to return only the rows that are in the first query but not in the second query
# Returns the customers from the USA but not from France
SELECT customerNumber, customerName
FROM customers
WHERE country = 'USA'

EXCEPT # Returns only the rows that are in the first query but not in the second query

SELECT customerNumber, customerName
FROM customers
WHERE country = 'France';