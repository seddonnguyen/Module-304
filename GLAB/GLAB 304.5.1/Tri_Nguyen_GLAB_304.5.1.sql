USE classicmodels;

-- Example 1: Using MOD() function
-- The MOD() function is used to calculate the remainder of a division.
-- Returns the remainder of the division of the dividend by the divisor.
-- Syntax: MOD(dividend, divisor)

-- dividend: The number to be divided
-- If the dividend is positive, the result is positive.
-- If the dividend is negative, the result is negative.
-- If the dividend is 0, the result is 0.
-- If the dividend is NULL, the result is NULL.
-- If the dividend is an integer, the result is an integer.
-- If the dividend is a floating-point number, the result is a floating-point number.

-- divisor: The number to divide by
-- If the divisor is positive, the result is positive.
-- If the divisor is negative, the result is negative.
-- If the divisor is 0, the result is NULL.
-- If the divisor is NULL, the result is NULL.
-- If the divisor is an integer, the result is an integer.
-- If the divisor is a floating-point number, the result is a floating-point number.

-- Part 1:
SELECT MOD(-5, 2); -- Result: -1
SELECT MOD(-5, -2); -- Result: -1
SELECT MOD(5, -2); -- Result: 1
SELECT MOD(-5, 0); -- Result: NULL
SELECT MOD(0, 5); -- Result: 0
SELECT MOD(5, 0); -- Result: NULL
SELECT MOD(0, 0); -- Result: NULL
SELECT MOD(5, 2); -- Result: 1
SELECT MOD(5, 3); -- Result: 2
SELECT MOD(5, 5); -- Result: 0
SELECT MOD(5, 0); -- Result: NULL
SELECT MOD(5, NULL); -- Result: NULL
SELECT MOD(5.5, 2); -- Result: 1.5
SELECT MOD(5.5, 2.5); -- Result: 0.5
SELECT MOD(5.5, 0); -- Result: NULL
SELECT MOD(5.5, NULL);
-- Result: NULL

-- Part 2:
SELECT orderNumber, SUM(quantityOrdered) AS Qty, IF(MOD(SUM(quantityOrdered), 2), 'Odd', 'Even') AS oddOrEven
FROM orderdetails
GROUP BY 1
ORDER BY 1;

-- Example 2: Using Truncate() function
-- The Truncate() function truncates a number to a specified number of decimal places.
-- Returns the number truncated to the specified decimal places.
-- Syntax: TRUNCATE(number, decimal_places)

-- number: The number to be truncated
-- If the number is positive, it truncates towards zero.
-- If the number is negative, it truncates away from zero.
-- If the number is NULL, the result is NULL.
-- If the number is an integer, the result is the number itself.
-- If the number is a floating-point number, the result is the number truncated to the specified decimal places.
-- If the number is a string that can be converted to a number, the result is the number truncated to the specified decimal places.

-- decimal_places: The number of decimal places to truncate to
-- If the decimal_places is not specified, an error occurs.
-- If the decimal_places is NULL, the result is NULL.
-- If the decimal_places is negative, the result is NULL.
-- If the decimal_places is greater than the number of decimal places in the number, the result is the number itself.
-- If the decimal_places is an integer, the result is the number truncated to the specified decimal places.

-- SELECT TRUNCATE(1.555); -- Result: Error
-- SELECT TRUNCATE(-1.555); -- Result: Error
SELECT TRUNCATE(1.555, NULL); -- Result: NULL
SELECT TRUNCATE(1.555, 0); -- Result: 1
SELECT TRUNCATE(1.555, 1); -- Result: 1.5
SELECT TRUNCATE(1.555, 2); -- Result: 1.55
SELECT TRUNCATE(1.555, 3); -- Result: 1.555
SELECT TRUNCATE(1.555, 4);
-- Result: 1.555

-- Example 3: Using ROUND() function
-- The ROUND() function rounds a number to a specified number of decimal places.
-- Returns the number rounded to the specified decimal places.
-- Syntax: ROUND(number, decimal_places)

-- number: The number to be rounded
-- If the number is positive, it rounds to the nearest number.
-- If the number is negative, it rounds to the nearest number.
-- If the number is NULL, the result is NULL.
-- If the number is an integer, the result is the number itself.
-- If the number is a floating-point number, the result is the number rounded to the specified decimal places.
-- If the number is a string that can be converted to a number, the result is the number rounded to the specified decimal places.

-- decimal_places: The number of decimal places to round to
-- If the decimal_places is not specified, the result is the number rounded to 0 decimal places.
-- If the number is positive, it rounds to the nearest number.
-- If the number is negative, it rounds to the nearest number.
-- If the number is NULL, the result is NULL.
-- If the number is an integer, the result is the number itself.
-- If the number is a floating-point number, the result is the number rounded to the specified decimal places.
-- If the number is a string that can be converted to a number, the result is the number rounded to the specified decimal places.

-- Part 1:
SELECT ROUND(1.555); -- Result: 2
SELECT ROUND(1.555, 0); -- Result: 2
SELECT ROUND(1.555, 1); -- Result: 1.6
SELECT ROUND(1.555, 2); -- Result: 1.56
SELECT ROUND(1.555, 3); -- Result: 1.555
SELECT ROUND(1.555, 4); -- Result: 1.555
SELECT ROUND(-1.555); -- Result: -2
SELECT ROUND(-1.555, 0); -- Result: -2
SELECT ROUND(-1.555, 1); -- Result: -1.6
SELECT ROUND(-1.555, 2); -- Result: -1.56
SELECT ROUND(-1.555, 3); -- Result: -1.555
SELECT ROUND(-1.555, 4); -- Result: -1.555
SELECT ROUND(1.555, -1);
-- Result: 0

-- Part 2
SELECT productCode,
       ROUND(AVG(quantityOrdered * priceEach)) AS avg_order_item_value
FROM orderDetails
GROUP BY productCode;

-- Example 4: Using Replace() function
-- The REPLACE() function replaces all occurrences of a substring in a string.
-- Returns the string with all occurrences of the from_str replaced with the to_str.
-- Syntax: REPLACE(str, from_str, to_str)

-- str: The string to search and replace
-- If the string is NULL, the result is an error.
-- If the string is an empty string, the result is an empty string.
-- If the string is a non-empty string, the result is the string with all occurrences of the from_str replaced with the to_str.

-- from_str: The substring to be replaced
-- If the from_str is NULL, the result is NULL.
-- If the from_str is an empty string, the result is the original string.
-- If the from_str is a non-empty string, the result is the original string with all occurrences of the from_str replaced with the to_str.

-- to_str: The replacement substring
-- If the to_str is NULL, the result is NULL.
-- If the to_str is an empty string, the result is the original string with all occurrences of the from_str removed.
-- If the to_str is a non-empty string, the result is the original string with all occurrences of the from_str replaced with the to_str.

-- Part 1:
-- SELECT (NULL, 'World', 'Universe'); -- Result: Error
SELECT REPLACE('', 'World', 'Universe'); -- Result: ''
SELECT REPLACE('Hello World', 'World', 'Universe'); -- Result: 'Hello Universe'
SELECT REPLACE('Hello World', NULL, 'Universe'); -- Result: NULL
SELECT REPLACE('Hello World', '', 'Universe'); -- Result: 'Hello World'
SELECT REPLACE('Hello World', 'World', NULL); -- Result: NULL
SELECT REPLACE('Hello World', 'World', '');
-- Result: 'Hello '

-- Part 2:
UPDATE products
SET productDescription = REPLACE(productDescription, 'abuot', 'about');

-- Example 5: Using DATEDIFF() function
-- The DATEDIFF() function calculates the number of days between two dates.
-- Returns the number of days between two dates.
-- Syntax: DATEDIFF(date1, date2)

-- date1, date2: The dates to be compared
-- If either date1 or date2, or Both is NULL, the result is NULL.
-- If either date1 or date2, or Both is not a valid date, the result is NULL.
-- If date1 is a valid date, the result is the number of days between date1 and date2.
-- If date1 is earlier than date2, the result is negative.
-- If date1 is later than date2, the result is positive.
-- If date1 is the same as date2, the result is 0.

-- Part 1:
SELECT DATEDIFF(NULL, '2022-01-01'); -- Result: NULL
SELECT DATEDIFF('2022-01-01', NULL); -- Result: NULL
SELECT DATEDIFF(NULL, NULL); -- Result: NULL
SELECT DATEDIFF('', '2011-08-17'); -- Result: NULL
SELECT DATEDIFF('2011-08-17', ''); -- Result: NULL
SELECT DATEDIFF('', ''); -- Result: NULL
SELECT DATEDIFF('2011-08-17', '2011-08-17'); -- Result: 0 days
SELECT DATEDIFF('2011-08-17', '2011-08-08'); -- Result: 9 days
SELECT DATEDIFF('2011-08-08', '2011-08-17'); -- Result: -9 days
SELECT DATEDIFF('2011-08-17', '2011-08-18'); -- Result: -1 days
SELECT DATEDIFF('2011-08-18', '2011-08-17');
-- Result: 1 days

-- Part 2a:
SELECT orderNumber, DATEDIFF(requiredDate, shippedDate) AS daysLeft
FROM orders
ORDER BY daysLeft DESC;

-- Part 2b:
SELECT orderNumber, DATEDIFF(requiredDate, orderDate) AS remaining_days
FROM orders
WHERE status = 'In Process'
ORDER BY remaining_days;

-- Part 2c:
SELECT orderNumber,
       ROUND(DATEDIFF(requiredDate, orderDate) / 7, 2),
       ROUND(DATEDIFF(requiredDate, orderDate) / 30, 2)
