USE classicmodels;

# Example 1: Using MOD() function
SELECT orderNumber, SUM(quantityOrdered) AS Qty, IF(MOD(SUM(quantityOrdered), 2), 'Odd', 'Even') AS oddOrEven
FROM orderdetails
GROUP BY 1
ORDER BY 1;

# Example 2: Using Truncate() function
SELECT TRUNCATE(1.555, 1); # Result: 1.5

# Example 3: Using ROUND() function

# Part 1
SELECT productCode, AVG(quantityOrdered * priceEach) AS avg_order_value
FROM orderdetails
GROUP BY 1;

# Part 2
SELECT productCode,
       ROUND(AVG(quantityOrdered * priceEach)) AS avg_order_item_value
FROM orderDetails
GROUP BY productCode;

# Example 4: Using Replace() function
# Syntax: REPLACE(str, from_str, to_str)
# str: The string to search and replace
# from_str: The substring to be replaced
# to_str: The replacement substring
UPDATE products
SET productDescription = REPLACE(productDescription, 'abuot', 'about');

# Example 5: Using DATEDIFF() function
# Syntax: DATEDIFF(date1, date2)
# date1, date2: The dates to be compared

# Part 1:
SELECT DATEDIFF('2011-08-17', '2011-08-17'); # Result: 0 days

SELECT DATEDIFF('2011-08-17', '2011-08-08'); # Result: 9 days

SELECT DATEDIFF('2011-08-08', '2011-08-17'); # Result: -9 days

# Part 2a:
SELECT orderNumber, DATEDIFF(requiredDate, shippedDate) AS daysLeft
FROM orders
ORDER BY daysLeft DESC;

# Part 2b:
SELECT orderNumber, DATEDIFF(requiredDate, orderDate) AS remaining_days
FROM orders
WHERE status = 'In Process'
ORDER BY remaining_days;

# Part 2c:
SELECT orderNumber,
       ROUND(DATEDIFF(requiredDate, orderDate) / 7, 2),
       ROUND(DATEDIFF(requiredDate, orderDate) / 30, 2)
FROM orders
WHERE status = 'In Process';

# Example 6: Using DATE_FORMAT() function
# Syntax: DATE_FORMAT(date, format)
# format: %Y - Year, %m - Month, %d - Day, %a - Abbreviated weekday name, %D - Day of the month with English suffix, %b - Abbreviated month name, %W - Weekday name

# Part 1:
SELECT orderNumber,
       DATE_FORMAT(orderdate, '%Y-%m-%d')       orderDate,
       DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
       DATE_FORMAT(shippedDate, '%W %D %M %Y')  shippedDate
FROM orders;

# Part 2:
SELECT orderNumber,
       DATE_FORMAT(shippeddate, '%W %D %M %Y') AS 'Shipped date'
FROM orders
ORDER BY shippeddate;

# Example 7: Using LPAD(str, len, padstr) function
# Syntax: LPAD(str, len, padstr)
# str: The string to be left-padded
# len: The length of the resulting string
# padstr: The string used to pad the original string

# Part 1:
SELECT LPAD('hi', 4, '??'); # Result: '??hi'
SELECT LPAD('hi', 1, '??'); # Result: 'h'

# Part 2:
SELECT firstName, LPAD(firstName, 10, 'kk'), LPAD(firstName, 5, 'kk'), LPAD(firstName, 4, 'kk')
FROM employees;

# Example 7: Using TRIM() function
# Syntax: TRIM([BOTH | LEADING | TRAILING] [remstr FROM] str)
# str: The string to be trimmed
# remstr: The characters to be removed
# BOTH: Removes the leading and trailing characters
# LEADING: Removes the leading characters
# TRAILING: Removes the trailing characters
SELECT TRIM(' SQL TRIM Function '); # Result: 'SQL TRIM Function'

# Example 8: SQL LTRIM() and RTRIM() functions

# Part 1: LTRIM() function
# Syntax: LTRIM(str)
# str: The string to be trimmed
# Removes the leading spaces from a string
SELECT LTRIM('  SQL LTRIM function'); # Result: 'SQL LTRIM function'