FROM orders
WHERE status = 'In Process';

-- Example 6: Using DATE_FORMAT() function
-- The DATE_FORMAT() function formats a date as a string.
-- Returns a date formatted as a string.
-- Syntax: DATE_FORMAT(date, format)

-- date: The date to be formatted
-- If the date is NULL, the result is NULL.
-- If the date is not a valid date, the result is NULL.
-- If the date is a valid date, the result is the date formatted as a string.
-- The date can be a string that can be converted to a date.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- If the date is a string, the format must be 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a date, the time part is set to '00:00:00'.
-- If the date is a datetime, the time part is included.
-- If the date is a timestamp, the time part is included.


-- format: The format to use for the date
-- The format can be any valid date format string.

-- The format can include the following placeholders:
-- Year: %Y, %y
-- %Y: Year with century as a numeric value (0000-9999)
-- %y: Year without century as a numeric value (00-99)

-- Month: %b, %M, %m, %c
-- %b: Abbreviated month name (Jan-Dec)
-- %M: Full month name (January-December)
-- %m: Month as a numeric value (00-12)
-- %c: Month as a numeric value (0-12)

-- Weekday: %a, %W, %w
-- %a: Abbreviated day of the week (Sun-Sat)
-- %W: Full day of the week (Sunday-Saturday)
-- %w: Day of the week (0=Sunday, 1=Monday, ..., 6=Saturday)

-- Day: %D, %d, %e
-- %D: Day of the month with ordinal suffix (1st-31st)
-- %d: Day of the month as a numeric value (01-31)
-- %e: Day of the month as a numeric value (1-31)

-- Time: %T, %r
-- %T: Time in 24-hour format (HH:MM:SS)
-- %r: Time in 12-hour format (HH:MM:SS AM/PM)

-- Hour: %H, %h, %k, %l, %I
-- %H: Hour (00-23)
-- %h: Hour (01-12)
-- %k: Hour (0-23)
-- %l: Hour (1-12)
-- %I: Hour (01-12)

-- Minute: %i
-- %i: Minute (00-59)

-- Second: %s
-- %s: Second (00-59)

-- AM/PM: %p
-- %p: AM or PM

-- Timezone: %z, %Z
-- %z: Timezone offset in the format '+HH:MM' or '-HH:MM'
-- %Z: Timezone name or abbreviation

-- Part 1:
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %H:%i:%s'); -- Result: '2022-01-05 12:30:45'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %r'); -- Result: '2022-01-05 12:30:45 PM'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %T'); -- Result: '2022-01-05 12:30:45'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %p'); -- Result: '2022-01-05 PM'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %z'); -- Result: '2022-01-05 +00:00'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %Z'); -- Result: '2022-01-05 UTC'

SELECT DATE_FORMAT('2022-01-05', '%Y-%m-%d'); -- Result: '2022-01-05'
SELECT DATE_FORMAT('2022-01-05', '%a %D %b %Y'); -- Result: 'Wed 5th Jan 2022'
SELECT DATE_FORMAT('2022-01-05', '%W %D %M %Y'); -- Result: 'Wednesday 5th January 2022'

SELECT DATE_FORMAT('2022-01-05', '%H:%i:%s'); -- Result: '00:00:00'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%H:%i:%s'); -- Result: '12:30:45'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%r'); -- Result: '12:30:45 PM'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%T'); -- Result: '12:30:45'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%p'); -- Result: 'PM'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%z'); -- Result: '+00:00'
SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Z'); -- Result: 'UTC'

SELECT DATE_FORMAT(CURRENT_DATE(), '%Y-%m-%d %H:%i:%s'); -- Result: '2022-01-05 00:00:00'
SELECT DATE_FORMAT(CURRENT_DATE(), '%a %D %b %Y'); -- Result: 'Wed 5th Jan 2022'
SELECT DATE_FORMAT(CURRENT_DATE(), '%W %D %M %Y'); -- Result: 'Wednesday 5th January 2022'

SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s'); -- Result: '2022-01-05 12:30:45'
SELECT DATE_FORMAT(NOW(), '%a %D %b %Y'); -- Result: 'Wed 5th Jan 2022'
SELECT DATE_FORMAT(NOW(), '%W %D %M %Y');
-- Result: 'Wednesday 5th January 2022'

-- Part 2:
SELECT orderNumber,
       DATE_FORMAT(orderdate, '%Y-%m-%d')       orderDate,
       DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
       DATE_FORMAT(shippedDate, '%W %D %M %Y')  shippedDate
FROM orders;

-- Part 3:
SELECT orderNumber,
       DATE_FORMAT(shippeddate, '%W %D %M %Y') AS 'Shipped date'
FROM orders
ORDER BY shippeddate;

-- Example 7: Using CURRENT_DATE() or CURDATE() function
-- The CURRENT_DATE() or CURDATE() function returns the current date.
-- Returns the current date.
-- Syntax: CURRENT_DATE() or CURDATE()

SELECT CURRENT_DATE(); -- Result: '2022-01-05'
SELECT CURDATE();
-- Result: '2022-01-05'

-- Example 8: Using CURRENT_TIME() or CURTIME() function
-- The CURRENT_TIME() or CURTIME() function returns the current time.

-- Returns the current time in string format in 'HH:MM:SS' format.
-- Or in 'HH:MM:SS.SSS' format if the fractional seconds are specified.
-- Or in numeric format in 'HHMMSS' format.
-- Or in 'HHMMSS.SSS' format if the fractional seconds are specified.

-- Syntax: CURRENT_TIME() or CURTIME() or CURRENT_TIME(fsp) or CURTIME(fsp)
-- fsp: The fractional seconds precision

SELECT CURRENT_TIME(); -- Result: '12:30:45'
SELECT CURTIME(); -- Result: '12:30:45'
SELECT CURRENT_TIME() + 0; -- Result: 123045
SELECT CURTIME() + 1; -- Result: 123046
SELECT CURRENT_TIME(3); -- Result: '12:30:45.123'
SELECT CURTIME(3);
-- Result: '12:30:45.123'

-- Example 9: Using CURRENT_TIMESTAMP() or NOW() function
-- The CURRENT_TIMESTAMP() or NOW() function returns the current date and time.

-- Returns the current date and time in string format in 'YYYY-MM-DD HH:MM:SS' format.
-- Or in 'YYYY-MM-DD HH:MM:SS.SSS' format if the fractional seconds are specified.
-- Or in numeric format in 'YYYYMMDDHHMMSS' format.
-- Or in 'YYYYMMDDHHMMSS.SSS' format if the fractional seconds are specified.

-- Syntax: CURRENT_TIMESTAMP() or NOW() or CURRENT_TIMESTAMP(fsp) or NOW(fsp)
-- fsp: The fractional seconds precision

SELECT CURRENT_TIMESTAMP(); -- Result: '2022-01-05 12:30:45'
SELECT NOW(); -- Result: '2022-01-05 12:30:45'
SELECT CURRENT_TIMESTAMP(3); -- Result: '2022-01-05 12:30:45.123'
SELECT NOW(3);
-- Result: '2022-01-05 12:30:45.123'

-- Example 8: Using LPAD(str, len, padstr) function
-- The LPAD() function left-pads a string with another string to a specified length.
-- Returns the string left-padded with the padstr repeated len times.
-- Syntax: LPAD(str, len, padstr)

-- str: The string to be left-padded
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is the padstr repeated len times.
-- If the string is a non-empty string, the result is the string left-padded with the padstr repeated len times.
-- If the string is a string that can be converted to a number, the result is the number left-padded with the padstr repeated len times.
-- If the string is a string that cannot be converted to a number, the result is NULL.

-- len: The length of the resulting string
-- If the length is NULL, the result is NULL.
-- If the length is negative, the result is NULL.
-- If the length is 0, the result is an empty string.
-- If the length is greater than the length of the string, the result is the string left-padded with the padstr repeated len times.
-- If the length is less than or equal to the length of the string, the result is the string itself.
-- If the length is an integer, the result is the string left-padded with the padstr repeated len times.
-- If the length is a floating-point number, the result is the string left-padded with the padstr repeated rounded len times.

-- padstr: The string used to pad the original string
-- If the padstr is NULL, the result is NULL.
-- If the padstr is an empty string, the result is the original string.
-- If the padstr is a non-empty string, the result is the original string left-padded with the padstr repeated len times.
-- If the padstr is an number, the result is the original string left-padded with the padstr repeated len times.

-- Part 1:
SELECT LPAD(NULL, 4, '??'); -- Result: NULL
SELECT LPAD('', 4, '??'); -- Result: '????'
SELECT LPAD('hi', -1, '??'); -- Result: NULL
SELECT LPAD('hi', 0, '??'); -- Result: ''
SELECT LPAD('hi', 1, '??'); -- Result: 'h'
SELECT LPAD('hi', 2, '??'); -- Result: 'hi'
SELECT LPAD('hi', 3, '??'); -- Result: '?hi'
SELECT LPAD('hi', 4, '??'); -- Result: '??hi'
SELECT LPAD('hi', 4.5, '??'); -- Result: '???hi'
SELECT LPAD('hi', 5, NULL); -- Result: NULL
SELECT LPAD('hi', 5, ''); -- Result: 'hi'
SELECT LPAD('hi', 5, 5); -- Result: '555hi'
SELECT LPAD('hi', 5, 5.5);
-- Result: '5.5hi'

-- Part 2:
SELECT firstName, LPAD(firstName, 10, 'kk'), LPAD(firstName, 5, 'kk'), LPAD(firstName, 4, 'kk')
FROM employees;

-- Example 9: Using TRIM() function
-- Syntax: TRIM([BOTH | LEADING | TRAILING] [remstr FROM] str)

-- Optional: BOTH | LEADING | TRAILING
-- BOTH: Removes the leading and trailing characters
-- LEADING: Removes the leading characters
-- TRAILING: Removes the trailing characters

-- Required: str
-- str: The string to be trimmed
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is an empty string.
-- If the string is a non-empty string, the result is the string with the leading and trailing characters removed.
-- If the string is a string that can be converted to a number, the result is the number with the leading and trailing characters removed.
-- If the string is a string that cannot be converted to a number, the result is NULL.

-- Optional: remstr FROM
-- remstr: The characters to be removed
-- If the remstr is NULL, the result is NULL.
-- If the remstr is an empty string, the result is the original string.
-- If the remstr is a non-empty string, the result is the original string with the remstr removed.
-- If the remstr is a string that can be converted to a number, the result is the original string with the remstr removed.

SELECT TRIM(NULL); -- Result: NULL
SELECT TRIM(''); -- Result: ''
SELECT TRIM('  '); -- Result: ''
SELECT TRIM('  SQL TRIM function  '); -- Result: 'SQL TRIM function'
SELECT TRIM(LEADING NULL FROM '  SQL TRIM function  '); -- Result: NULL
SELECT TRIM(LEADING '' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function  '
SELECT TRIM(LEADING ' ' FROM '  SQL TRIM function  '); -- Result: 'SQL TRIM function  '
SELECT TRIM(TRAILING NULL FROM '  SQL TRIM function  '); -- Result: NULL
SELECT TRIM(TRAILING '' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function  '
SELECT TRIM(TRAILING ' ' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function'
SELECT TRIM(BOTH NULL FROM '  SQL TRIM function  '); -- Result: NULL
SELECT TRIM(BOTH '' FROM '  SQL TRIM function  '); -- Result: 'SQL TRIM function'
SELECT TRIM(BOTH ' ' FROM '  SQL TRIM function  '); -- Result: 'SQL TRIM function'
SELECT TRIM('/' FROM '/SQL TRIM function/');
-- Result: 'SQL TRIM function'

-- Example 10: Using SQL LTRIM() function
-- Removes the leading spaces from a string
-- Syntax: LTRIM(str)

-- str: The string to be trimmed
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is an empty string.
-- If the string is a non-empty string, the result is the string with the leading spaces removed.
-- If the string is a string that can be converted to a number, the result is the number with the leading spaces removed.

SELECT LTRIM(NULL); -- Result: NULL
SELECT LTRIM(''); -- Result: ''
SELECT LTRIM('  '); -- Result: ''
SELECT LTRIM('  SQL LTRIM function'); -- Result: 'SQL LTRIM function''
SELECT LTRIM('  SQL LTRIM function  ');
-- Result: 'SQL LTRIM function  '

-- Example 11: Using RTRIM() function
-- Removes the trailing spaces from a string
-- Syntax: RTRIM(str)

-- str: The string to be trimmed
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is an empty string.
-- If the string is a non-empty string, the result is the string with the trailing spaces removed.
-- If the string is a string that can be converted to a number, the result is the number with the trailing spaces removed.

SELECT RTRIM(NULL); -- Result: NULL
SELECT RTRIM(''); -- Result: ''
SELECT RTRIM('  '); -- Result: ''
SELECT RTRIM('SQL RTRIM function  '); -- Result: 'SQL RTRIM function'
SELECT RTRIM('  SQL RTRIM function  ');
-- Result: '  SQL RTRIM function'

-- Example 12: Using YEAR() function
-- The YEAR() function extracts the year from a date.
-- Syntax: YEAR(date)

-- date: The date to extract the year from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the year extracted from the date.
-- If the date is a string that can be converted to a date, the result is the year extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

-- Part 1:
SELECT YEAR(NULL); -- Result: NULL
SELECT YEAR(''); -- Result: NULL
SELECT YEAR('2002-01-01'); -- Result: 2002
SELECT YEAR('2002-01-01 12:30:45'); -- Result: 2002
SELECT YEAR('2002-01-01 12:30:45.123'); -- Result: 2002;
SELECT YEAR(CURDATE()); -- Result: 2022
SELECT YEAR(CURRENT_DATE()); -- Result: 2022
SELECT YEAR(NOW()); -- Result: 2022
SELECT YEAR(CURTIME()); -- Result: 0
SELECT YEAR(CURRENT_TIME()); -- Result: 0
SELECT YEAR(CURRENT_TIMESTAMP());
-- Result: 2022

-- Part 2:
SELECT YEAR(shippeddate) AS year, COUNT(ordernumber) AS orderQty
FROM orders
GROUP BY YEAR(shippeddate)
ORDER BY YEAR(shippeddate);

-- Example 13: Using MONTH() function
-- The MONTH() function extracts the month from a date.
-- Syntax: MONTH(date)

-- date: The date to extract the month from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the month extracted from the date.
-- If the date is a string that can be converted to a date, the result is the month extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

SELECT MONTH(NULL); -- Result: NULL
SELECT MONTH(''); -- Result: NULL
SELECT MONTH('2022-01-05'); -- Result: 1
SELECT MONTH('2022-01-05 12:30:45'); -- Result: 1
SELECT MONTH('2022-01-05 12:30:45.123'); -- Result: 1
SELECT MONTH(CURDATE()); -- Result: 1
SELECT MONTH(CURRENT_DATE()); -- Result: 1
SELECT MONTH(NOW()); -- Result: 1
SELECT MONTH(CURTIME()); -- Result: 1
SELECT MONTH(CURRENT_TIME()); -- Result: 1
SELECT MONTH(CURRENT_TIMESTAMP());
-- Result: 1

-- Example 14: Using DAY() function
-- The DAY() function extracts the day of the month from a date.
-- Syntax: DAY(date)

-- date: The date to extract the day from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the day of the month extracted from the date.
-- If the date is a string that can be converted to a date, the result is the day of the month extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

SELECT DAY(NULL); -- Result: NULL
SELECT DAY(''); -- Result: NULL
SELECT DAY('2022-01-05'); -- Result: 5
SELECT DAY('2022-01-05 12:30:45'); -- Result: 5
SELECT DAY('2022-01-05 12:30:45.123'); -- Result: 5
SELECT DAY(CURDATE()); -- Result: 5
SELECT DAY(CURRENT_DATE()); -- Result: 5
SELECT DAY(NOW()); -- Result: 5
SELECT DAY(CURTIME()); -- Result: 5
SELECT DAY(CURRENT_TIME()); -- Result: 5
SELECT DAY(CURRENT_TIMESTAMP());
-- Result: 5

-- Example 15: Using DAYNAME() function
-- The DAYNAME() function extracts the day of the week from a date.
-- Syntax: DAYNAME(date)
-- Returns the day of the week as a string.

-- date: The date to extract the day of the week from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the day of the week extracted from the date.
-- If the date is a string that can be converted to a date, the result is the day of the week extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

SELECT DAYNAME(NULL); -- Result: NULL
SELECT DAYNAME(''); -- Result: NULL
SELECT DAYNAME('2022-01-05'); -- Result: Wednesday
SELECT DAYNAME('2022-09-05'); -- Result: Monday
SELECT DAYNAME('2022-01-05 12:30:45'); -- Result: Wednesday
SELECT DAYNAME('2022-01-05 12:30:45.123'); -- Result: Wednesday
SELECT DAYNAME(CURDATE()); -- Result: Wednesday
SELECT DAYNAME(CURRENT_DATE()); -- Result: Wednesday
SELECT DAYNAME(NOW()); -- Result: Wednesday
SELECT DAYNAME(CURTIME()); -- Result: Wednesday
SELECT DAYNAME(CURRENT_TIME()); -- Result: Wednesday
SELECT DAYNAME(CURRENT_TIMESTAMP());
-- Result: Wednesday

-- Example 16: Using DAYOFWEEK() function
-- The DAYOFWEEK() function extracts the day of the week from a date as a number.
-- Returns the day of the week as a number (1=Sunday, 2=Monday, ..., 7=Saturday).
-- Syntax: DAYOFWEEK(date)

-- date: The date to extract the day of the week from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the day of the week extracted from the date as a number.
-- If the date is a string that can be converted to a date, the result is the day of the week extracted from the date as a number.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

SELECT DAYOFWEEK(NULL); -- Result: NULL
SELECT DAYOFWEEK(''); -- Result: NULL
SELECT DAYOFWEEK('2022-01-05'); -- Result: 4
SELECT DAYOFWEEK('2022-09-05'); -- Result: 2
SELECT DAYOFWEEK('2022-01-05 12:30:45'); -- Result: 4
SELECT DAYOFWEEK('2022-01-05 12:30:45.123'); -- Result: 4
SELECT DAYOFWEEK(CURDATE()); -- Result: 4
SELECT DAYOFWEEK(CURRENT_DATE()); -- Result: 4
SELECT DAYOFWEEK(NOW()); -- Result: 4
SELECT DAYOFWEEK(CURTIME()); -- Result: 4
SELECT DAYOFWEEK(CURRENT_TIME()); -- Result: 4
SELECT DAYOFWEEK(CURRENT_TIMESTAMP());
-- Result: 4

-- Example 17: Using DAYOFYEAR() function
-- The DAYOFYEAR() function extracts the day of the year from a date.
-- Returns the day of the year as a number.
-- Syntax: DAYOFYEAR(date)

-- date: The date to extract the day of the year from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the day of the year extracted from the date.
-- If the date is a string that can be converted to a date, the result is the day of the year extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

SELECT DAYOFYEAR(NULL); -- Result: NULL
SELECT DAYOFYEAR(''); -- Result: NULL
SELECT DAYOFYEAR('2022-01-05'); -- Result: 5
SELECT DAYOFYEAR('2022-09-05'); -- Result: 248
SELECT DAYOFYEAR('2022-01-05 12:30:45'); -- Result: 5
SELECT DAYOFYEAR('2022-01-05 12:30:45.123'); -- Result: 5
SELECT DAYOFYEAR(CURDATE()); -- Result: 5
SELECT DAYOFYEAR(CURRENT_DATE()); -- Result: 5
SELECT DAYOFYEAR(NOW()); -- Result: 5
SELECT DAYOFYEAR(CURTIME()); -- Result: 5
SELECT DAYOFYEAR(CURRENT_TIME()); -- Result: 5
SELECT DAYOFYEAR(CURRENT_TIMESTAMP());
-- Result: 5

-- Example 18: Using WEEK() function
-- The WEEK() function extracts the week number from a date.
-- Returns the week of the year as a number.
-- Syntax: WEEK(date)

-- date: The date to extract the week number from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the week number extracted from the date.
-- If the date is a string that can be converted to a date, the result is the week number extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

SELECT WEEK(NULL); -- Result: NULL
SELECT WEEK(''); -- Result: NULL
SELECT WEEK('2022-01-05'); -- Result: 1
SELECT WEEK('2022-09-05'); -- Result: 36
SELECT WEEK('2022-01-05 12:30:45'); -- Result: 1
SELECT WEEK('2022-01-05 12:30:45.123'); -- Result: 1
SELECT WEEK(CURDATE()); -- Result: 1
SELECT WEEK(CURRENT_DATE()); -- Result: 1
SELECT WEEK(NOW()); -- Result: 1
SELECT WEEK(CURTIME()); -- Result: 1
SELECT WEEK(CURRENT_TIME()); -- Result: 1
SELECT WEEK(CURRENT_TIMESTAMP());
-- Result: 1

-- Example 19: Using WEEKDAY() function
-- The WEEKDAY() function extracts the day of the week from a date as a number.
-- Returns the day of the week as a number (0=Monday, 1=Tuesday, ..., 6=Sunday).
-- Syntax: WEEKDAY(date)

-- date: The date to extract the day of the week from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the day of the week extracted from the date as a number.
-- If the date is a string that can be converted to a date, the result is the day of the week extracted from the date as a number.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is excluded.
-- If the date is a timestamp, the time part is excluded.

SELECT WEEKDAY(NULL); -- Result: NULL
SELECT WEEKDAY(''); -- Result: NULL
SELECT WEEKDAY('2022-01-05'); -- Result: 2
SELECT WEEKDAY('2022-09-05'); -- Result: 0
SELECT WEEKDAY('2022-01-05 12:30:45'); -- Result: 2
SELECT WEEKDAY('2022-01-05 12:30:45.123'); -- Result: 2
SELECT WEEKDAY(CURDATE()); -- Result: 2
SELECT WEEKDAY(CURRENT_DATE()); -- Result: 2
SELECT WEEKDAY(NOW()); -- Result: 2
SELECT WEEKDAY(CURTIME()); -- Result: 2
SELECT WEEKDAY(CURRENT_TIME()); -- Result: 2
SELECT WEEKDAY(CURRENT_TIMESTAMP());
-- Result: 2

-- Example 20: Using HOUR() function
-- The HOUR() function extracts the hour from a date.
-- Returns the hour as a number.
-- Syntax: HOUR(date)

-- date: The date to extract the hour from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the hour extracted from the date.
-- If the date is a string that can be converted to a date, the result is the hour extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is included.
-- If the date is a timestamp, the time part is included.

SELECT HOUR(NULL); -- Result: NULL
SELECT HOUR(''); -- Result: NULL
SELECT HOUR('2022-01-05'); -- Result: 0
SELECT HOUR('2022-01-05 12:30:45'); -- Result: 12
SELECT HOUR('2022-01-05 12:30:45.123'); -- Result: 12
SELECT HOUR(CURDATE()); -- Result: 0
SELECT HOUR(CURRENT_DATE()); -- Result: 0
SELECT HOUR(NOW()); -- Result: 12
SELECT HOUR(CURTIME()); -- Result: 12
SELECT HOUR(CURRENT_TIME()); -- Result: 12
SELECT HOUR(CURRENT_TIMESTAMP());
-- Result: 12

-- Example 21: Using MINUTE() function
-- The MINUTE() function extracts the minute from a date.
-- Returns the minute as a number.
-- Syntax: MINUTE(date)

-- date: The date to extract the minute from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the minute extracted from the date.
-- If the date is a string that can be converted to a date, the result is the minute extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is included.
-- If the date is a timestamp, the time part is included.

SELECT MINUTE(NULL); -- Result: NULL
SELECT MINUTE(''); -- Result: NULL
SELECT MINUTE('2022-01-05'); -- Result: 0
SELECT MINUTE('2022-01-05 12:30:45'); -- Result: 30
SELECT MINUTE('2022-01-05 12:30:45.123'); -- Result: 30
SELECT MINUTE(CURDATE()); -- Result: 0
SELECT MINUTE(CURRENT_DATE()); -- Result: 0
SELECT MINUTE(NOW()); -- Result: 30
SELECT MINUTE(CURTIME()); -- Result: 30
SELECT MINUTE(CURRENT_TIME()); -- Result: 30
SELECT MINUTE(CURRENT_TIMESTAMP());
-- Result: 30

-- Example 22: Using SECOND() function
-- The SECOND() function extracts the second from a date.
-- Returns the second as a number.
-- Syntax: SECOND(date)

-- date: The date to extract the second from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the second extracted from the date.
-- If the date is a string that can be converted to a date, the result is the second extracted from the date.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is included.
-- If the date is a timestamp, the time part is included.

SELECT SECOND(NULL); -- Result: NULL
SELECT SECOND(''); -- Result: NULL
SELECT SECOND('2022-01-05'); -- Result: 0
SELECT SECOND('2022-01-05 12:30:45'); -- Result: 45
SELECT SECOND('2022-01-05 12:30:45.123'); -- Result: 45
SELECT SECOND(CURDATE()); -- Result: 0
SELECT SECOND(CURRENT_DATE()); -- Result: 0
SELECT SECOND(NOW()); -- Result: 45
SELECT SECOND(CURTIME()); -- Result: 45
SELECT SECOND(CURRENT_TIME()); -- Result: 45
SELECT SECOND(CURRENT_TIMESTAMP());
-- Result: 45

-- Example 23: Using NOW() function
-- The NOW() function returns the current date and time.
-- Syntax: NOW()

SELECT NOW();
-- Result: 2022-01-05 12:30:45

-- Example 24: Using CURDATE() function
-- The CURDATE() function returns the current date.
-- Syntax: CURDATE()

SELECT CURDATE();
-- Result: 2022-01-05

-- Example 25: Using CURTIME() function
-- The CURTIME() function returns the current time.
-- Syntax: CURTIME()

SELECT CURTIME();
-- Result: 12:30:45

-- Example 25: Using DATE_ADD() function
-- Date_Add() function adds a specified time interval to a date.
-- Returns the date after adding the specified time interval.
-- Syntax: DATE_ADD(date, INTERVAL value unit)

-- date: The date to add the time interval to
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the date after adding the time interval.
-- If the date is a string that can be converted to a date, the result is the date after adding the time interval.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is included.
-- If the date is a timestamp, the time part is included.

-- INTERVAL value unit: The time interval to add to the date

-- value: The value of the time interval
-- If the value is NULL, the result is NULL.
-- If the value is a number, the result is the number.
-- If the value is a string that can be converted to a number, the result is the number.

-- unit: The unit of the time interval
-- If the unit is NULL, the result is NULL.
-- If the unit is a valid unit, the result is the unit.
-- If the unit is an invalid unit, the result is NULL.
-- The unit can be YEAR, MONTH, DAY, HOUR, MINUTE, or SECOND.

SELECT DATE_ADD(NULL, INTERVAL 1 DAY); -- Result: NULL
SELECT DATE_ADD('', INTERVAL 1 DAY); -- Result: NULL
SELECT DATE_ADD('2022-01-05', INTERVAL NULL DAY); -- Result: NULL
SELECT DATE_ADD('2022-01-05', INTERVAL '1' DAY); -- Result: 2022-01-06
SELECT DATE_ADD('2022-01-05', INTERVAL 1 DAY); -- Result: 2022-01-06
SELECT DATE_ADD('2022-01-05', INTERVAL 1 MONTH); -- Result: 2022-02-05
SELECT DATE_ADD('2022-01-05', INTERVAL 1 YEAR); -- Result: 2023-01-05
SELECT DATE_ADD('2022-01-05', INTERVAL 1 HOUR); -- Result: 2022-01-05 01:00:00
SELECT DATE_ADD('2022-01-05', INTERVAL 1 MINUTE); -- Result: 2022-01-05 00:01:00
SELECT DATE_ADD('2022-01-05', INTERVAL 1 SECOND);
-- Result: 2022-01-05 00:00:01

-- Example 26: Using DATE_SUB() function
-- Date_Sub() function subtracts a specified time interval from a date.
-- Returns the date after subtracting the specified time interval.
-- Syntax: DATE_SUB(date, INTERVAL value unit)

-- date: The date to subtract the time interval from
-- If the date is NULL, the result is NULL.
-- If the date is a valid date, the result is the date after subtracting the time interval.
-- If the date is a string that can be converted to a date, the result is the date after subtracting the time interval.
-- The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
-- If the date is a string that cannot be converted to a date, the result is NULL.
-- The date can be a date, datetime, or timestamp data type.
-- If the date is a datetime, the time part is included.
-- If the date is a timestamp, the time part is included.

-- INTERVAL value unit: The time interval to subtract from the date

-- value: The value of the time interval
-- If the value is NULL, the result is NULL.
-- If the value is a number, the result is the number.
-- If the value is a string that can be converted to a number, the result is the number.

-- unit: The unit of the time interval
-- If the unit is NULL, the result is an error.
-- If the unit is a valid unit, the result is the unit.
-- If the unit is an invalid unit, the result is an error.

SELECT DATE_SUB(NULL, INTERVAL 1 DAY); -- Result: NULL
SELECT DATE_SUB('', INTERVAL 1 DAY); -- Result: NULL
SELECT DATE_SUB('2022-01-05', INTERVAL NULL DAY); -- Result: NULL
SELECT DATE_SUB('2022-01-05', INTERVAL '' DAY); -- Result:
SELECT DATE_SUB('2022-01-05', INTERVAL '1' DAY); -- Result: 2022-01-04
SELECT DATE_SUB('2022-01-05', INTERVAL 1 DAY); -- Result: 2022-01-04
SELECT DATE_SUB('2022-01-05', INTERVAL 1 MONTH); -- Result: 2021-12-05
SELECT DATE_SUB('2022-01-05', INTERVAL 1 YEAR); -- Result: 2021-01-05
SELECT DATE_SUB('2022-01-05', INTERVAL 1 HOUR); -- Result: 2022-01-04 23:00:00
SELECT DATE_SUB('2022-01-05', INTERVAL 1 MINUTE); -- Result: 2022-01-04 23:59:00
SELECT DATE_SUB('2022-01-05', INTERVAL 1 SECOND);
-- Result: 2022-01-04 23:59:59

-- Example 27: Using COUNT(*) function
-- COUNT(*) function returns the number of rows in a table.
-- Syntax: COUNT(*)

-- Part 1: COUNT(*) without GROUP BY
-- COUNT(*) without GROUP BY: Returns the number of rows in the entire table.
SELECT COUNT(*) AS total_orders
FROM orders;
-- Result: 326

-- Part 2: COUNT(*) with GROUP BY
-- COUNT(*) with GROUP BY: Returns the number of rows in each group.
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- Example 28: Using COUNT(column_name) function
-- COUNT(column_name) function returns the number of non-NULL values in a column.
-- Syntax: COUNT(column_name)

-- column_name: The column to count the non-NULL values in.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is 0.
-- If the column has non-NULL values, the result is the number of non-NULL values.

-- Part 1: COUNT(column_name) without GROUP BY
-- COUNT(column_name) without GROUP BY: Returns the number of non-NULL values in the entire column.
SELECT COUNT(orderNumber) AS total_orders
FROM orders;
-- Result: 326

-- Part 2: COUNT(column_name) with GROUP BY
-- COUNT(column_name) with GROUP BY: Returns the number of non-NULL values in each group.
SELECT status, COUNT(orderNumber) AS order_count
FROM orders
GROUP BY status;

-- Example 29: Using MAX(column_name)
-- MAX(column_name) function returns the maximum value in a column or null if the column is empty.
-- Syntax: MAX(column_name)

-- column_name: The column to find the maximum value in.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is NULL.
-- If the column has non-NULL values, the result is the maximum value.
-- If the column has non-NULL values and NULL values, the result is the maximum of the non-NULL values.

-- Part 1: MAX() without GROUP BY
-- MAX() without GROUP BY: Returns the maximum value in the entire column.
SELECT MAX(orderNumber) AS max_order_number
FROM orders;
-- Result: 10425

-- Part 2: MAX() with GROUP BY
-- MAX() with GROUP BY: Returns the maximum value in each group.
SELECT status, MAX(orderNumber) AS max_order_number
FROM orders
GROUP BY status;

-- Example 30: Using MIN() function
-- MIN() function returns the minimum value in a column or null if the column is empty.
-- Syntax: MIN(column_name)

-- column_name: The column to find the minimum value in.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is NULL.
-- If the column has non-NULL values, the result is the minimum value.
-- If the column has non-NULL values and NULL values, the result is the minimum of the non-NULL values.

-- Part 1: MIN() without GROUP BY
-- MIN() without GROUP BY: Returns the minimum value in the entire column.
SELECT MIN(orderNumber) AS min_order_number
FROM orders;
-- Result: 10100

-- Part 2: MIN() with GROUP BY
-- MIN() with GROUP BY: Returns the minimum value in each group.
SELECT status, MIN(orderNumber) AS min_order_number
FROM orders
GROUP BY status;

-- Example 31: Using CONCAT() function
-- CONCAT() function concatenates two or more strings.
-- Returns the concatenated string.
-- Syntax: CONCAT(str1, str2, str3, ...)

-- str1, str2, str3, ...: The strings to be concatenated.
-- The CONCAT() function requires at least one argument.
-- If any argument is NULL, the result is NULL.
-- If all arguments are non-NULL, the result is non-NULL.
-- If any argument is a number, it is converted to a string.

-- Part 1:
SELECT CONCAT(NULL, 'a'); -- Result: NULL
SELECT CONCAT('a', 5); -- Result: 'a5'
SELECT CONCAT('Hello', ' ', 'World');
-- Result: 'Hello World'

-- Part 2:
SELECT CONCAT('Order Number: ', orderNumber) AS order_info
FROM orders;

-- Example 32: Using CONCAT_WS() function
-- CONCAT_WS() function concatenates two or more strings with a separator.
-- Returns the concatenated string with the separator between the strings.
-- Syntax: CONCAT_WS(separator, str1, str2, str3, ...)
-- The CONCAT_WS() function requires at least two arguments.

-- separator: The separator to use between the strings.
-- If the separator is NULL, the result is NULL.
-- If the separator is an empty string, the result is the strings concatenated without a separator.
-- If the separator is a number, it is converted to a string.

-- str1, str2, str3, ...: The strings to be concatenated.
-- If any arguments are NULL, the NULL arguments are skipped.
-- If any argument is a number, it is converted to a string.
-- If all arguments are non-NULL, the result is non-NULL.

-- Part 1:
-- SELECT CONCAT_WS('a'); -- Result: Error
SELECT CONCAT_WS(NULL, 'a', 'b'); -- Result: NULL
SELECT CONCAT_WS('', 'John', 'Doe'); -- Result: 'JohnDoe'
SELECT CONCAT_WS(', ', 'John', 'Doe', '123 Main St'); -- Result: 'John, Doe, 123 Main St'
SELECT CONCAT_WS(' - ', 'Order Number', 'd', NULL); -- Result: 'Order Number - d'
SELECT CONCAT_WS(' - ', 'Order Number', 5);
-- Result: 'Order Number - 5'

-- Part 2:
SELECT CONCAT_WS(' - ', 'Order Number', orderNumber) AS order_info
FROM orders;

-- Example 33: Using SUBSTRING() function MySQL
-- SUBSTRING() function extracts a substring from a string.
-- Returns the extracted substring.
-- Syntax: SUBSTRING(str, start, length)

-- str: The string to extract the substring from.
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is an empty string.
-- If the string is a number, it is converted to a string.
-- If the string is a date, it is converted to a string.
-- If the string is a datetime, it is converted to a string.
-- If the string is a timestamp, it is converted to a string.

-- start: The starting position of the substring.
-- If the start position is NULL, the result is NULL.
-- If the start position is 0, the result is an empty string.
-- If the start position is positive, it starts from that position in the string.
-- If the start position is 1, it starts from the beginning of the string.
-- If the start position is greater than the length of the string, the result is an empty string.
-- If the start position is negative, it starts from the end of the string.

-- length: The length of the substring to extract.
-- If the length is NULL, it returns NULL.
-- If the length is 0, it returns an empty string.
-- If the length is not specified, it returns the remaining characters in the string starting from the start position.
-- If the length is negative, it returns an empty string.
-- If the length is greater than the remaining characters in the string, it returns the remaining characters starting from the start position.

SELECT SUBSTRING(NULL, 1, 5); -- Result: NULL
SELECT SUBSTRING('', 1, 5); -- Result: ''
SELECT SUBSTRING(3223434, 1, 5); -- Result: '32234'
SELECT SUBSTRING(NOW(), 1, 5); -- Result: '2022-'
SELECT SUBSTRING('Hello World', NULL, 5); -- Result: NULL
SELECT SUBSTRING('Hello World', 0, 5); -- Result: ''
SELECT SUBSTRING('Hello World', 1, 5); -- Result: 'Hello'
SELECT SUBSTRING('Hello World', 22, 5); -- Result: ''
SELECT SUBSTRING('Hello World', -3, 5); -- Result: 'rld'
SELECT SUBSTRING('Hello World', 7, NULL); -- Result: NULL
SELECT SUBSTRING('Hello World', 7, 0); -- Result: ''
SELECT SUBSTRING('Hello World', 7); -- Result: 'World'
SELECT SUBSTRING('Hello World', 7, -1); -- Result: ''
SELECT SUBSTRING('Hello World', 7, NULL); -- Result: NULL
SELECT SUBSTRING('Hello World', 5, 100);
-- Result: 'o World'

-- Example 34: Using SUBSTRING_INDEX() function
-- SUBSTRING_INDEX() function extracts a substring from a string before a specified delimiter.
-- Returns the extracted substring.
-- Syntax: SUBSTRING_INDEX(str, delimiter, count)

-- str: The string to extract the substring from.
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is an empty string.
-- If the string is a number, it is converted to a string.
-- If the string is a date, it is converted to a string.
-- If the string is a datetime, it is converted to a string.
-- If the string is a timestamp, it is converted to a string.

-- delimiter: The delimiter to use to split the string.
-- If the delimiter is NULL, the result is NULL.
-- If the delimiter is an empty string, the result is an empty string.
-- If the delimiter is not found, the result is the entire string.
-- If the delimiter is found, the result is the substring before the delimiter.

-- count: The number of occurrences of the delimiter to consider.
-- If the count is NULL, the result is NULL.
-- If the count is 0, the result is an empty string.
-- If the count is positive, it considers the first count occurrences of the delimiter.
-- If the count is negative, it considers the last count occurrences of the delimiter.

SELECT SUBSTRING_INDEX(NULL, '.', 1); -- Result: NULL
SELECT SUBSTRING_INDEX('', '.', 1); -- Result: ''
SELECT SUBSTRING_INDEX('www.mysql.com', NULL, 1); -- Result: NULL
SELECT SUBSTRING_INDEX('www.mysql.com', '', 1); -- Result: ''
SELECT SUBSTRING_INDEX('www.mysql.com', '/', 1); -- Result: 'www.mysql.com'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', NULL); -- Result: NULL
SELECT SUBSTRING_INDEX('www.mysql.com', '.', 0); -- Result: ''
SELECT SUBSTRING_INDEX('www.mysql.com', '.', 1); -- Result: 'www'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', 2); -- Result: 'www.mysql'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', 3); -- Result: 'www.mysql.com'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', 4); -- Result: 'www.mysql.com'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', -1); -- Result: 'com'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', -2); -- Result: 'mysql.com'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', -3); -- Result: 'mysql.com'
SELECT SUBSTRING_INDEX('www.mysql.com', '.', -4);
-- Result: 'mysql.com'