# Part 2: RTRIM() function
# Syntax: RTRIM(str)
# str: The string to be trimmed
# Removes the trailing spaces from a string
SELECT RTRIM('SQL RTRIM function  '); # Result: 'SQL RTRIM function'

# Example 9: Using YEAR() function
# Part 1:
SELECT YEAR('2002-01-01'); # Result: 2002

# Part 2:
SELECT YEAR(shippeddate) AS year, COUNT(ordernumber) AS orderQty
FROM orders
GROUP BY YEAR(shippeddate)
ORDER BY YEAR(shippeddate);

# Example 10: Using DAY() function
SELECT DAY('2022-01-05'); # Result: 5

# Example 11: Using MONTH() function
SELECT MONTH('2022-01-05'); # Result: 1

# Example 12: Using DAYNAME() function
SELECT DAYNAME('2022-01-05'); # Result: Wednesday

# Example 13: Using DAYOFWEEK() function
SELECT DAYOFWEEK('2022-01-05'); # Result: 4

# Example 14: Using DAYOFYEAR() function
SELECT DAYOFYEAR('2022-01-05'); # Result: 5

# Example 15: Using WEEK() function
SELECT WEEK('2022-01-05'); # Result: 1

# Example 16: Using WEEKDAY() function
SELECT WEEKDAY('2022-01-05'); # Result: 2

# Example 17: Using HOUR() function
SELECT HOUR('2022-01-05 12:30:45'); # Result: 12

# Example 18: Using MINUTE() function
SELECT MINUTE('2022-01-05 12:30:45'); # Result: 30

# Example 19: Using SECOND() function
SELECT SECOND('2022-01-05 12:30:45'); # Result: 45

# Example 20: Using NOW() function
SELECT NOW(); # Result: 2022-01-05 12:30:45

# Example 21: Using CURDATE() function
SELECT CURDATE(); # Result: 2022-01-05

# Example 22: Using CURTIME() function
SELECT CURTIME(); # Result: 12:30:45

# Example 23: Using DATE_ADD() function
# Date_Add() function adds a specified time interval to a date.
# Syntax: DATE_ADD(date, INTERVAL value unit)
# Part 1:
SELECT DATE_ADD('2022-01-05', INTERVAL 1 DAY); # Result: 2022-01-06

# Part 2:
SELECT DATE_ADD('2022-01-05', INTERVAL 1 MONTH); # Result: 2022-02-05

# Part 3:
SELECT DATE_ADD('2022-01-05', INTERVAL 1 YEAR); # Result: 2023-01-05

# Part 4:
SELECT DATE_ADD('2022-01-05', INTERVAL 1 HOUR); # Result: 2022-01-05 01:00:00

# Part 5:
SELECT DATE_ADD('2022-01-05', INTERVAL 1 MINUTE); # Result: 2022-01-05 00:01:00

# Part 6:
SELECT DATE_ADD('2022-01-05', INTERVAL 1 SECOND); # Result: 2022-01-05 00:00:01

# Example 24: Using DATE_SUB() function
# Date_Sub() function subtracts a specified time interval from a date.
# Syntax: DATE_SUB(date, INTERVAL value unit)
# Part 1:
SELECT DATE_SUB('2022-01-05', INTERVAL 1 DAY); # Result: 2022-01-04

# Part 2:
SELECT DATE_SUB('2022-01-05', INTERVAL 1 MONTH); # Result: 2021-12-05

# Part 3:
SELECT DATE_SUB('2022-01-05', INTERVAL 1 YEAR); # Result: 2021-01-05

# Part 4:
SELECT DATE_SUB('2022-01-05', INTERVAL 1 HOUR); # Result: 2022-01-04 23:00:00

# Part 5:
SELECT DATE_SUB('2022-01-05', INTERVAL 1 MINUTE); # Result: 2022-01-04 23:59:00

# Part 6:
SELECT DATE_SUB('2022-01-05', INTERVAL 1 SECOND); # Result: 2022-01-04 23:59:59