# Example 35: Using UPPER() function
-- UPPER() function converts a string to uppercase.
-- Returns the string converted to uppercase.
-- Syntax: UPPER(str)

-- str: The string to convert to uppercase.
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is an empty string.
-- If the string is a number, it is converted to a string.
-- If the string is a date, it is converted to a string.
-- If the string is a datetime, it is converted to a string.
-- If the string is a timestamp, it is converted to a string.

SELECT UPPER(NULL); -- Result: NULL
SELECT UPPER(''); -- Result: ''
SELECT UPPER('Hello World'); -- Result: 'HELLO WORLD'
SELECT UPPER(1234); -- Result: '1234'
SELECT UPPER(NOW());
-- Result: '2022-01-05 12:30:45'

-- Example 36: Using LOWER() function
-- LOWER() function converts a string to lowercase.
-- Returns the string converted to lowercase.
-- Syntax: LOWER(str)

-- str: The string to convert to lowercase.
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is an empty string.
-- If the string is a number, it is converted to a string.
-- If the string is a date, it is converted to a string.

SELECT LOWER(NULL); -- Result: NULL
SELECT LOWER(''); -- Result: ''
SELECT LOWER('Hello World'); -- Result: 'hello world'
SELECT LOWER(1234); -- Result: '1234'
SELECT LOWER(NOW());
-- Result: '2022-01-05 12:30:45'

-- Example 37: Using SUM() function
-- SUM() function calculates the sum of values in a column.
-- Returns the sum of values in the column.
-- Syntax: SUM(column_name)

-- column_name: The column to calculate the sum of values in.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is 0.
-- If the column has non-NULL values, the result is the sum of the values.
-- If the column has non-NULL values and NULL values, the result is the sum of the non-NULL values.

-- Part 1: SUM() without GROUP BY
-- SUM() without GROUP BY: Returns the sum of values in the entire column.
SELECT SUM(orderNumber) AS total_order_number
FROM orders;
-- Result: 3410250

-- Part 2: SUM() with GROUP BY
-- SUM() with GROUP BY: Returns the sum of values in each group.
SELECT status, SUM(orderNumber) AS total_order_number
FROM orders
GROUP BY status;

-- Example 38: Using AVG() function
-- AVG() function calculates the average of values in a column.
-- Returns the average of values in the column.
-- Syntax: AVG(column_name)

-- column_name: The column to calculate the average of values in.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is 0.
-- If the column has non-NULL values, the result is the average of the values.
-- If the column has non-NULL values and NULL values, the result is the average of the non-NULL values.

-- Part 1: AVG() without GROUP BY
-- AVG() without GROUP BY: Returns the average of values in the entire column.
SELECT AVG(orderNumber) AS avg_order_number
FROM orders;
-- Result: 10463.1901840491

-- Part 2: AVG() with GROUP BY
-- AVG() with GROUP BY: Returns the average of values in each group.
SELECT status, AVG(orderNumber) AS avg_order_number
FROM orders
GROUP BY status;

-- Example 39: Using IF() function
-- IF() function returns a value based on a condition.
-- Returns the value based on the condition.
-- Syntax: IF(condition, value_if_true, value_if_false)

-- condition: The condition to evaluate.
-- If the condition is NULL, the result is value_if_false.
-- If the condition is true, the result is value_if_true.
-- If the condition is false, the result is value_if_false.

-- value_if_true: The value to return if the condition is true.
-- If the value_if_true is NULL, the result is NULL.
-- If the value_if_true is a number, it is converted to a string.

-- value_if_false: The value to return if the condition is false.
-- If the value_if_false is NULL, the result is NULL.
-- If the value_if_false is a number, it is converted to a string.

SELECT IF(NULL, 'True', 'False'); -- Result: 'False'
SELECT IF(1 = 1, 'True', 'False'); -- Result: 'True'
SELECT IF(1 = 2, 'True', 'False'); -- Result: 'False'
SELECT IF(1 = 1, 1, 0); -- Result: 1
SELECT IF(1 = 2, 1, 0); -- Result: 0
SELECT IF(1 = 1, NULL, 0); -- Result: NULL
SELECT IF(1 = 2, 1, NULL);
-- Result: NULL

-- Example 40: Using IFNULL() function
-- IFNULL() function returns a value if the expression is NULL.
-- Returns the value if the expression is NULL.
-- Syntax: IFNULL(expression, value)

-- expression: The expression to evaluate.
-- If the expression is NULL, the result is value.
-- If the expression is not NULL, the result is the expression.

-- value: The value to return if the expression is NULL.
-- If the value is NULL, the result is NULL.
-- If the value is a number, it is converted to a string.

SELECT IFNULL(NULL, 'Default Value'); -- Result: 'Default Value'
SELECT IFNULL('Hello', 'Default Value'); -- Result: 'Hello'
SELECT IFNULL(123, 'Default Value'); -- Result: '123'
SELECT IFNULL(NULL, 123); -- Result: 123
SELECT IFNULL('Hello', 123);
-- Result: 'Hello'

-- Example 41: Using COALESCE() function
-- COALESCE() function returns the first non-NULL value in a list of expressions.
-- Returns the first non-NULL value in the list of expressions.
-- Syntax: COALESCE(expression1, expression2, expression3, ...)

-- expression1, expression2, expression3, ...: The expressions to evaluate.
-- If all expressions are NULL, the result is NULL.
-- If any expression is non-NULL, the result is the first non-NULL expression.

SELECT COALESCE(NULL, NULL); -- Result: NULL
SELECT COALESCE(NULL, NULL, NULL, 'Default Value'); -- Result: 'Default Value'
SELECT COALESCE(NULL, 'Hello', 'World'); -- Result: 'Hello'
SELECT COALESCE(NULL, 123, 'World'); -- Result: 123
SELECT COALESCE(NULL, NULL, 123);
-- Result: 123

-- Example 42: Using CASE WHEN statement
-- CASE WHEN statement evaluates a list of conditions and returns a value based on the first condition that is true.
-- Returns the value based on the first condition that is true.
-- Syntax: CASE WHEN condition1 THEN value1 WHEN condition2 THEN value2 ELSE default_value END [AS alias]

-- condition1, condition2: The conditions to evaluate.
-- If the condition is true, the corresponding value is returned.
-- If the condition is false, the next condition is evaluated.
-- If all conditions are false, the default_value is returned.

-- value1, value2: The values to return if the corresponding condition is true.
-- If the value is NULL, the result is NULL.
-- If the value is a number, the results is a number.
-- If the value is a string, the result is a string.


-- default_value: The value to return if all conditions are false.
-- If the default_value is NULL, the result is NULL.
-- If the default_value is a number, the result is a number.
-- If the default_value is a string, the result is a string.

-- alias: The name to give to the result set.
-- The alias is optional.
-- The KEYWORD AS is optional.
-- If the alias is not specified, the result is returned without a name.
-- If the alias is a number, the result is a number.
-- If the alias is a string, the result is a string.


SELECT CASE WHEN 1 = 1 THEN 'True' ELSE 'False' END; -- Result: 'True'
SELECT CASE WHEN 1 = 2 THEN 'True' ELSE 'False' END; -- Result: 'False'
SELECT CASE WHEN 1 = 1 THEN 1 ELSE 0 END; -- Result: 1
SELECT CASE WHEN 1 = 2 THEN 1 ELSE 0 END; -- Result: 0
SELECT CASE WHEN 1 = 1 THEN NULL ELSE 0 END; -- Result: NULL
SELECT CASE WHEN 1 = 2 THEN 1 ELSE NULL END; -- Result: NULL
SELECT CASE WHEN 1 = 1 THEN 'True' ELSE 'False' END AS result; -- Result: 'True'
SELECT CASE WHEN 1 = 2 THEN 'True' ELSE 'False' END result; -- Result: 'False'
SELECT CASE
           WHEN 1 = 1 THEN 'True'
           WHEN 1 = 2 THEN 'False'
           ELSE 'Default'
           END;
-- Result: 'True'


-- Example 43: Using GROUP_CONCAT() function
-- GROUP_CONCAT() function concatenates values from a column into a single string.
-- Returns the concatenated string of values.
-- Syntax: GROUP_CONCAT(column_name)

-- column_name: The column to concatenate values from.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.
-- If the column has non-NULL values, the result is the concatenated string of values.
-- If the column has non-NULL values and NULL values, the result is the concatenated string of the non-NULL values.

SELECT GROUP_CONCAT(orderNumber) AS order_numbers
FROM orders;

-- Example 44: Using DISTINCT keyword
-- DISTINCT keyword removes duplicate rows from the result set.
-- Returns the unique rows in the result set.
-- Syntax: SELECT DISTINCT column_name1, column_name2, ... FROM table_name

-- column_name1, column_name2, ...: The columns to select unique values from.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.
-- If the column has duplicate values, the duplicates are removed.
-- If the column has non-NULL values and NULL values, the NULL values are included.

SELECT DISTINCT status
FROM orders;

-- Example 45: Using LIMIT() clause
-- LIMIT clause limits the number of rows returned in the result set.
-- Returns the specified number of rows in the result set.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name LIMIT number_of_rows [OFFSET offset]

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.
-- If the column has non-NULL values, the result is the values in the column.
-- If the column has non-NULL values and NULL values, the NULL values are included.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- number_of_rows: The number of rows to return in the result set.
-- If the number_of_rows is NULL, the result is an error.
-- If the number_of_rows is 0, the result is an empty result set.
-- If the number_of_rows is positive, the result is the specified number of rows.
-- If the number_of_rows is negative, the result is an error.

-- OFFSET offset: The number of rows to skip before returning the result set.
-- THe OFFSET keyword is optional.
-- If the offset is NULL, the result is an error.
-- If the offset is 0, the result is the specified number of rows starting from the number_of_rows.

SELECT *
FROM orders
LIMIT 2;

SELECT *
FROM orders
LIMIT 2 OFFSET 2;

SELECT *
FROM orders
LIMIT 2, 2;

SELECT *
FROM orders
LIMIT 2 OFFSET 0;

-- Example 46: Using ORDER BY clause
-- ORDER BY clause sorts the result set based on one or more columns.
-- Returns the sorted result set.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name ORDER BY column_name1 [ASC|DESC], column_name2 [ASC|DESC], ...

-- column_name1, column_name2, ...: The columns to sort the result set by.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.
-- If the column has non-NULL values, the result is the values in the column.
-- If the column has non-NULL values and NULL values, the NULL values are included.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- ASC: Sorts the result set in ascending order. Default sorting order. Optional.
-- DESC: Sorts the result set in descending order.

SELECT *
FROM orders
ORDER BY orderNumber;

SELECT *
FROM orders
ORDER BY orderNumber DESC;

SELECT *
FROM orders
ORDER BY orderNumber, status DESC;

SELECT o.orderNumber, productCode
FROM orders o
         JOIN orderdetails od ON od.orderNumber = o.orderNumber
ORDER BY 2, 1 DESC;

-- Example 47: Using GROUP BY clause
-- GROUP BY clause groups rows based on one or more columns.
-- Returns the grouped result set.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name GROUP BY column_name1, column_name2, ...

-- column_name1, column_name2, ...: The columns to group the result set by.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.
-- If the column has non-NULL values, the result is the values in the column.
-- If the column has non-NULL values and NULL values, the NULL values are included.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

SELECT status, COUNT(*)
FROM orders
GROUP BY status;

SELECT status, COUNT(*), SUM(quantityOrdered * priceEach) AS total_sales
FROM orders o
         JOIN orderdetails od ON od.orderNumber = o.orderNumber
GROUP BY status;

-- Example 48: Using HAVING clause
-- HAVING clause filters groups based on a condition.
-- Returns the filtered groups in the result set.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name GROUP BY column_name1, column_name2, ... HAVING condition

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- condition: The condition to filter the groups by.
-- If the condition is true, the group is included in the result set.
-- If the condition is false, the group is excluded from the result set.

SELECT status, COUNT(*), SUM(quantityOrdered * priceEach) AS total_sales
FROM orders o
         JOIN orderdetails od ON od.orderNumber = o.orderNumber
GROUP BY status
HAVING total_sales > 100000;

-- Example 49: Using column aliases
-- Column aliases provide a name for the column in the result set.
-- Returns the result set with the column aliases.
-- Syntax: SELECT column_name AS alias_name FROM table_name

-- column_name: The name of the column to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- AS: The keyword to assign a name to the column in the result set.
-- The AS keyword is optional.
-- If the AS keyword is used, the result is the column with the assigned name.
-- If the AS keyword is not used, the result is the column with the assigned name.

-- alias_name: The name to assign to the column in the result set.
-- If the alias_name is NULL, the result is NULL.
-- If the alias_name is an empty string, the result is an empty string.
-- If the alias_name is a number, it is converted to a string.
-- If the alias_name contains spaces, it must be enclosed in a single quote.

SELECT orderNumber AS order_number, status AS order_status
FROM orders;

SELECT orderNumber 'Order Number', status 'Order Status'
FROM orders;

-- Example 50: Using MD5() function
-- MD5() function calculates the MD5 hash of a string.
-- Returns the MD5 hash of the string.
-- Syntax: MD5(str)

-- str: The string to calculate the MD5 hash of.
-- If the string is NULL, the result is NULL.
-- If the string is an empty string, the result is 'd41d8cd98f00b204e9800998ecf8427e'.
-- If the string is a number, it is converted to a string.
-- If the string is a date, it is converted to a string.
-- If the string is a datetime, it is converted to a string.
-- If the string is a timestamp, it is converted to a string.

SELECT MD5(NULL); -- Result: NULL
SELECT MD5(''); -- Result: 'd41d8cd98f00b204e9800998ecf8427e'
SELECT MD5('Hello World'); -- Result: 'ed076287532e86365e841e92bfc50d8c'
SELECT MD5(1234); -- Result: '81dc9bdb52d04dc20036dbd8313ed055'
SELECT MD5(NOW());
-- Result: 'f7b1c671e8f3b0fbd4e3e3b7b7b7b7b7'

-- Example 51: Using UUID() function
-- UUID() function generates a Universally Unique Identifier (UUID).
-- Returns the UUID.
-- Syntax: UUID()

SELECT UUID();
-- Result: 'f7b1c671-e8f3-b0fb-d4e3-e3b7b7b7b7b7'

-- Example 52: Using RAND() function
-- RAND() function generates a random number between 0 and 1.
-- Returns the random number.
-- Syntax: RAND()

SELECT RAND(); -- Result: 0.123456789
SELECT TRUNCATE(RAND() * 10 + 1, 0);
-- Generates a random number between 1 and 10

-- Example 53: Using CAST() function
-- CAST() function converts a value to a specified data type.
-- Returns the value converted to the specified data type.
-- Syntax: CAST(value AS data_type)

-- value: The value to convert to the specified data type.
-- If the value is NULL, the result is NULL.
-- If the value is a number, it is converted to the specified data type.
-- If the value is a string, it is converted to the specified data type.
-- If the value is a date, it is converted to the specified data type.
-- If the value is a datetime, it is converted to the specified data type.
-- If the value is a timestamp, it is converted to the specified data type.

-- data_type: The data type to convert the value to.
-- The data type can be one of the following:
-- DATE: Converts the value to a date.
-- DATETIME: Converts the value to a datetime.
-- TIME: Converts the value to a time.
-- CHAR: Converts the value to a string.
-- SIGNED: Converts the value to a signed 64-bit integer.
-- UNSIGNED: Converts the value to an unsigned 64-bit integer.
-- BINARY: Converts the value to a binary string.

SELECT CAST('2022-01-05' AS DATE); -- Result: 2022-01-05
SELECT CAST('2022-01-05' AS DATETIME); -- Result: 2022-01-05 00:00:00
SELECT CAST('2022-01-05' AS TIME); -- Result: 00:00:00
SELECT CAST('2022-01-05' AS CHAR); -- Result: '2022-01-05'
SELECT CAST(1234 AS SIGNED); -- Result: 1234
SELECT CAST(1234 AS UNSIGNED); -- Result: 1234
SELECT CAST(-1234 AS UNSIGNED); -- Result: 18446744073709550382
SELECT CAST('2' AS BINARY); -- Result: '2'
SELECT CAST(TRUE AS BINARY); -- Result: '1'
SELECT CAST(FALSE AS BINARY); -- Result: '0'
SELECT CAST(NOW() AS DATE); -- Result: 2022-01-05
SELECT CAST(NOW() AS DATETIME); -- Result: 2022-01-05 12:30:45
SELECT CAST(NOW() AS TIME); -- Result: 12:30:45
SELECT CAST(NOW() AS CHAR); -- Result: '2022-01-05 12:30:45'
SELECT CAST(NOW() AS SIGNED); -- Result: 20220105123045
SELECT CAST(NOW() AS UNSIGNED); -- Result: 20220105123045
SELECT CAST(NOW() AS BINARY);
-- Result: '2022-01-05 12:30:45'

-- Example 54: Using Logical Operators
-- Logical operators are used to combine conditions in a WHERE clause.
-- Returns the rows that satisfy the conditions.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE condition1 AND condition2 OR condition3

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- condition1, condition2, condition3: The conditions to combine using logical operators.
-- If the condition is true, the row is included in the result set.
-- If the condition is false, the row is excluded from the result set.

-- AND: Combines two conditions and returns true if both conditions are true.
-- OR: Combines two conditions and returns true if at least one condition is true.
-- NOT: Negates a condition and returns true if the condition is false.
-- BETWEEN: Returns true if a value is within a range.
-- EXIST: Returns true if a subquery returns any rows.
-- IN: Returns true if a value is in a list of values.
-- ALL: Returns true if all values in a list of values are true.
-- ANY: Returns true if any value in a list of values is true.
-- SOME: Returns true if some values in a list of values are true.
-- IS NULL: Returns true if a value is NULL.
-- IS NOT NULL: Returns true if a value is not NULL.
-- LIKE: Returns true if a value matches a pattern.
-- RLIKE: Returns true if a value matches a regular expression.
-- REGEXP: Returns true if a value matches a regular expression.

-- Example 55: Using AND operator
SELECT *
FROM orders
WHERE status = 'Shipped'
  AND orderDate BETWEEN '2003-01-01' AND '2003-12-31';

-- Example 56: Using OR operator
SELECT *
FROM orders
WHERE status = 'Shipped'
   OR status = 'Resolved';

-- Example 57: Using NOT operator
SELECT *
FROM orders
WHERE status = 'Shipped'
  AND NOT (comments IS NULL OR comments = '');

-- Example 58: Using BETWEEN operator
SELECT *
FROM orders
WHERE status = 'Shipped'
  AND orderDate BETWEEN '2003-01-01' AND '2003-12-31';

-- Example 59: Using EXISTS operator
-- EXISTS operator returns true if a subquery returns any rows.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE EXISTS (SELECT column_name1 FROM table_name WHERE condition)

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- condition: The condition to evaluate.
-- If the condition is true, the row is included in the result set.
-- If the condition is false, the row is excluded from the result set.

SELECT *
FROM orders
WHERE EXISTS (SELECT * FROM orderdetails WHERE orderNumber = orders.orderNumber)
  AND status = 'Shipped';

-- Example 60: Using IN operator
SELECT *
FROM orders
WHERE status IN ('Shipped', 'Resolved');

-- Example 61: Using ALL operator
-- ALL operator returns true if all values in a list of values are true.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 > ALL (SELECT column_name1 FROM table_name WHERE condition)

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- condition: The condition to evaluate.
-- If the condition is true, the row is included in the result set.
-- If the condition is false, the row is excluded from the result set.


SELECT *
FROM orders
WHERE orderNumber > ALL (SELECT orderNumber FROM orders WHERE status = 'Shipped');

-- Example 62: Using ANY operator
-- ANY operator returns true if any value in a list of values is true.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 > ANY (SELECT column_name1 FROM table_name WHERE condition)

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- condition: The condition to evaluate.
-- If the condition is true, the row is included in the result set.
-- If the condition is false, the row is excluded from the result set.

SELECT *
FROM orders
WHERE orderNumber > ANY (SELECT orderNumber FROM orders WHERE status = 'Shipped')
  AND status = 'Resolved';

-- Example 63: Using SOME operator
-- SOME operator returns true if some values in a list of values are true.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 > SOME (SELECT column_name1 FROM table_name WHERE condition)

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- condition: The condition to evaluate.
-- If the condition is true, the row is included in the result set.
-- If the condition is false, the row is excluded from the result set.

SELECT *
FROM orders
WHERE orderNumber > SOME (SELECT orderNumber FROM orders WHERE status = 'Shipped')
  AND status = 'Resolved';

-- Example 64: Using IS NULL operator
-- IS NULL operator returns true if a value is NULL.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 IS NULL

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

SELECT *
FROM orders
WHERE comments IS NULL;

-- Example 65: Using IS NOT NULL operator
-- IS NOT NULL operator returns true if a value is not NULL.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 IS NOT NULL

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

SELECT *
FROM orders
WHERE comments IS NOT NULL;

-- Example 66: Using LIKE operator
-- LIKE operator returns true if a value matches a pattern.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 LIKE pattern

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- pattern: The pattern to match the value against.
-- The pattern can contain the following wildcards:
-- %: Matches any sequence of characters.
-- _: Matches any single character.

SELECT *
FROM orders
WHERE comments LIKE '%Customer%';

-- Example 67: Using RLIKE operator
-- RLIKE operator returns true if a value matches a regular expression.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 RLIKE pattern

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- pattern: The regular expression pattern to match the value against.
-- Regular expression patterns can contain the following characters:
-- .: Matches any single character.
-- ^: Matches the start of a string.
-- $: Matches the end of a string.
-- *: Matches zero or more occurrences of the preceding character.
-- +: Matches one or more occurrences of the preceding character.
-- ?: Matches zero or one occurrence of the preceding character.
-- []: Matches any character in the specified range.
-- [^]: Matches any character not in the specified range.
-- (): Groups characters together.
-- |: Matches either the characters before or after the operator.
-- \: Escapes a special character.
-- \d: Matches a digit character.
-- \D: Matches a non-digit character.
-- \w: Matches a word character.
-- \W: Matches a non-word character.
-- \s: Matches a whitespace character.
-- \S: Matches a non-whitespace character.
-- \b: Matches a word boundary.
-- \B: Matches a non-word boundary.
-- \1, \2, ...: Matches the nth group of characters.
-- \0: Matches the null character.

SELECT *
FROM orders
WHERE comments RLIKE 'Customer';

-- Example 68: Using REGEXP operator
-- REGEXP operator returns true if a value matches a regular expression.
-- Syntax: SELECT column_name1, column_name2, ... FROM table_name WHERE column_name1 REGEXP pattern

-- column_name1, column_name2, ...: The columns to select from the table.
-- If the column is NULL, the result is NULL.
-- If the column is empty, the result is an empty string.

-- table_name: The name of the table to select from.
-- If the table does not exist, the result is an error.
-- If the table exists, the result is the rows in the table.

-- pattern: The regular expression pattern to match the value against.

SELECT *
FROM orders
WHERE comments REGEXP 'Customer';

-- Local Variables
-- Local variables are used to store values temporarily in a session.
-- Returns the value stored in the local variable.
-- Syntax: SET @variable_name := value;

-- variable_name: The name of the local variable.
-- If the variable_name is NULL, the result is NULL.
-- If the variable_name is an empty string, the result is an empty string.
-- If the variable_name is a number, it is converted to a string.
-- If the variable_name is a string, the result is the string.
-- If the variable_name is a date, it is converted to a string.
-- If the variable_name is a datetime, it is converted to a string.
-- If the variable_name is a timestamp, it is converted to a string.

-- value: The value to store in the local variable.
-- If the value is NULL, the result is NULL.
-- If the value is an empty string, the result is an empty string.
-- If the value is a number, it is converted to a string.
-- If the value is a string, the result is the string.
-- If the value is a date, it is converted to a string.
-- If the value is a datetime, it is converted to a string.
-- If the value is a timestamp, it is converted to a string.

SET @total := 0;
SELECT @total := @total + quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 70: Using Compound Operators
-- +=: Adds a value to a variable and assigns the result to the variable.
-- -=: Subtracts a value from a variable and assigns the result to the variable.
-- *=: Multiplies a variable by a value and assigns the result to the variable.
-- /=: Divides a variable by a value and assigns the result to the variable.
-- %=: Calculates the remainder of a variable divided by a value and assigns the result to the variable.
-- &=: Performs a bitwise AND operation on a variable and a value and assigns the result to the variable.
-- |=: Performs a bitwise OR operation on a variable and a value and assigns the result to the variable.
-- ^=: Performs a bitwise XOR operation on a variable and a value and assigns the result to the variable.
-- <<=: Shifts a variable left by a value and assigns the result to the variable.
-- >>=: Shifts a variable right by a value and assigns the result to the variable.

-- Example 69: Using += operator
SET @total := 0;
SELECT @total := @total + quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 70: Using -= operator
SET @total := 0;
SELECT @total := @total - quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 71: Using *= operator
SET @total := 1;
SELECT @total := @total * quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 72: Using /= operator
SET @total := 1;
SELECT @total := @total / quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 73: Using %= operator
SET @total := 1;
SELECT @total := @total % quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 74: Using &= operator
SET @total := 1;
SELECT @total := @total & quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 75: Using |= operator
SET @total := 1;
SELECT @total := @total | quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 76: Using ^= operator
SET @total := 1;
SELECT @total := @total ^ quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 77: Using <<= operator
SET @total := 1;
SELECT @total := @total << quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 78: Using >>= operator
SET @total := 1;
SELECT @total := @total >> quantityOrdered * priceEach AS total_sales
FROM orderdetails;

-- Example 79: Using Stored Procedures
-- Stored procedures are used to execute a set of SQL statements.
-- Returns the result of the stored procedure.
-- Syntax: CREATE PROCEDURE procedure_name() BEGIN SQL statements END;

-- procedure_name: The name of the stored procedure.
-- If the procedure_name is NULL, the result is an error.
-- If the procedure_name is an empty string, the result is an error.
-- If the procedure_name is a number, it is converted to a string.
-- If the procedure_name is a string, the result is the string.

-- SQL statements: The SQL statements to execute in the stored procedure.
-- If the SQL statements are NULL, the result is an error.
-- If the SQL statements are an empty string, the result is an error.
-- If the SQL statements are a number, it is converted to a string.
-- If the SQL statements are a string, the result is the string.

CREATE PROCEDURE get_orders()
BEGIN
    SELECT *
    FROM orders;
END;

CALL get_orders();