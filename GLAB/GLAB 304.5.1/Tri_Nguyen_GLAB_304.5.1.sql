/*
### Using MOD(dividend, divisor) function ###
    The MOD() function calculates the remainder of a division.

-- Syntax:
    MOD(dividend, divisor)

-- Return:
    Returns the remainder of the division of the dividend by the divisor.

-- dividend:
    The number to be divided
    - If the dividend is 0, the result is 0.

-- divisor:
    The number to divide by.
    - If the divisor is 0, the result is NULL.

-- Example:
    SELECT MOD(10, 3); -- Result: 1
    SELECT MOD(10, 5); -- Result: 0
    SELECT MOD(10, 7); -- Result: 3
    SELECT MOD(10, 0); -- Result: NULL
*/

/*
### Using Truncate(number, decimal_places) function ###
    The Truncate(number, decimal_places) function truncates a number to a specified number of decimal places.

-- Syntax:
    TRUNCATE(number, decimal_places)

-- Return:
    Returns the number truncated to the specified decimal places.

-- number:
    The number to be truncated

-- decimal_places:
    The number of decimal places to truncate to
    - If the decimal_places is zero, the result is the number truncated to an integer.
    - If the decimal_places is positive, the result is the number truncated to the specified decimal places.
    - If the decimal_places is negative, the result is the number truncated to the nearest 10, 100, 1000, etc.

-- Example 1:
    - Truncate the number 1.555 to 0, 1, 2, 3, and 4 decimal places
    SELECT TRUNCATE(1.555, 0); -- Result: 1
    SELECT TRUNCATE(1.555, 1); -- Result: 1.5
    SELECT TRUNCATE(1.555, 2); -- Result: 1.55
    SELECT TRUNCATE(1.555, 3); -- Result: 1.555
    SELECT TRUNCATE(1.555, 4); -- Result: 1.555

-- Example 2:
    - Truncate the number -1.555 to 10, 100, 1000, and 10000 decimal places
    SELECT TRUNCATE(1555.5, -1); -- Result: 1550
    SELECT TRUNCATE(1555.5, -2); -- Result: 1500
    SELECT TRUNCATE(1555.5, -3); -- Result: 1000
    SELECT TRUNCATE(1555.5, -4); -- Result: 0
*/

/*
### Using ROUND(number, decimal_places) function ###
    The ROUND(number, decimal_places) function rounds a number to a specified number of decimal places.

-- Syntax:
    ROUND(number, decimal_places)

-- Return:
    Returns the number rounded to the specified decimal places.

-- number:
    The number to be rounded
    - If the number is an integer, the result is the number itself.
    - If the number is a negative number, the result is rounded towards zero.
    - If the number is a positive number, the result is rounded away from zero.

-- Optional: decimal_places
    The number of decimal places to round to
    - If the decimal_places is not specified, the number is rounded to 0 decimal places.
    - If the decimal_places is negative, the number is rounded to the nearest 10, 100, 1000, etc.

-- Example 1:
    - Round the number 1.555 to 0, 1, 2, 3, and 4 decimal places
    SELECT ROUND(1.555); -- Result: 2
    SELECT ROUND(1.555, 0); -- Result: 2
    SELECT ROUND(1.555, 1); -- Result: 1.6
    SELECT ROUND(1.555, 2); -- Result: 1.56
    SELECT ROUND(1.555, 3); -- Result: 1.555
    SELECT ROUND(1.555, 4); -- Result: 1.555

-- Example 2:
    - Round the number -1.555 to 0, 1, 2, 3, and 4 decimal places
    SELECT ROUND(-1.555); -- Result: -2
    SELECT ROUND(-1.555, 0); -- Result: -2
    SELECT ROUND(-1.555, 1); -- Result: -1.6
    SELECT ROUND(-1.555, 2); -- Result: -1.56
    SELECT ROUND(-1.555, 3); -- Result: -1.555
    SELECT ROUND(-1.555, 4); -- Result: -1.555

-- Example 3:
    - Round the number 1.555 to 10, 100, 1000, and 10000 decimal places
    SELECT ROUND(122.25, -1); -- Result: 120
    SELECT ROUND(122.25, -2); -- Result: 100
    SELECT ROUND(122.25, -3); -- Result: 0
    SELECT ROUND(122.25, -4); -- Result: 0
*/

/*
### Using Replace() function ###
    The REPLACE() function replaces all occurrences of a substring in a string.

-- Syntax:
    REPLACE(str, from_str, to_str)

-- Return:
    Returns the string with all occurrences of the from_str replaced with the to_str.

-- str:
    The string to search and replace

-- from_str:
    The substring to be replaced
    - If the from_str is not found in the string, the result is the original string.

-- to_str:
    The replacement substring

-- Example 1:
    SELECT REPLACE('', 'World', 'Universe'); -- Result: ''
    SELECT REPLACE('Hello World', 'World', 'Universe'); -- Result: 'Hello Universe'
    SELECT REPLACE('Hello World', '', 'Universe'); -- Result: 'Hello World'
    SELECT REPLACE('Hello World', 'World', ''); -- Result: 'Hello '

-- Example 2:
    - Update the productCode column in the products table to replace 'S10_' with 'S20_'
    UPDATE products
    SET productCode = REPLACE(productCode, 'S10_', 'S20_')
    WHERE productCode LIKE 'S10_%';
*/

/*
### Using DATEDIFF() function ###
    The DATEDIFF() function calculates the number of days between two dates.

-- Syntax:
    DATEDIFF(date1, date2)

-- Return:
    Returns the number of days between date1 and date2.

-- date1, date2:
    The dates to be compared
    - If date1 is earlier than date2, the result is negative.
    - If date1 is later than date2, the result is positive.
    - If date1 is the same as date2, the result is 0.

-- Example:
    SELECT DATEDIFF('2011-08-17', '2011-08-17'); -- Result: 0 days
    SELECT DATEDIFF('2011-08-17', '2011-08-08'); -- Result: 9 days
    SELECT DATEDIFF('2011-08-08', '2011-08-17'); -- Result: -9 days
    SELECT DATEDIFF('2011-08-17', '2011-08-18'); -- Result: -1 days
    SELECT DATEDIFF('2011-08-18', '2011-08-17'); -- Result: 1 days
*/

/*
### Using DATE_FORMAT() function ###
    The DATE_FORMAT() function formats a date as a string.

-- Syntax:
    DATE_FORMAT(date, format)

-- Return:
    Returns the date formatted as a string

-- date:
    The date to be formatted
    - The date can be a date, datetime, timestamp, or string.
    - If the date is a string, the format must be 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.
    - If the date is a date, the time part is set to '00:00:00'.
    - If the date is a datetime, the time part is included.
    - If the date is a timestamp, the time part is included.

-- format:
    The format of the date
    - The format can be a string, a number, or a combination of both.
    - The format can include the following format specifiers:
        - Year:
            %Y - Year with century as a numeric value (0000-9999)
            %y - Year without century as a numeric value (00-99)
        - Month:
            %b - Abbreviated month name (Jan-Dec)
            %M - Full month name (January-December)
            %m - Month as a numeric value (00-12)
            %c - Month as a numeric value (0-12)
        - Weekday:
            %a - Abbreviated day of the week (Sun-Sat)
            %W - Full day of the week (Sunday-Saturday)
            %w - Day of the week (0=Sunday, 1=Monday, ..., 6=Saturday)
        - Day:
            %D - Day of the month with ordinal suffix (1st-31st)
            %d - Day of the month as a numeric value (01-31)
            %e - Day of the month as a numeric value (1-31)
        - Time:
            %T - Time in 24-hour format (HH:MM:SS)
            %r - Time in 12-hour format (HH:MM:SS AM/PM)
        - Hour:
            %H - Hour (00-23)
            %h - Hour (01-12)
            %k - Hour (0-23)
            %l - Hour (1-12)
            %I - Hour (01-12)
        - Minute:
            %i - Minute (00-59)
        - Second:
            %s - Second (00-59)
        - AM/PM:
            %p - AM or PM
        - Timezone:
            %z - Timezone offset in the format '+HH:MM' or '-HH:MM'
            %Z - Timezone name or abbreviation

-- Example 1:
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %H:%i:%s'); -- Result: '2022-01-05 12:30:45'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %r'); -- Result: '2022-01-05 12:30:45 PM'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %T'); -- Result: '2022-01-05 12:30:45'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %p'); -- Result: '2022-01-05 PM'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %z'); -- Result: '2022-01-05 +00:00'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Y-%m-%d %Z'); -- Result: '2022-01-05 UTC'

-- Example 2:
    SELECT DATE_FORMAT('2022-01-05', '%Y-%m-%d'); -- Result: '2022-01-05'
    SELECT DATE_FORMAT('2022-01-05', '%a %D %b %Y'); -- Result: 'Wed 5th Jan 2022'
    SELECT DATE_FORMAT('2022-01-05', '%W %D %M %Y'); -- Result: 'Wednesday 5th January 2022'

-- Example 3:
    SELECT DATE_FORMAT('2022-01-05', '%H:%i:%s'); -- Result: '00:00:00'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%H:%i:%s'); -- Result: '12:30:45'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%r'); -- Result: '12:30:45 PM'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%T'); -- Result: '12:30:45'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%p'); -- Result: 'PM'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%z'); -- Result: '+00:00'
    SELECT DATE_FORMAT('2022-01-05 12:30:45', '%Z'); -- Result: 'UTC'

-- Example 4:
    SELECT DATE_FORMAT(CURRENT_DATE(), '%Y-%m-%d %H:%i:%s'); -- Result: '2022-01-05 00:00:00'
    SELECT DATE_FORMAT(CURRENT_DATE(), '%a %D %b %Y'); -- Result: 'Wed 5th Jan 2022'
    SELECT DATE_FORMAT(CURRENT_DATE(), '%W %D %M %Y'); -- Result: 'Wednesday 5th January 2022'

-- Example 5:
    SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s'); -- Result: '2022-01-05 12:30:45'
    SELECT DATE_FORMAT(NOW(), '%a %D %b %Y'); -- Result: 'Wed 5th Jan 2022'
    SELECT DATE_FORMAT(NOW(), '%W %D %M %Y'); -- Result: 'Wednesday 5th January 2022'

-- Example 6:
    SELECT orderNumber,
           DATE_FORMAT(orderdate, '%Y-%m-%d')       orderDate,
           DATE_FORMAT(requireddate, '%a %D %b %Y') requireddate,
           DATE_FORMAT(shippedDate, '%W %D %M %Y')  shippedDate
    FROM orders;

-- Example 7:
    SELECT orderNumber,
           DATE_FORMAT(shippeddate, '%W %D %M %Y') AS 'Shipped date'
    FROM orders
    ORDER BY shippeddate;
*/

/*
### Using CURRENT_DATE() ###
    The CURRENT_DATE() function returns the current date.
    - The CURRENT_DATE() function is equivalent to the CURDATE() function.

-- Syntax:
    CURRENT_DATE()

-- Return:
    Returns the current date in string format in 'YYYY-MM-DD' format.
    - Numeric format in 'YYYYMMDD' format.

-- Example:
    SELECT CURRENT_DATE(); -- Result: '2022-01-05'
    SELECT CURRENT_DATE() + 0; -- Result: 20220105
*/

/*
### Using CURRENT_TIME() ###
    The CURRENT_TIME() function returns the current time.
    - The CURRENT_TIME() function is equivalent to the CURTIME() function.

-- Syntax:
    CURRENT_TIME([fsp])

-- Return:
    Returns the current time in string format in 'HH:MM:SS' format.
    - 'HH:MM:SS.SSS' format if the fractional seconds are specified.
    - Numeric format in 'HHMMSS' format.
    - Or in 'HHMMSS.SSS' format if the fractional seconds are specified.

-- Optional: fsp
    The fractional seconds precision
    - If the fractional seconds precision is not specified, the result is in 'HH:MM:SS' format.
    - If the fractional seconds precision is specified, the result is in 'HH:MM:SS.SSS' format.

-- Example:
    SELECT CURRENT_TIME(); -- Result: '12:30:45'
    SELECT CURRENT_TIME() + 0; -- Result: 123045
    SELECT CURRENT_TIME(3); -- Result: '12:30:45.123'
    SELECT CURRENT_TIME(3) + 0; -- Result: 123045.123
*/

/*
### Using CURRENT_TIMESTAMP() ###
    The CURRENT_TIMESTAMP() function returns the current date and time.
    - The CURRENT_TIMESTAMP() function is equivalent to the NOW() function.

-- Syntax:
    CURRENT_TIMESTAMP([fsp])
    - Optional: fsp - The fractional seconds precision

-- Return:
    Returns the current date and time in string format in 'YYYY-MM-DD HH:MM:SS' format.
    - 'YYYY-MM-DD HH:MM:SS.SSS' format if the fractional seconds are specified.
    - Numeric format in 'YYYYMMDDHHMMSS' format.
    - Or in 'YYYYMMDDHHMMSS.SSS' format if the fractional seconds are specified.

-- Optional: fsp
    The fractional seconds precision
    - If the fractional seconds precision is not specified, the result is in 'YYYY-MM-DD HH:MM:SS' format.
    - If the fractional seconds precision is specified, the result is in 'YYYY-MM-DD HH:MM:SS.SSS' format.

-- Example:
    SELECT CURRENT_TIMESTAMP(); -- Result: '2022-01-05 12:30:45'
    SELECT CURRENT_TIMESTAMP() + 0; -- Result: 20220105123045
    SELECT CURRENT_TIMESTAMP(3); -- Result: '2022-01-05 12:30:45.123'
    SELECT CURRENT_TIMESTAMP(3) + 0; -- Result: 20220105123045.123
*/

/*
### Using LPAD(str, len, padstr) function ###
    The LPAD() function left-pads a string with another string to a specified length.

-- Syntax:
    LPAD(str, len, padstr)

-- Return:
    Returns the string left-padded with the padstr to the len.

-- str:
    The string to be left-padded

-- len:
    The length of the resulting string
    - If the len is negative, the result is NULL.
    - If the len is 0, the result is an empty string.
    - If the len less than the length of the string, the result is the original string truncated to the len.
    - If the len is equal to the length of the string, the result is the original string.
    - If the len is greater than the length of the string, the result is the string left-padded with the padstr to the len.

-- padstr:
    The string used to pad the original string

-- Example:
    SELECT LPAD('hi', -1, '??'); -- Result: null
    SELECT LPAD('hi', 0, '??'); -- Result: ''
    SELECT LPAD('hi', 1, '??'); -- Result: 'h'
    SELECT LPAD('hi', 2, '??'); -- Result: 'hi'
    SELECT LPAD('hi', 3, '??'); -- Result: '?hi'
    SELECT LPAD('hi', 4, '??'); -- Result: '??hi'
    SELECT LPAD('hi', 5, 5); -- Result: '555hi
    SELECT LPAD('', 4, '??'); -- Result: '????'
*/

/*
### Using TRIM() function ###
    The TRIM() function removes the leading and trailing characters from a string.

-- Syntax:
    TRIM([BOTH | LEADING | TRAILING] [removed_character FROM] str)

-- Return:
    Returns the string with the either leading, trailing, or both characters removed.

-- Optional: BOTH | LEADING | TRAILING
    The keyword to specify the characters to be removed.
    - If either BOTH, LEADING, or TRAILING is specified, the removed_character must be specified.
    - If the BOTH, LEADING, or TRAILING is not specified, the default is BOTH and the default removed_character is a space character.
    - BOTH: Removes the leading and trailing characters
    - LEADING: Removes the leading characters
    - TRAILING: Removes the trailing characters

-- Optional: removed_character
    The character to be removed.
    - If the removed_character is specified, the keyword FROM must be used.
    - If the removed_character is an empty string, the result is the original string.
    - If the removed_character is not specified, the default is a space character.

-- FROM:
    The keyword FROM must be used when the removed_character is specified.

-- str:
    The string to be trimmed
    - If the string is an empty string, the result is an empty string.

-- Example 1:
    SELECT TRIM(''); -- Result: ''
    SELECT TRIM('  '); -- Result: ''
    SELECT TRIM('  SQL TRIM function  '); -- Result: 'SQL TRIM function'

-- Example 2:
    SELECT TRIM(LEADING '' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function  '
    SELECT TRIM(LEADING ' ' FROM '  SQL TRIM function  '); -- Result: 'SQL TRIM function  '

-- Example 3:
    SELECT TRIM(TRAILING '' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function  '
    SELECT TRIM(TRAILING ' ' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function'

-- Example 4:
    SELECT TRIM(BOTH '' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function  '
    SELECT TRIM(BOTH ' ' FROM '  SQL TRIM function  '); -- Result: 'SQL TRIM function'

-- Example 5:
    SELECT TRIM('' FROM '  SQL TRIM function  '); -- Result: '  SQL TRIM function  '
    SELECT TRIM('/' FROM '/SQL TRIM function/'); -- Result: 'SQL TRIM function'
*/

/*
### Using SQL LTRIM() function ###
    The LTRIM() function removes the leading spaces from a string.

-- Syntax:
    LTRIM(str)

-- Return:
    Returns the string with the leading spaces removed.

-- str:
    The string to be trimmed
    - Trims the leading spaces from the string.
    - If the string is an empty string, the result is an empty string.

-- Example:
    SELECT LTRIM(''); -- Result: ''
    SELECT LTRIM('  '); -- Result: ''
    SELECT LTRIM('  SQL LTRIM function'); -- Result: 'SQL LTRIM function'
    SELECT LTRIM('  SQL LTRIM function  '); -- Result: 'SQL LTRIM function  '
*/

/*
### Using RTRIM() function ###
    The RTRIM() function removes the trailing spaces from a string.

-- Syntax:
    RTRIM(str)

-- Return:
    Returns the string with the trailing spaces removed.

-- str:
    The string to be trimmed
    - Trims the trailing spaces from the string.
    - If the string is an empty string, the result is an empty string.

-- Example:
    SELECT RTRIM(''); -- Result: ''
    SELECT RTRIM('  '); -- Result: ''
    SELECT RTRIM('SQL RTRIM function  '); -- Result: 'SQL RTRIM function'
    SELECT RTRIM('  SQL RTRIM function  '); -- Result: '  SQL RTRIM function'
*/

/*
### Using YEAR() function ###
    The YEAR() function extracts the year from a date.

-- Syntax:
    YEAR(date)

-- Return:
    Returns the year extracted from the date.

-- date:
    The date to extract the year from
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT YEAR('2002-01-01'); -- Result: 2002
    SELECT YEAR('2002-01-01 12:30:45'); -- Result: 2002
    SELECT YEAR('2002-01-01 12:30:45.123'); -- Result: 2002;
    SELECT YEAR(CURDATE()); -- Result: 2022
    SELECT YEAR(CURRENT_DATE()); -- Result: 2022
    SELECT YEAR(NOW()); -- Result: 2022
    SELECT YEAR(CURTIME()); -- Result: 0
    SELECT YEAR(CURRENT_TIME()); -- Result: 0
    SELECT YEAR(CURRENT_TIMESTAMP()); -- Result: 2022
*/

/*
### Using MONTH() function ###
    The MONTH() function extracts the month from a date.

-- Syntax:
    MONTH(date)

-- Return:
    Returns the month extracted from the date.

-- date:
    The date to extract the month from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT MONTH('2022-01-05'); -- Result: 1
    SELECT MONTH('2022-01-05 12:30:45'); -- Result: 1
    SELECT MONTH('2022-01-05 12:30:45.123'); -- Result: 1
    SELECT MONTH(CURDATE()); -- Result: 1
    SELECT MONTH(CURRENT_DATE()); -- Result: 1
    SELECT MONTH(NOW()); -- Result: 1
    SELECT MONTH(CURTIME()); -- Result: 1
    SELECT MONTH(CURRENT_TIME()); -- Result: 1
    SELECT MONTH(CURRENT_TIMESTAMP()); -- Result: 1
*/

/*
### Using DAY() function ###
    The DAY() function extracts the day of the month from a date.

-- Syntax:
    DAY(date)

-- Return:
    Returns the day of the month extracted from the date.

-- date:
    The date to extract the day of the month from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT DAY('2022-01-05'); -- Result: 5
    SELECT DAY('2022-01-05 12:30:45'); -- Result: 5
    SELECT DAY('2022-01-05 12:30:45.123'); -- Result: 5
    SELECT DAY(CURDATE()); -- Result: 5
    SELECT DAY(CURRENT_DATE()); -- Result: 5
    SELECT DAY(NOW()); -- Result: 5
    SELECT DAY(CURTIME()); -- Result: 5
    SELECT DAY(CURRENT_TIME()); -- Result: 5
    SELECT DAY(CURRENT_TIMESTAMP()); -- Result: 5
*/

/*
### Using DAYNAME() function ###
    The DAYNAME() function extracts the day of the week from a date.

-- Syntax:
    DAYNAME(date)

-- Return:
    Returns the day of the week extracted from the date as a string.

-- date:
    The date to extract the day of the week from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT DAYNAME('2022-01-05'); -- Result: Wednesday
    SELECT DAYNAME('2022-09-05'); -- Result: Monday
    SELECT DAYNAME('2022-01-05 12:30:45'); -- Result: Wednesday
    SELECT DAYNAME('2022-01-05 12:30:45.123'); -- Result: Wednesday
    SELECT DAYNAME(CURDATE()); -- Result: Wednesday
    SELECT DAYNAME(CURRENT_DATE()); -- Result: Wednesday
    SELECT DAYNAME(NOW()); -- Result: Wednesday
    SELECT DAYNAME(CURTIME()); -- Result: Wednesday
    SELECT DAYNAME(CURRENT_TIME()); -- Result: Wednesday
    SELECT DAYNAME(CURRENT_TIMESTAMP()); -- Result: Wednesday
*/

/*
### Using DAYOFWEEK() function ###
    The DAYOFWEEK() function extracts the day of the week from a date.

-- Syntax:
    DAYOFWEEK(date)

-- Return:
    Returns the day of the week extracted from the date as a number (1=Sunday, 2=Monday, ..., 7=Saturday).

-- date:
    The date to extract the day of the week from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT DAYOFWEEK('2022-01-05'); -- Result: 4
    SELECT DAYOFWEEK('2022-09-05'); -- Result: 2
    SELECT DAYOFWEEK('2022-01-05 12:30:45'); -- Result: 4
    SELECT DAYOFWEEK('2022-01-05 12:30:45.123'); -- Result: 4
    SELECT DAYOFWEEK(CURDATE()); -- Result: 4
    SELECT DAYOFWEEK(CURRENT_DATE()); -- Result: 4
    SELECT DAYOFWEEK(NOW()); -- Result: 4
    SELECT DAYOFWEEK(CURTIME()); -- Result: 4
    SELECT DAYOFWEEK(CURRENT_TIME()); -- Result: 4
    SELECT DAYOFWEEK(CURRENT_TIMESTAMP()); -- Result: 4
*/

/*
### Using DAYOFYEAR() function ###
    The DAYOFYEAR() function extracts the day of the year from a date.

-- Syntax:
    DAYOFYEAR(date)

-- Return:
    The day of the year extracted from the date.

-- date:
    The date to extract the day of the year from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT DAYOFYEAR('2022-01-05'); -- Result: 5
    SELECT DAYOFYEAR('2022-09-05'); -- Result: 248
    SELECT DAYOFYEAR('2022-01-05 12:30:45'); -- Result: 5
    SELECT DAYOFYEAR('2022-01-05 12:30:45.123'); -- Result: 5
    SELECT DAYOFYEAR(CURDATE()); -- Result: 5
    SELECT DAYOFYEAR(CURRENT_DATE()); -- Result: 5
    SELECT DAYOFYEAR(NOW()); -- Result: 5
    SELECT DAYOFYEAR(CURTIME()); -- Result: 5
    SELECT DAYOFYEAR(CURRENT_TIME()); -- Result: 5
    SELECT DAYOFYEAR(CURRENT_TIMESTAMP()); -- Result: 5
*/

/*
### Using WEEK() function ###
    The WEEK() function extracts the week of the year from a date.

-- Syntax:
    WEEK(date)

-- Return:
    Returns the week of the year extracted from the date as a number.

-- date:
    The date to extract the week of the year from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT WEEK('2022-01-05'); -- Result: 1
    SELECT WEEK('2022-09-05'); -- Result: 36
    SELECT WEEK('2022-01-05 12:30:45'); -- Result: 1
    SELECT WEEK('2022-01-05 12:30:45.123'); -- Result: 1
    SELECT WEEK(CURDATE()); -- Result: 1
    SELECT WEEK(CURRENT_DATE()); -- Result: 1
    SELECT WEEK(NOW()); -- Result: 1
    SELECT WEEK(CURTIME()); -- Result: 1
    SELECT WEEK(CURRENT_TIME()); -- Result: 1
    SELECT WEEK(CURRENT_TIMESTAMP()); -- Result: 1
*/

/*
### Using WEEKDAY() function ###
    The WEEKDAY() function extracts the day of the week from a date.

-- Syntax:
    WEEKDAY(date)

-- Return:
    Returns the day of the week extracted from the date as a number (0=Monday, 1=Tuesday, ..., 6=Sunday).

-- date:
    The date to extract the day of the week from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT WEEKDAY('2022-01-05'); -- Result: 2
    SELECT WEEKDAY('2022-09-05'); -- Result: 0
    SELECT WEEKDAY('2022-01-05 12:30:45'); -- Result: 2
    SELECT WEEKDAY('2022-01-05 12:30:45.123'); -- Result: 2
    SELECT WEEKDAY(CURDATE()); -- Result: 2
    SELECT WEEKDAY(CURRENT_DATE()); -- Result: 2
    SELECT WEEKDAY(NOW()); -- Result: 2
    SELECT WEEKDAY(CURTIME()); -- Result: 2
    SELECT WEEKDAY(CURRENT_TIME()); -- Result: 2
    SELECT WEEKDAY(CURRENT_TIMESTAMP()); -- Result: 2
*/

/*
### Using HOUR() function ###
    The HOUR() function extracts the hour from a date.

-- Syntax:
    HOUR(date)

-- Return:
    Returns the hour extracted from the date.

-- date:
    The date to extract the hour from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT HOUR('2022-01-05'); -- Result: 0
    SELECT HOUR('2022-01-05 12:30:45'); -- Result: 12
    SELECT HOUR('2022-01-05 12:30:45.123'); -- Result: 12
    SELECT HOUR(CURDATE()); -- Result: 0
    SELECT HOUR(CURRENT_DATE()); -- Result: 0
    SELECT HOUR(NOW()); -- Result: 12
    SELECT HOUR(CURTIME()); -- Result: 12
    SELECT HOUR(CURRENT_TIME()); -- Result: 12
    SELECT HOUR(CURRENT_TIMESTAMP()); -- Result: 12
*/

/*
### Using MINUTE() function ###
    The MINUTE() function extracts the minute from a date.

-- Syntax:
    MINUTE(date)

-- Return:
    Returns the minute extracted from the date.

-- date:
    The date to extract the minute from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT MINUTE('2022-01-05'); -- Result: 0
    SELECT MINUTE('2022-01-05 12:30:45'); -- Result: 30
    SELECT MINUTE('2022-01-05 12:30:45.123'); -- Result: 30
    SELECT MINUTE(CURDATE()); -- Result: 0
    SELECT MINUTE(CURRENT_DATE()); -- Result: 0
    SELECT MINUTE(NOW()); -- Result: 30
    SELECT MINUTE(CURTIME()); -- Result: 30
    SELECT MINUTE(CURRENT_TIME()); -- Result: 30
    SELECT MINUTE(CURRENT_TIMESTAMP()); -- Result: 30
*/

/*
### Using SECOND() function ###
    The SECOND() function extracts the second from a date.

-- Syntax:
    SECOND(date)

-- Return:
    Returns the second extracted from the date.

-- date:
    The date to extract the second from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.

-- Example:
    SELECT SECOND('2022-01-05'); -- Result: 0
    SELECT SECOND('2022-01-05 12:30:45'); -- Result: 45
    SELECT SECOND('2022-01-05 12:30:45.123'); -- Result: 45
    SELECT SECOND(CURDATE()); -- Result: 0
    SELECT SECOND(CURRENT_DATE()); -- Result: 0
    SELECT SECOND(NOW()); -- Result: 45
    SELECT SECOND(CURTIME()); -- Result: 45
    SELECT SECOND(CURRENT_TIME()); -- Result: 45
    SELECT SECOND(CURRENT_TIMESTAMP()); -- Result: 45
*/

/*
### Using NOW() function ###
    The NOW() function returns the current date and time.
    - NOW() function is a synonym for CURRENT_TIMESTAMP() function.

-- Syntax:
    NOW([fsp])

-- Return:
    Returns the current date and time in string format in 'YYYY-MM-DD HH:MM:SS' format.
    - 'YYYY-MM-DD HH:MM:SS.SSS' format if the fractional seconds are specified.
    - Numeric format in 'YYYYMMDDHHMMSS' format.
    - Or in 'YYYYMMDDHHMMSS.SSS' format if the fractional seconds are specified.

-- Optional: fsp
    The fractional seconds precision
    - If the fractional seconds precision is not specified, the result is in 'YYYY-MM-DD HH:MM:SS' format.
    - If the fractional seconds precision is specified, the result is in 'YYYY-MM-DD HH:MM:SS.SSS' format.

-- Example:
    SELECT NOW(); -- Result: '2022-01-05 12:30:45'
    SELECT NOW() + 0; -- Result: 20220105123045
    SELECT NOW(3); -- Result: '2022-01-05 12:30:45.123'
    SELECT NOW(3) + 0; -- Result: 20220105123045.123
*/

/*
### Using CURDATE() function ###
    The CURDATE() function returns the current date.

-- Syntax:
    CURDATE()

-- Return:
    Returns the current date in string format in 'YYYY-MM-DD' format.
    - Numeric format in 'YYYYMMDD' format.

-- Example:
    SELECT CURDATE(); -- Result: 2022-01-05
    SELECT CURDATE() + 0; -- Result: 20220105
*/

/*
### Using CURTIME() function ###
    The CURTIME() function returns the current time.

-- Syntax:
    CURTIME([fsp])

-- Return:
    Returns the current time in string format in 'HH:MM:SS' format.
    - 'HH:MM:SS.SSS' format if the fractional seconds are specified.
    - Numeric format in 'HHMMSS' format.
    - Or in 'HHMMSS.SSS' format if the fractional seconds are specified.

-- Optional: fsp
    The fractional seconds precision
    - If the fractional seconds precision is not specified, the result is in 'HH:MM:SS' format.
    - If the fractional seconds precision is specified, the result is in 'HH:MM:SS.SSS' format.

-- Example:
    SELECT CURTIME(); -- Result: 12:30:45
    SELECT CURTIME() + 0; -- Result: 123045
    SELECT CURTIME(3); -- Result: 12:30:45.123
    SELECT CURTIME(3) + 0; -- Result: 123045.123
*/

/*
### Using DATE_ADD() function ###
    DATE_ADD() function adds a specified time interval to a date.

-- Syntax:
    DATE_ADD(date, INTERVAL value unit)

-- Return:
    Returns the date after adding the time interval.

-- date:
    The date to add the time interval to.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.
    - If the date is a datetime, the time part is included.
    - If the date is a timestamp, the time part is included.

-- INTERVAL value unit:
    The time interval to add to the date

-- value:
    The value of the time interval
    - If the value is a number, the result is the number.
    - If the value is a string that can be converted to a number, the result is the number.

-- unit:
    The unit of the time interval
    - The unit can be YEAR, MONTH, DAY, HOUR, MINUTE, or SECOND.

-- Example:
    SELECT DATE_ADD('2022-01-05', INTERVAL '1' DAY); -- Result: 2022-01-06
    SELECT DATE_ADD('2022-01-05', INTERVAL 1 DAY); -- Result: 2022-01-06
    SELECT DATE_ADD('2022-01-05', INTERVAL 1 MONTH); -- Result: 2022-02-05
    SELECT DATE_ADD('2022-01-05', INTERVAL 1 YEAR); -- Result: 2023-01-05
    SELECT DATE_ADD('2022-01-05', INTERVAL 1 HOUR); -- Result: 2022-01-05 01:00:00
    SELECT DATE_ADD('2022-01-05', INTERVAL 1 MINUTE); -- Result: 2022-01-05 00:01:00
    SELECT DATE_ADD('2022-01-05', INTERVAL 1 SECOND); -- Result: 2022-01-05 00:00:01
*/

/*
### Using DATE_SUB() function ###
    DATE_SUB() function subtracts a specified time interval from a date.

-- Syntax:
    DATE_SUB(date, INTERVAL value unit)

-- Return:
    Returns the date after subtracting the time interval.

-- date:
    The date to subtract the time interval from.
    - The date can be a date, datetime, timestamp or string.
    - The string must be in the format 'YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS'.
    - If the date is a string that cannot be converted to a date, the result is NULL.
    - If the date is a datetime, the time part is included.
    - If the date is a timestamp, the time part is included.

-- INTERVAL value unit:
    The time interval to subtract from the date

-- value:
    The value of the time interval
    - If the value is a number, the result is the number.
    - If the value is a string that can be converted to a number, the result is the number.

-- unit:
    The unit of the time interval
    - The unit can be YEAR, MONTH, DAY, HOUR, MINUTE, or SECOND.

-- Example:
    SELECT DATE_SUB('2022-01-05', INTERVAL '1' DAY); -- Result: 2022-01-04
    SELECT DATE_SUB('2022-01-05', INTERVAL 1 DAY); -- Result: 2022-01-04
    SELECT DATE_SUB('2022-01-05', INTERVAL 1 MONTH); -- Result: 2021-12-05
    SELECT DATE_SUB('2022-01-05', INTERVAL 1 YEAR); -- Result: 2021-01-05
    SELECT DATE_SUB('2022-01-05', INTERVAL 1 HOUR); -- Result: 2022-01-04 23:00:00
    SELECT DATE_SUB('2022-01-05', INTERVAL 1 MINUTE); -- Result: 2022-01-04 23:59:00
    SELECT DATE_SUB('2022-01-05', INTERVAL 1 SECOND); -- Result: 2022-01-04 23:59:59
*/

/*
### Using COUNT(*) function ###
    COUNT(*) function returns the number of rows in a table, including rows with NULL values.
    - COUNT(*) function is often used with GROUP BY to count the number of rows in each group.

-- Syntax:
    COUNT(*)

-- Return:
    Returns the number of rows in a table.

-- Example 1:
    - Returns the number of rows in the table.
    SELECT COUNT(*) AS total_orders
    FROM orders; -- Result: 326

-- Example 2:
    - Returns the number of rows in the table for each group.
    SELECT status, COUNT(*) AS order_count
    FROM orders
    GROUP BY status;
*/

/*
### Using COUNT() function ###
    COUNT() function returns the number of non-NULL values in a column.
    - COUNT() function is often used with GROUP BY to count the number of non-NULL values in each group.

-- Syntax:
    COUNT([DISTINCT] column_name)

-- Return:
    Returns the number of non-NULL values in a column.

-- Optional: DISTINCT
    Removes duplicate values before counting the non-NULL values.

-- column_name:
    The column to count the non-NULL values in.
    - NULL values in the column are ignored.
    - If the column is empty, the result is 0.

-- Example 1:
    - Returns the number of non-NULL values in the column.
    SELECT COUNT(orderNumber) AS total_orders
    FROM orders; -- Result: 326

-- Example 2:
    - Returns the number of non-NULL values in the column for each group.
    SELECT status, COUNT(orderNumber) AS order_count
    FROM orders
    GROUP BY status;

-- Example 3:
    - Returns the number of non-NULL values in the column for each group without duplicates.
    SELECT status, COUNT(DISTINCT orderNumber) AS order_count
    FROM orders
    GROUP BY status;
*/

/*
### Using COUNT IF Function ###
    COUNT IF function returns the number of rows that meet a specified condition.
    - COUNT IF function is often used with GROUP BY to count the number of rows that meet a specified condition in each group.

-- Syntax:
    COUNT(IF condition, 1, NULL)

-- Return:
    Returns the number of rows that meet a specified condition.

-- condition:
    The condition to meet to count the row.
    - If the condition is TRUE, the result is 1.
    - If the condition is FALSE, the result is NULL.

-- Example 1:
    - Returns the number of rows that meet the specified condition.
    SELECT COUNT(IF status = 'Shipped', 1, NULL) AS shipped_orders
    FROM orders; -- Result: 303

-- Example 2:
    - Returns the number of rows that meet the specified condition for each group.
    SELECT status, COUNT(IF status = 'Shipped', 1, NULL) AS shipped_orders
    FROM orders
    GROUP BY status;
*/

/*
### Using MAX() ###
    MAX() function returns the maximum or null value in a column if the column is empty.
    - MAX() function is often used with GROUP BY to find the maximum value in each group.

-- Syntax:
    MAX([DISTINCT] column_name)

-- Return:
    The maximum value in a column or NULL if the column is empty.

-- Optional: DISTINCT
    Removes duplicate values before finding the maximum value.

-- column_name:
    The column in which the maximum value is found.
    - The values in the column must be numeric.
    - NULL values in the column are ignored.
    - If the column is empty, the result is NULL.

-- Example 1:
    - Returns the maximum value in the column.
    SELECT MAX(orderNumber) AS max_order_number
    FROM orders; -- Result: 10425

-- Example 2:
    - Returns the maximum value in the column for each group.
    SELECT status, MAX(orderNumber) AS max_order_number
    FROM orders
    GROUP BY status;

-- Example 3:
    - Returns the maximum value in the column for each group without duplicates.
    SELECT status, MAX(DISTINCT orderNumber) AS max_order_number
    FROM orders
    GROUP BY status;
*/

/*
### Using MIN() function ###
    MIN() function returns the minimum or null value in a column if the column is empty.
    - MIN() function is often used with GROUP BY to find the minimum value in each group.

-- Syntax:
    MIN([DISTINCT] column_name)

-- Return:
    Returns the minimum value in a column or NULL if the column is empty.

-- Optional: DISTINCT
    Removes duplicate values before finding the minimum value.

-- column_name:
    The column in which the minimum value is found.
    - The values in the column must be numeric.
    - NULL values in the column are ignored.
    - If the column is empty, the result is NULL.

-- Example 1:
    - Returns the minimum value in the column.
    SELECT MIN(orderNumber) AS min_order_number
    FROM orders; -- Result: 10100

-- Example 2:
    - Returns the minimum value in the column for each group.
    SELECT status, MIN(orderNumber) AS min_order_number
    FROM orders
    GROUP BY status;

-- Example 3:
    - Returns the minimum value in the column for each group without duplicates.
    SELECT status, MIN(DISTINCT orderNumber) AS min_order_number
    FROM orders
    GROUP BY status;
*/

/*
### Using CONCAT() function ###
    CONCAT() function concatenates two or more strings together.

-- Syntax:
    CONCAT(str1, str2, str3, ...)
    - Requires at least one argument.

-- Return:
    Returns the concatenated string.

-- str1, str2, str3, ...
    The strings to be concatenated.

-- Example 1:
    - Returns the concatenated string.
    SELECT CONCAT(''); -- Result: ''
    SELECT CONCAT('a'); -- Result: 'a'
    SELECT CONCAT('a', 5); -- Result: 'a5'
    SELECT CONCAT('Hello', ' ', 'World'); -- Result: 'Hello World'

-- Example 2:
    - Returns the concatenated string for each row in the table.
    SELECT CONCAT('Order Number: ', orderNumber) AS order_info
    FROM orders;
*/

/*
### Using CONCAT_WS() function ###
    CONCAT_WS() function concatenates two or more strings together with a separator between the strings.

-- Syntax:
    CONCAT_WS(separator, str1, str2, str3, ...)
    - Requires at least two arguments, the separator, and one string to concatenate.

-- Return:
    Returns the concatenated string with the separator between the strings.

-- separator
    The separator to use between the strings.
    - If the separator is an empty string, the result is the strings concatenated without a separator.

-- str1, str2, str3, ...
    The strings to be concatenated.

-- Example 1:
    - Returns the concatenated string with the separator between the strings.
    SELECT CONCAT_WS('', 'John', 'Doe'); -- Result: 'JohnDoe'
    SELECT CONCAT_WS(', ', 'John', 'Doe', '123 Main St'); -- Result: 'John, Doe, 123 Main St'
    SELECT CONCAT_WS(' - ', 'Order Number', 'd', NULL); -- Result: 'Order Number - d'
    SELECT CONCAT_WS(' - ', 'Order Number', 5); -- Result: 'Order Number - 5'

-- Example 2:
    - Returns the concatenated string with the separator for each row in the table.
    SELECT CONCAT_WS(' - ', 'Order Number', orderNumber) AS order_info
    FROM orders;
*/

/*
### Using SUBSTRING() function ###
    SUBSTRING() function extracts a substring from a string.

-- Syntax:
    SUBSTRING(str, start, length)
    - Requires at least two arguments, the string and the start position.

-- Return:
    Returns the extracted substring.

-- str:
    The string to extract the substring from.

-- start:
    The starting position of the substring.
    - If the start position is 0, the result is an empty string.
    - If the start position is 1, it starts from the beginning of the string.
    - If the start position is greater than the length of the string, the result is an empty string.
    - If the start position is negative, it starts from the end of the string.

-- length:
    The length of the substring.
    - If the length is 0, it returns an empty string.
    - If the length is not specified, it returns the remaining characters remaining from the start position.
    - If the length is negative, it returns an empty string.
    - If the length is greater than the remaining characters in the string, it returns the remaining characters from the start position.

-- Example:
    SELECT SUBSTRING('', 1, 5); -- Result: ''
    SELECT SUBSTRING(3223434, 1, 5); -- Result: 32234
    SELECT SUBSTRING(NOW(), 1, 5); -- Result: '2022-'
    SELECT SUBSTRING('Hello World', 0, 5); -- Result: ''
    SELECT SUBSTRING('Hello World', 1, 5); -- Result: 'Hello'
    SELECT SUBSTRING('Hello World', 22, 5); -- Result: ''
    SELECT SUBSTRING('Hello World', -3, 5); -- Result: 'rld'
    SELECT SUBSTRING('Hello World', 7, 0); -- Result: ''
    SELECT SUBSTRING('Hello World', 7); -- Result: 'World'
    SELECT SUBSTRING('Hello World', 7, -1); -- Result: ''
    SELECT SUBSTRING('Hello World', 5, 100); -- Result: 'o World'
*/

/*
### Using SUBSTRING_INDEX() function ###
    SUBSTRING_INDEX() function extracts a substring from a string based on a delimiter and a count.

-- Syntax:
    SUBSTRING_INDEX(str, delimiter, count)

-- Return:
    Returns the extracted substring based on the delimiter and count.

-- str:
    The string to extract the substring from.
    - If the string is an empty string, the result is an empty string.

-- delimiter:
    The delimiter to use to split the string.
    - If the delimiter is an empty string, the result is an empty string.
    - If the delimiter is not found, the result is the entire string.
    - If the delimiter is found, the result is the substring before the delimiter.

-- count:
    The number of occurrences of the delimiter to consider.
    - If the count is 0, the result is an empty string.
    - If the count is positive, it considers the first count occurrences of the delimiter.
    - If the count is negative, it considers the last count occurrences of the delimiter.

-- Example:
    - Returns the extracted substring based on the delimiter and count.
    SELECT SUBSTRING_INDEX('', '.', 1); -- Result: ''
    SELECT SUBSTRING_INDEX('www.mysql.com', '', 1); -- Result: ''
    SELECT SUBSTRING_INDEX('www.mysql.com', '/', 1); -- Result: 'www.mysql.com'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', 0); -- Result: ''
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', 1); -- Result: 'www'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', 2); -- Result: 'www.mysql'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', 3); -- Result: 'www.mysql.com'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', 4); -- Result: 'www.mysql.com'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', -1); -- Result: 'com'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', -2); -- Result: 'mysql.com'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', -3); -- Result: 'www.mysql.com'
    SELECT SUBSTRING_INDEX('www.mysql.com', '.', -4); -- Result: 'www.mysql.com'
*/

/*
### Using UPPER(str) function ###
    UPPER(str) function converts a string to uppercase.
    - Non-alphabetic characters are not affected.

-- Syntax:
    UPPER(str)

-- Return:
    Returns the string converted to uppercase except for characters that are not letters.

-- str:
    The string to convert to uppercase.

-- Example:
    - Returns the string converted to uppercase.
    SELECT UPPER(''); -- Result: ''
    SELECT UPPER('Hello World'); -- Result: 'HELLO WORLD'
    SELECT UPPER(1234); -- Result: 1234
    SELECT UPPER(NOW()); -- Result: 2022-01-05 12:30:45
*/

/*
### Using LOWER(str) function ###
    LOWER(str) function converts a string to lowercase.
    - Non-alphabetic characters are not affected.

-- Syntax:
    LOWER(str)

-- Return:
    Returns the string converted to lowercase except for characters that are not letters.

-- str:
    The string to convert to lowercase.

-- Example:
    - Returns the string converted to lowercase.
    SELECT LOWER(''); -- Result: ''
    SELECT LOWER('Hello World'); -- Result: 'hello world'
    SELECT LOWER(1234); -- Result: 1234
    SELECT LOWER(NOW()); -- Result: 2022-01-05 12:30:45
*/

/*
### Using SUM() function ###
    SUM() function calculates the sum of values in a column.
    - SUM() function often used with GROUP BY to calculate the sum of values in each group.

-- Syntax:
    SUM([DISTINCT] column_name)

-- Return:
    Returns the sum of values in the column.

-- Optional: DISTINCT
    The keyword to remove duplicate values before calculating the sum.
    - If the DISTINCT keyword is specified, duplicate values are removed before calculating the sum.
    - If the DISTINCT keyword is not specified, duplicate values are included in the sum.

-- column_name:
    The column used to calculate the sum of values.
    - The values in the column must be numeric.
    - If the column is empty, the result is NULL.

-- Example 1:
    - Returns the sum of values in the entire column.
    SELECT SUM(orderNumber) AS total_order_number
    FROM orders; -- Result: 3413725

-- Example 2:
    - Returns the sum of values in each group.
    SELECT status, SUM(orderNumber) AS total_order_number
    FROM orders
    GROUP BY status;

-- Example 3:
    - Returns the sum of distinct values in the column.
    SELECT SUM(DISTINCT orderNumber) AS total_order_number
    FROM orders; -- Result: 3413725
*/

/*
### Using SUM IF Function ###
    SUM IF function calculates the sum of values that meet a specified condition.
    - SUM IF function is often used with GROUP BY to calculate the sum of values that meet a specified condition in each group.

-- Syntax:
    SUM(IF condition, value, 0)

-- Return:
    Returns the sum of values that meet a specified condition.

-- condition:
    The condition to meet to calculate the sum.
    - If the condition is TRUE, the result is the value.
    - If the condition is FALSE, the result is 0.

-- value:
    The value to sum if the condition is TRUE.
    - If the value is NULL, the result is NULL.

-- Example 1:
    - Returns the sum of values that meet the specified condition.
    SELECT SUM(IF status = 'Shipped', orderNumber, 0) AS shipped_order_number
    FROM orders; -- Result: 318

-- Example 2:
    - Returns the sum of values that meet the specified condition for each group.
    SELECT status, SUM(IF status = 'Shipped', orderNumber, 0) AS shipped_order_number
    FROM orders
    GROUP BY status;
*/

/*
### Using AVG() function ###
    AVG() function calculates the average of values in a column.
    - AVG() function is often used with GROUP BY to calculate the average of values in each group.

-- Syntax:
    AVG([DISTINCT] column_name)

-- Return:
    Returns the average of values in the column.

-- Optional: DISTINCT
    The keyword to remove duplicate values before calculating the average.
    - If the DISTINCT keyword is specified, duplicate values are removed before calculating the average.
    - If the DISTINCT keyword is not specified, duplicate values are included in the average.

-- column_name:
    The column used to calculate the average of values.
    - The values in the column must be numeric.
    - If the column is empty, the result is 0.

-- Example 1:
    - Returns the average of values in the entire column.
    SELECT AVG(orderNumber) AS average_order_number
    FROM orders; -- Result: 10477.235

-- Example 2:
    - Returns the average of values in each group.
    SELECT status, AVG(orderNumber) AS average_order_number
    FROM orders
    GROUP BY status;

-- Example 3:
    - Returns the average of distinct values in the column.
    SELECT AVG(DISTINCT orderNumber) AS average_order_number
    FROM orders; -- Result: 10477.235
*/

/*
### Using IF() function ###
    IF() function returns one value if a condition is true, otherwise another value.

-- Syntax:
    IF(condition, value1, value2)

-- Return:
    Returns value1 if the condition is true, otherwise value2.

-- condition:
    The condition to evaluate.
    - If the condition is true, the result is value1.
    - If the condition is false, the result is value2.

-- value1:
    The value to return if the condition is true.
    - If the value1 is NULL, the result is NULL.

-- value2:
    The value to return if the condition is false.
    - If the value2 is NULL, the result is NULL.

-- Example:
    - Returns the first value if the condition is true, otherwise the second value.
    SELECT IF(1 = 1, 'True', 'False'); -- Result: 'True'
    SELECT IF(1 = 2, 'True', 'False'); -- Result: 'False'
    SELECT IF(1 = 1, 123, 'False'); -- Result: 123
    SELECT IF(1 = 2, 123, 'False'); -- Result: 'False'
*/

/*
### Using IFNULL() function ###
    IFNULL() function returns the second value if the first value is NULL.

-- Syntax:
    IFNULL(value1, value2)

-- Return:
    The first value if it is not NULL, otherwise the second value.

-- value1:
    The value to return if it is not NULL.
    - If the value1 is NULL, the result is value2.

-- value2:
    The value to return if value1 is NULL.
    - If the value2 is NULL, the result is NULL.

-- Example:
    - Returns the first value if it is not NULL, otherwise the second value.
    SELECT IFNULL(NULL, 'Default Value'); -- Result: 'Default Value'
    SELECT IFNULL('Hello', 'Default Value'); -- Result: 'Hello'
    SELECT IFNULL(NULL, 123); -- Result: 123
    SELECT IFNULL('Hello', 123); -- Result: 'Hello'
*/

/*
### Using COALESCE() function ###
    COALESCE() function returns the first non-NULL value in a list of expressions.

-- Syntax:
    COALESCE(expression1, expression2, expression3, ...)

-- Return:
    Returns the first non-NULL value in the list of expressions.

-- expression1, expression2, expression3, ...
    The expressions to evaluate.

-- Example:
    - Returns the first non-NULL value in the list of expressions.
    SELECT COALESCE(NULL, NULL, 'Default Value'); -- Result: 'Default Value'
    SELECT COALESCE(NULL, 'Hello', 'Default Value'); -- Result: 'Hello'
    SELECT COALESCE('Hello', 'Default Value'); -- Result: 'Hello'
    SELECT COALESCE(NULL, 123, 'Default Value'); -- Result: 123
    SELECT COALESCE('Hello', 123, 'Default Value'); -- Result: 'Hello'
*/

/*
### Using CASE Statement ###
    CASE statement returns a value based on a condition.
    - CASE statement is often used to replace multiple IF statements.

-- Syntax:
    CASE
        WHEN condition1 THEN value1
        WHEN condition2 THEN value2
        ...
        ELSE default_value
    END [AS alias]

-- Return:
    Returns the value based on the condition.

-- CASE:
    The keyword to start the CASE WHEN statement.

-- WHEN condition
    The condition to evaluate.
    - If the condition is true, the corresponding value is returned.
    - If the condition is false, the next condition is evaluated.

-- value1, value2:
    The values to return if the corresponding condition is true.

-- Optional: ELSE default_value
    The value to return if all conditions are false.
    - The ELSE keyword is optional to specify the default value.
    - If the ELSE keyword is not specified, the result is NULL if all conditions are false.
    - If the ELSE keyword is specified, the result is the default value if all conditions are false.

-- END:
    The keyword to end the CASE WHEN statement.

-- Optional: AS alias
    The alias to rename the result.
    - The AS keyword is optional to specify the alias.

-- Example 1:
    - Returns 'First Order' if the orderNumber is 10100, 'Second Order' if the orderNumber is 10101, and 'Other Order' if the orderNumber is not 10100 or 10101.
    SELECT
        CASE
            WHEN orderNumber = 10100 THEN 'First Order'
            WHEN orderNumber = 10101 THEN 'Second Order'
            ELSE 'Other Order'
        END AS order_info
    FROM orders;

-- Example 2:
    - Returns 'High' if the quantityOrdered is greater than 50, 'Medium' if the quantityOrdered is greater than 25, and NULL if the quantityOrdered is less than or equal to 25.
    SELECT
        CASE
            WHEN quantityOrdered > 50 THEN 'High'
            WHEN quantityOrdered > 25 THEN 'Medium'
        END AS quantity_info
    FROM orderdetails;
*/

/*
### Using GROUP_CONCAT() function ###
    GROUP_CONCAT() function concatenates values from a column into a single string.
    - GROUP_CONCAT() function is often used with GROUP BY to concatenate values in each group.

-- Syntax:
    GROUP_CONCAT([DISTINCT] column_name [ORDER BY column_name ASC | DESC] [SEPARATOR separator])

-- Return:
    Returns the concatenated values in a single string or NULL if the column is empty.

-- Optional: DISTINCT
    The keyword to remove duplicate values before concatenating the values.

-- column_name:
    The column to concatenate the values from.
    - NULL values in the column are ignored.

-- Optional: ORDER BY column_name ASC | DESC
    The keyword to sort the values before concatenating them.
    - If the ORDER BY keyword is not specified, the values are concatenated in the order they appear in the table.
    - If the ORDER BY keyword is specified, the values are concatenated in the specified order.
    - If the order is not specified, the default order is ascending.

-- Optional: SEPARATOR separator
    The separator to use between the values.
    - If the separator is not specified, the default separator is a comma.

-- Example 1:
    - Returns the concatenated values in the column.
    SELECT GROUP_CONCAT(orderNumber) AS order_numbers
    FROM orders; -- Result: '10100,10101,10102,...'

-- Example 2:
    - Returns the concatenated values in the column for each group.
    SELECT status, GROUP_CONCAT(orderNumber) AS order_numbers
    FROM orders
    GROUP BY status;

-- Example 3:
    - Returns the concatenated values in the column for each group without duplicates.
    SELECT status, GROUP_CONCAT(DISTINCT orderNumber) AS order_numbers
    FROM orders
    GROUP BY status;

-- Example 4:
    - Returns the concatenated values in the column for each group sorted in ascending order.
    SELECT status, GROUP_CONCAT(orderNumber ORDER BY orderNumber) AS order_numbers
    FROM orders
    GROUP BY status;

-- Example 5:
    - Returns the concatenated values in the column for each group with a separator.
    SELECT status, GROUP_CONCAT(orderNumber SEPARATOR ' - ') AS order_numbers
    FROM orders
    GROUP BY status;
*/

/*
### Using LIMIT() clause ###
    LIMIT clause limits the number of rows in the result set.
    - LIMIT clause is often used with ORDER BY to sort the result set before limiting the rows.
    - If ORDER BY is not specified, the result set varies because the order of rows is not guaranteed.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name
    LIMIT number_of_rows [OFFSET offset]

-- Return:
    Returns the specified number of rows in the result set.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name:
    The name of the table to select from.

-- number_of_rows:
    The number of rows to return in the result set.

-- Optional: OFFSET offset
    The number of rows to skip before returning the result set.
    - If the OFFSET keyword is not specified, a comma is used to separate the number_of_rows and offset.
    - If the offset is 0, the result is the specified number of rows starting from the number_of_rows.

-- Example 1:
    - Returns the first two rows of orders sorted by orderDate in descending order.
    SELECT orderNumber, orderDate
    FROM orders
    ORDER BY orderDate DESC
    LIMIT 2;

-- Example 2:
    - Returns the next two rows of orders sorted by orderDate in descending order.
    SELECT orderNumber, orderDate
    FROM orders
    ORDER BY orderDate DESC
    LIMIT 2 OFFSET 2;

-- Example 3:
    - Returns the next two rows of orders sorted by orderDate in descending order.
    SELECT orderNumber, orderDate
    FROM orders
    ORDER BY orderDate DESC
    LIMIT 2, 2;

-- Example 4:
    - Returns the first two rows of orders sorted by orderDate in descending order.
    SELECT orderNumber, orderDate
    FROM orders
    ORDER BY orderDate DESC
    LIMIT 2 OFFSET 0;
*/

/*
### Using ORDER BY clause ###
    ORDER BY clause sorts the result set by one or more columns.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name
    ORDER BY column_name1 [ASC | DESC], column_name2 [ASC | DESC], ...

-- Return:
    Returns the sorted result set.

-- column_name1, column_name2, ...
    - The columns to sort the result set by.
    - The columns can be referenced by their position in the SELECT clause.

-- table_name:
    The name of the table to select from.

-- Optional: ASC, DESC
    - ASC: Sorts the result set in ascending order.
    - DESC: Sorts the result set in descending order.
    - If the ASC or DESC keyword is not specified, the result set is sorted in ascending order.

-- Example 1:
    - Sorts the result set in ascending order by orderNumber.
    SELECT *
    FROM orders
    ORDER BY orderNumber;

-- Example 2:
    - Sorts the result set in descending order by orderNumber.
    SELECT *
    FROM orders
    ORDER BY orderNumber DESC;

-- Example 3:
    - Sorts the result set in ascending order by orderNumber and descending order by status.
    SELECT *
    FROM orders
    ORDER BY orderNumber, status DESC;
*/

/*
### Using GROUP BY clause ###
    GROUP BY clause groups the result set by one or more columns.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name
    GROUP BY column_name1, column_name2, ...

-- Return:
    Returns the grouped result set.

-- column_name1, column_name2, ...
    The columns to group the result set by.

-- table_name:
    The name of the table to select from.

-- GROUP BY column_name1, column_name2, ...
    The columns to group the result set by.
    - Requires at least one column to group the result set by.
    - Columns in the SELECT clause must be in the GROUP BY clause.
    - Using GROUP BY clause without aggregate functions is equivalent to using DISTINCT.
    - GROUP BY clause is evaluated after the WHERE clause and before the SELECT clause.

-- Example 1:
    - Groups the result set by status.
    SELECT status, COUNT(*)
    FROM orders
    GROUP BY status;

-- Example 2:
    - Groups the result set by status and orderDate.
    SELECT status, COUNT(*), SUM(quantityOrdered * priceEach) AS total_sales
    FROM orders o
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    GROUP BY status;
*/

/*
### Using HAVING clause ###
    HAVING clause filters the groups in the result set.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name
    GROUP BY column_name1, column_name2, ...
    HAVING condition

-- Return:
    Returns the groups that meet the condition.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name:
    The name of the table to select from.

-- GROUP BY column_name1, column_name2, ...
    The columns to group the result set by.
    - If GROUP BY clause is not specified, the HAVING clause behaves like a WHERE clause and filters the rows in the result set.

-- HAVING:
    The keyword to specify the HAVING clause.
    - The HAVING clause is evaluated after the GROUP BY clause.
    - The HAVING clause is evaluated before the ORDER BY clause.

-- condition:
    The condition to filter the groups by.
    - If the condition is true, the group is included in the result set.
    - If the condition is false, the group is excluded from the result set.

-- Example 1:
    - Filters the groups by the total sales greater than 100000.
    SELECT status, COUNT(*), SUM(quantityOrdered * priceEach) AS total_sales
    FROM orders o
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    GROUP BY status
    HAVING total_sales > 100000;

-- Example 2:
    - Without GROUP BY clause, the HAVING clause behaves like a WHERE clause and filters the rows in the result set.
    - Filters the rows by the total sales greater than 100000.
    SELECT status, COUNT(*), SUM(quantityOrdered * priceEach) AS total_sales
    FROM orders o
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    HAVING total_sales > 100000;
*/

/*
### Using HAVING COUNT() function ###
    HAVING COUNT() function filters the groups by the number of rows in each group.

-- Syntax:
    SELECT COUNT(column_name1), column_name2, ...
    FROM table_name
    GROUP BY column_name1, column_name2, ...
    HAVING COUNT(column_name1) condition

-- Return:
    Returns the groups that meet the condition based on the number of rows in each group.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name:
    The name of the table to select from.

-- GROUP BY column_name1, column_name2, ...

-- HAVING COUNT(column_name1) condition
    The condition to filter the groups by the number of rows in each group.
    - If the condition is true, the group is included in the result set.
    - If the condition is false, the group is excluded from the result set.

-- Example 1:
    - Filters the groups by the number of orders greater than 10.
    SELECT customerNumber, COUNT(orderNumber) AS total_orders
    FROM orders
    GROUP BY customerNumber
    HAVING COUNT(orderNumber) > 10;

-- Example 2:
    - Filters the groups by the number of orders greater than 10 and the total sales greater than 100000.
    SELECT customerNumber, COUNT(orderNumber) AS total_orders, SUM(quantityOrdered * priceEach) AS total_sales
    FROM orders o
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    GROUP BY customerNumber
    HAVING COUNT(orderNumber) > 10 AND SUM(quantityOrdered * priceEach) > 100000;
*/

/*
### Using column aliases ###
    Column aliases assign a name to a column in the result set.

-- Syntax:
    SELECT column_name [AS] column_alias_name
    FROM table_name

-- Return:
    Returns the result set with the column alias.

-- column_name:
    The column to select from the table.

-- AS column_alias_name:
    The name to assign to the column.
    - The AS keyword is optional to specify the column alias.
    - If the column alias contains spaces, it must be enclosed in single quotes.
    - Column aliases cannot be used in the WHERE, GROUP BY, or HAVING clauses because those clauses are evaluated before the SELECT clause.
    - Column aliases can be used in the ORDER BY clause because the ORDER BY clause is evaluated after the SELECT clause.

-- Example 1:
    SELECT orderNumber AS order_number
    FROM orders;

-- Example 2:
    SELECT orderNumber order_number
    FROM orders;

-- Example 3:
    SELECT orderNumber 'Order Number'
    FROM orders;

-- Example 4:
    SELECT orderNumber AS order_number
    FROM orders
    ORDER BY order_number;
*/

/*
### Using table aliases ###
    Table aliases assign a name to a table in the query.

-- Syntax:
    SELECT table_alias1.column_name, table_alias2.column_name
    FROM table_name1 [AS] table_alias1
    JOIN table_name2 [AS] table_alias2 ON table_alias1.column_name = table_alias2.column_name

-- Return:
    Returns the result set with the table aliases.

-- table_name1, table_name2:
    The name of the tables to select from.

-- AS table_alias1, AS table_alias2:
    The name to assign to the tables.
    - The AS keyword is optional to specify the table alias.
    - If the table alias contains spaces, it must be enclosed in single quotes.
    - Table aliases are used to qualify column names in the SELECT, WHERE, GROUP BY, HAVING, and ORDER BY clauses.
    - Table aliases are used to join tables in the FROM clause.

-- Example:
    SELECT o.orderNumber, od.productCode
    FROM orders AS o
    JOIN orderdetails AS od ON o.orderNumber = od.orderNumber;

-- Example 2:
    SELECT o.orderNumber, od.productCode
    FROM orders o
    JOIN orderdetails od ON o.orderNumber = od.orderNumber;
*/

/*
### Using MD5() function ###
    MD5() is a cryptographic hash function that generates a 128-bit hash value.

-- Characteristics:
    - MD5 is unique, universal, and unambiguous.
    - MD5 is a 32-character hexadecimal string.
    - MD5 follows the pattern: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.

-- Usage:
    - MD5 is used to generate unique identifiers for rows in a table.
    - MD5 is used to verify data integrity and detect changes.
    - MD5 is used to generate unique identifiers for files and documents.

-- Vulnerability:
    - MD5 is vulnerable to hash collisions due to its fixed length.
    - MD5 is vulnerable to collision attacks and should not be used for security purposes.
    - MD5 is vulnerable to birthday attacks due to its fixed length.
    - MD5 is vulnerable to preimage attacks due to its fixed length.

-- Privacy:
    - MD5 does not provide privacy as it can be used to track users.
    - MD5 does not provide anonymity as it can be used to identify users.

-- Security:
    - MD5 is not secure for cryptographic purposes.
    - MD5 is not secure for password hashing.
    - MD5 is not secure for digital signatures.
    - MD5 is not secure for message authentication codes.

-- Alternatives:
    MD5 is replaced by SHA-256 and SHA-512 for secure cryptographic purposes.

-- Syntax:
    MD5(str)

-- Return:
    The MD5 hash value as a 32-character hexadecimal string.

-- str:
    The string to calculate the MD5 hash of.

-- Example:
    - Calculates the MD5 hash value of a string.
    SELECT MD5(''); -- Result: 'd41d8cd98f00b204e9800998ecf8427e'
    SELECT MD5('Hello World'); -- Result: 'ed076287532e86365e841e92bfc50d8c'
    SELECT MD5(1234); -- Result: '81dc9bdb52d04dc20036dbd8313ed055'
    SELECT MD5(NOW()); -- Result: 'f7b1c671e8f3b0fbd4e3e3b7b7b7b7b7'
*/

/*
### Using UUID() function ###
    UUID() function generates a Universally Unique Identifier (UUID).

-- Characteristics:
    - UUID is unique, universal, and unambiguous.
    - UUID is a 128-bit number that is unique across space and time.
    - UUID is a 32-character hexadecimal string.
    - UUID follows the pattern: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.

-- Usage:
    - UUID is unambiguous and can be used to identify objects.
    - UUID is used to generate unique identifiers for rows in a table.
    - UUID is used to generate unique identifiers for files and documents.
    - UUID is used to generate unique identifiers for users and sessions.

-- Vulnerability:
    - UUID is vulnerable to hash collisions due to its fixed length.
    - UUID is vulnerable to collision attacks and should not be used for security purposes.
    - UUID is vulnerable to birthday attacks due to its fixed length.
    - UUID is vulnerable to preimage attacks due to its fixed length.

-- Privacy:
    UUID does not provide privacy as it can be used to track users.
    UUID does not provide anonymity as it can be used to identify users.

-- Security:
    UUID is not secure for cryptographic purposes.
    UUID is not secure for password hashing.
    UUID is not secure for digital signatures.
    UUID is not secure for message authentication codes.

-- Alternatives:
    UUID is replaced by SHA-256 and SHA-512 for secure cryptographic purposes.

-- Syntax:
    UUID()

-- Return:
    The UUID as a 32-character hexadecimal string.

-- Example 1:
    - Generates a UUID.
    SELECT UUID(); -- Result: 'f7b1c671-e8f3-b0fb-d4e3-e3b7b7b7b7b7'

-- Example 2:
    - Inserts a UUID into the orders table.
    INSERT INTO orders (orderNumber, orderDate, requiredDate, status)
    VALUES (UUID(), '2022-01-05', '2022-01-10', 'Shipped');
*/

/*
### Using RAND() function ###
    RAND() function generates a random number between 0 and 1.

-- Syntax:
    RAND([seed])

-- Return:
    Returns a random number between 0 and 1.

-- Optional: seed
    The seed value to generate the random number.
    - If the seed is not specified, the result is a random number between 0 and 1.
    - If the seed is specified, the result is a random number based on the seed value.

-- Example 1:
    - Generates a random number between 0 and 1.
    SELECT RAND(); -- Result: 0.123456789

-- Example 2:
    - Generates a random number between 1 and 10.
    SET @MIN := 1;
    SET @MAX := 10;
    SELECT FLOOR(RAND() * (@MAX - @MIN + 1) + @MIN);
*/

/*
### Using CAST() function ###
    CAST() function converts a value to a specified data type.

-- Syntax:
    CAST(value AS data_type)

-- Return:
    Returns the value converted to the specified data type.

-- value:
    The value to convert to the specified data type.

-- data_type:
    The data type to convert the value to.
    - The following data types are supported in MySQL:
        DATE - Converts the value to a date.
        DATETIME - Converts the value to a datetime.
        TIME - Converts the value to a time.
        CHAR - Converts the value to a string.
        SIGNED - Converts the value to a signed 64-bit integer.
        UNSIGNED - Converts the value to an unsigned 64-bit integer.
        BINARY - Converts the value to a binary string.

-- Example:
    - Converts the value to the specified data type.
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
    SELECT CAST(NOW() AS BINARY); -- Result: '2022-01-05 12:30:45'
*/

/*
### Using Logical Operators ###
    Logical operators are used to combine conditions in a query.
    - The following logical operators are supported in MySQL:
        AND - Combines two conditions and returns true if both conditions are true.
        OR - Combines two conditions and returns true if at least one condition is true.
        NOT - Negates a condition and returns true if the condition is false.
        BETWEEN - Returns true if a value is within a range.
        EXIST - Returns true if a subquery returns any rows.
        IN - Returns true if a value is in a list of values.
        ALL - Returns true if all values in a list of values are true.
        ANY - Returns true if any value in a list of values is true.
        SOME - Returns true if some values in a list of values are true.
        IS NULL - Returns true if a value is NULL.
        IS NOT NULL - Returns true if a value is not NULL.
        LIKE - Returns true if a value matches a pattern.
        RLIKE - Returns true if a value matches a regular expression.
        REGEXP - Returns true if a value matches a regular expression.
*/

/*
### Using AND operator ###
    AND operator combines two conditions and returns true if both conditions are true.

-- Syntax:
    condition1 AND condition2

-- Return:
    Returns true if both conditions are true.

-- condition1, condition2:
    The conditions to combine using the AND operator.
    - If both conditions are true, the result is true.
    - If one of the conditions is false, the result is false.

-- Example:
    - Returns the rows where the status is 'Shipped' and the orderDate is between '2003-01-01' and '2003-12-31'.
    SELECT *
    FROM orders
    WHERE status = 'Shipped'
      AND orderDate BETWEEN '2003-01-01' AND '2003-12-31';
*/

/*
### Using OR operator ###
    OR operator combines two conditions and returns true if at least one condition is true.

-- Syntax:
    condition1 OR condition2

-- Return:
    Returns true if at least one condition is true.

-- condition1, condition2:
    The conditions to combine using the OR operator.
    - If one of the conditions is true, the result is true.
    - If none of the conditions are true, the result is false.
*/

/*
### Using NOT operator ###
    NOT operator negates a condition.

-- Syntax:
    NOT condition

-- Return:
    Returns true if the condition is false.

-- condition:
    The condition to negate.
    - If the condition is true, the result is false.
    - If the condition is false, the result is true.

-- Example:
    - Returns the rows where the status is "Shipped" and the comments are not NULL or empty.
    SELECT *
    FROM orders
    WHERE status = 'Shipped'
      AND NOT (comments IS NULL OR comments = '');
*/

/*
### Using BETWEEN operator ###
    BETWEEN operator returns true if a value is within a range.

-- Syntax:
    column_name BETWEEN value1 AND value2

-- Return:
    Returns true if the column value is within the range.

-- column_name:
    The column to compare the values to.

-- value1, value2:
    The range of values to compare the column value to.
    - If the column value is equal to value1 or value2, the result is true.
    - If the column value is between value1 and value2, the result is true.
    - If the column value is less than value1 or greater than value2, the result is false.

-- Example:
    - Returns the rows where the quantity ordered is between 20 and 50.
    SELECT *
    FROM orderdetails
    WHERE quantityOrdered BETWEEN 20 AND 50;
*/

/*
### Using EXISTS operator ###
    EXISTS operator returns true if a subquery returns any rows.

-- Syntax:
    [NOT] EXISTS (subquery)

-- Return:
    Returns true if the subquery returns any rows.

-- Optional: NOT
    The keyword to negate the EXISTS operator.
    - If the NOT keyword is specified, the result is true if the subquery does not return any rows.
    - If the NOT keyword is not specified, the result is true if the subquery returns any rows.

-- subquery:
    The subquery to evaluate.
    - If the subquery returns any rows, the result is true.
    - If the subquery does not return any rows, the result is false.

-- Example:
    - Returns the rows where the orderNumber exists in the orderdetails table.
    SELECT *
    FROM orders o
    WHERE EXISTS (SELECT *
                  FROM orderdetails od
                  WHERE o.orderNumber = od.orderNumber);

-- Example 2:
    - Returns the rows where the orderNumber does not exist in the orderdetails table.
    SELECT *
    FROM orders o
    WHERE NOT EXISTS (SELECT *
                      FROM orderdetails od
                      WHERE o.orderNumber = od.orderNumber);

-- Example 3:
    - Returns the rows where the orderNumber exists in the orderdetails table and the quantityOrdered is greater than 50.
    SELECT *
    FROM orders o
    WHERE EXISTS (SELECT *
                  FROM orderdetails od
                  WHERE o.orderNumber = od.orderNumber
                    AND od.quantityOrdered > 50);
*/

/*
### Using IN operator ###
    IN operator returns true if a value is in a list of values.

-- Syntax:
    column_name [NOT] IN (value1, value2, ...)

-- Return:
    Returns true if the column value is in the list of values.

-- column_name:
    The column to compare the values to.

-- Optional: NOT
    The keyword to negate the IN operator.
    - If the NOT keyword is specified, the result is true if the column value is not in the list of values.
    - If the NOT keyword is not specified, the result is true if the column value is in the list of values.

-- value1, value2, ...:
    The list of values to compare the column value to.
    - If the column value is equal to any of the values, the result is true.
    - If the column value is not equal to any of the values, the result is false.

-- Example 1:
    - Returns the rows where the status is 'Shipped' or 'Resolved'.
    SELECT *
    FROM orders
    WHERE status IN ('Shipped', 'Resolved');

-- Example 2:
    - Returns the rows where the status is not 'Shipped' or 'Resolved'.
    SELECT *
    FROM orders
    WHERE status NOT IN ('Shipped', 'Resolved');
*/

/*
### Using ALL operator ###
    ALL operator returns true if all values in a list of values are true.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name1
    WHERE column_name1 comparison_operator [NOT] ALL (SELECT column_name1
                                                      FROM table_name2
                                                      WHERE condition)

-- Return:
    Returns the rows from table_name1 that the table_name1.column_name1 satisfies the comparison with all the table_name2.column_name1 in the subquery.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name1:
    The name of the table to select from.

-- comparison_operator:
    The comparison operator is a logical operator that compares two values.
    - The comparison operator returns true if the table_name1.column_name1 satisfies the comparison with all the table_name2.column_name1 in the subquery.
    - The comparison operator returns false if the table_name1.column_name1 does not satisfy the comparison with all the table_name2.column_name1 in the subquery.
    - The comparison operator can be the following:
        = - Equal to
        <> - Not equal to
        > - Greater than
        < - Less than
        >= - Greater than or equal to
        <= - Less than or equal to

-- Optional: NOT
    The keyword to negate the ALL operator.
    - If the NOT keyword is specified, the result is true if the table_name1.column_name1 does not satisfy the comparison with all the table_name2.column_name1 in the subquery.
    - If the NOT keyword is not specified, the result is true if the table_name1.column_name1 satisfies the comparison with all the table_name2.column_name1 in the subquery.

-- table_name2:
    The name of the table in the subquery to compare the table_name1.column_name1 to.

-- condition:
    The condition to evaluate.
    - If the condition is true, the row is included in the result set.
    - If the condition is false, the row is excluded from the result set.

-- Example 1:
    - Returns the maximum and minimum quantity ordered by customers in 2003.
        - The maximum quantity ordered is 50.
        - The minimum quantity ordered is 20.

    SELECT MAX(od.quantityOrdered) AS max_quantity_ordered, MIN(od.quantityOrdered) AS min_quantity_ordered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE o.shippedDate BETWEEN '2003-01-01' AND '2003-12-31';

-- Example 2:
    - Returns the customers who have ordered more than all the quantity ordered by customers in 2003.
        - 51 is the highest quantity ordered in the result set.
        - 50 is the highest quantity ordered in 2003.

    SELECT c.customerName, od.quantityOrdered, SUM(od.quantityOrdered * od.priceEach) AS total_sales
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE o.status = 'Shipped'
      AND od.quantityOrdered > ALL (SELECT quantityOrdered
                                    FROM customers c
                                    JOIN orders o ON c.customerNumber = o.customerNumber
                                    JOIN orderdetails od ON od.orderNumber = o.orderNumber
                                    WHERE o.shippedDate BETWEEN '2003-01-01' AND '2003-12-31')
    GROUP BY c.customerName, od.quantityOrdered
    ORDER BY quantityOrdered;
*/

/*
### Using ANY operator ###
    ANY operator returns true if any value in a list of values is true.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name1
    WHERE column_name1 comparison_operator [NOT] ANY (SELECT column_name1
                                                      FROM table_name2
                                                      WHERE condition)

-- Return:
    Returns the rows from table_name1 that the table_name1.column_name1 satisfies the comparison with any of the table_name2.column_name1 in the subquery.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name1:
    The name of the table to select from.

-- comparison_operator:
    The comparison operator is a logical operator that compares two values.
    - The comparison operator returns true if the table_name1.column_name1 satisfies the comparison with any of the table_name2.column_name1 in the subquery.
    - The comparison operator returns false if the table_name1.column_name1 does not satisfy the comparison with any of the table_name2.column_name1 in the subquery.
    - The comparison operator can be the following:
        = - Equal to
        <> - Not equal to
        > - Greater than
        < - Less than
        >= - Greater than or equal to
        <= - Less than or equal to
        <=> - Equal to null-safe

-- Optional: NOT
    The keyword to negate the ANY operator.
    - If the NOT keyword is specified, the result is true if the table_name1.column_name1 does not satisfy the comparison with any of the table_name2.column_name1 in the subquery.
    - If the NOT keyword is not specified, the result is true if the table_name1.column_name1 satisfies the comparison with any of the table_name2.column_name1 in the subquery.


-- table_name2:
    The name of the table in the subquery to compare the table_name1.column_name1 to.

-- condition:
    The condition to evaluate.
    - If the condition is true, the row is included in the result set.
    - If the condition is false, the row is excluded from the result set.

-- Example 1:
    - Returns the maximum and minimum quantity ordered by customers in 2003.
        - The maximum quantity ordered is 50.
        - The minimum quantity ordered is 20.

    SELECT MAX(od.quantityOrdered) AS max_quantity_ordered, MIN(od.quantityOrdered) AS min_quantity_ordered
    FROM customers c
             JOIN orders o ON c.customerNumber = o.customerNumber
             JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE o.shippedDate BETWEEN '2003-01-01' AND '2003-12-31';

-- Example 2;
    - Returns the customers who have ordered more than any quantity ordered by customers in 2003.
        - 21 is the lowest quantity ordered in the result set.
        - 20 is the lowest quantity ordered in 2003.

    SELECT c.customerName, od.quantityOrdered, SUM(od.quantityOrdered * od.priceEach) AS total_sales
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE o.status = 'Shipped'
      AND od.quantityOrdered > ANY (SELECT quantityOrdered
                                    FROM customers c
                                    JOIN orders o ON c.customerNumber = o.customerNumber
                                    JOIN orderdetails od ON od.orderNumber = o.orderNumber
                                    WHERE o.shippedDate BETWEEN '2003-01-01' AND '2003-12-31')
    GROUP BY c.customerName, od.quantityOrdered
    ORDER BY od.quantityOrdered;
*/

/*
### Using SOME operator ###
    SOME operator returns true if some values in a list of values are true.
    - SOME operator is a synonym for the ANY operator.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name1
    WHERE column_name1 comparison_operator [NOT] SOME (SELECT column_name1
                                                        FROM table_name2
                                                        WHERE condition)

-- Return:
    Returns the rows from table_name1 that the table_name1.column_name1 satisfies the comparison with some of the table_name2.column_name1 in the subquery.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name1:
    The name of the table to select from.

-- comparison_operator:
    The comparison operator is a logical operator that compares two values.
    - The comparison operator returns true if the table_name1.column_name1 satisfies the comparison with some of the table_name2.column_name1 in the subquery.
    - The comparison operator returns false if the table_name1.column_name1 does not satisfy the comparison with some of the table_name2.column_name1 in the subquery.
    - The comparison operator can be the following:
        = - Equal to
        <> - Not equal to
        > - Greater than
        < - Less than
        >= - Greater than or equal to
        <= - Less than or equal to

-- Optional: NOT
    The keyword to negate the SOME operator.
    - If the NOT keyword is specified, the result is true if the table_name1.column_name1 does not satisfy the comparison with some of the table_name2.column_name1 in the subquery.
    - If the NOT keyword is not specified, the result is true if the table_name1.column_name1 satisfies the comparison with some of the table_name2.column_name1 in the subquery.

-- table_name2:
    The name of the table in the subquery to compare the table_name1.column_name1 to.

-- condition:
    The condition to evaluate.
    - If the condition is true, the row is included in the result set.
    - If the condition is false, the row is excluded from the result set.

-- Example 1:
    - Returns the maximum and minimum quantity ordered by customers in 2003.
        - The maximum quantity ordered is 50.
        - The minimum quantity ordered is 20.

    SELECT MAX(od.quantityOrdered) AS max_quantity_ordered, MIN(od.quantityOrdered) AS min_quantity_ordered
    FROM customers c
             JOIN orders o ON c.customerNumber = o.customerNumber
             JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE o.shippedDate BETWEEN '2003-01-01' AND '2003-12-31';

-- Example 2;
    - Returns the customers who have ordered more than any quantity ordered by customers in 2003.
        - 21 is the lowest quantity ordered in the result set.
        - 20 is the lowest quantity ordered in 2003.

    SELECT c.customerName, od.quantityOrdered, SUM(od.quantityOrdered * od.priceEach) AS total_sales
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE o.status = 'Shipped'
      AND od.quantityOrdered > SOME (SELECT quantityOrdered
                                    FROM customers c
                                    JOIN orders o ON c.customerNumber = o.customerNumber
                                    JOIN orderdetails od ON od.orderNumber = o.orderNumber
                                    WHERE o.shippedDate BETWEEN '2003-01-01' AND '2003-12-31')
    GROUP BY c.customerName, od.quantityOrdered
    ORDER BY od.quantityOrdered;
*/

/*
### Using IS NULL operator ###
    IS NULL operator returns true if a value is NULL.

-- Syntax:
    column_name IS NULL

-- Return:
    Returns true if the value is NULL.

-- column_name:
    The column to check if the value is NULL.

-- Example:
    - Returns the rows where the comments are NULL.
    SELECT *
    FROM orders
    WHERE comments IS NULL;
*/

/*
### Using IS NOT NULL operator ###
    IS NOT NULL operator returns true if a value is not NULL.

-- Syntax:
    column_name IS NOT NULL

-- Return:
    Returns true if the value is not NULL.

-- column_name:
    The column to check if the value is not NULL.

-- Example:
    - Returns the rows where the comments are not NULL.
    SELECT *
    FROM orders
    WHERE comments IS NOT NULL;
*/

/*
### Using LIKE operator ###
    LIKE operator returns true if a value matches a pattern.
    - The LIKE operator is case-insensitive.

-- Syntax:
    column_name [NOT] LIKE 'pattern'

-- Return:
    Returns true if the column value matches the pattern.

-- column_name:
    The column to match the value against.

-- Optional: NOT
    The keyword to negate the LIKE operator.
    - If the NOT keyword is specified, the result is true if the column value does not match the pattern.
    - If the NOT keyword is not specified, the result is true if the column value matches the pattern.

-- pattern:
    The pattern to match the value against and can contain wildcards.
    - The pattern can contain the following wildcards:
        % - Matches any sequence of characters with zero or more occurrences.
        _ - Matches any single character with one occurrence.

-- Example 1:
    - Returns the rows where the contactLastName starts with the letter A.
    SELECT *
    FROM customers
    WHERE contactLastName LIKE 'A%';

-- Example 2:
    - Returns the rows where the extension ends with x10_.
    SELECT *
    FROM employees
    WHERE extension LIKE 'x10_';
*/

/*
### Using RLIKE operator ###
    RLIKE operator returns true if a value matches a regular expression pattern.
    - RLIKE operator is synonymous with the REGEXP operator.

-- Syntax:
    column_name [NOT] RLIKE 'regular_expression_pattern'

-- Return:
    Returns true if the column value matches the regular expression pattern.

-- column_name:
    The column to match the value against.

-- Optional: NOT
    The keyword to negate the RLIKE operator.
    - If the NOT keyword is specified, the result is true if the column value does not match the regular expression pattern.
    - If the NOT keyword is not specified, the result is true if the column value matches the regular expression pattern.

-- regular_expression_pattern:
    The regular expression pattern to match the value against.
    - The regular expression pattern is enclosed in single quotes ('') and can contain regular expression operators.
    - The regular expression pattern can contain the following operators:
        . - Matches any single character.
        ^ - Matches the start of a string.
        $ - Matches the end of a string.
        * - Matches zero or more occurrences of the preceding character.
        + - Matches one or more occurrences of the preceding character.
        ? - Matches zero or one occurrence of the preceding character.
        [] - Matches any character in the specified range.
        [^] - Matches any character not in the specified range.
        () - Groups characters together.
        | - Matches either the characters before or after the operator.
        \ - Escapes a special character.
        \d - Matches a digit character.
        \D - Matches a non-digit character.
        \w - Matches a word character.
        \W - Matches a non-word character.
        \s - Matches a whitespace character.
        \S - Matches a non-whitespace character.
        \b - Matches a word boundary.
        \B - Matches a non-word boundary.
        \1, \2, ... - Matches the nth group of characters.
        \0 - Matches the null character.

-- Example:
    - Returns the rows where the lastName starts with the letter A.
    SELECT *
    FROM employees
    WHERE lastName RLIKE '^A';
*/

/*
### Using REGEXP operator ###
    REGEXP operator returns true if a value matches a regular expression.
    - REGEXP operator is synonymous with the RLIKE operator.

-- Syntax:
    column_name [NOT] REGEXP 'regular_expression_pattern'

-- Return:
    Returns true if the column value matches the regular expression pattern.

-- column_name:
    The column to match the value against.

-- Optional: NOT
    The keyword to negate the REGEXP operator.
    - If the NOT keyword is specified, the result is true if the column value does not match the regular expression pattern.
    - If the NOT keyword is not specified, the result is true if the column value matches the regular expression pattern.

-- regular_expression_pattern:
    The regular expression pattern to match the value against.
    - The regular expression pattern is enclosed in single quotes ('') and can contain regular expression operators.
    - The regular expression pattern can contain the following operators:
        . - Matches any single character.
        ^ - Matches the start of a string.
        $ - Matches the end of a string.
        * - Matches zero or more occurrences of the preceding character.
        + - Matches one or more occurrences of the preceding character.
        ? - Matches zero or one occurrence of the preceding character.
        [] - Matches any character in the specified range.
        [^] - Matches any character not in the specified range.
        () - Groups characters together.
        | - Matches either the characters before or after the operator.
        \ - Escapes a special character.
        \d - Matches a digit character.
        \D - Matches a non-digit character.
        \w - Matches a word character.
        \W - Matches a non-word character.
        \s - Matches a whitespace character.
        \S - Matches a non-whitespace character.
        \b - Matches a word boundary.
        \B - Matches a non-word boundary.
        \1, \2, ... - Matches the nth group of characters.
        \0 - Matches the null character.

-- Example:
    - Returns the rows where the contactLastName starts with a letter from A to M.
    SELECT *
    FROM customers
    WHERE contactLastName REGEXP '^[A-M]';
*/

/*
### Using DISTINCT keyword ###
    The DISTINCT keyword is used to select unique values from the result set.

-- Syntax:
    SELECT DISTINCT column_name1, column_name2, ...
    FROM table_name

-- Return:
    Returns the unique rows in the result set.

-- column_name1, column_name2, ...
    The columns to select unique values from.

-- table_name:
    The name of the table to select from.

-- Example:
    - Returns the unique status values.
    SELECT DISTINCT status
    FROM orders;
*/

/*
### Using SELECT DISTINCTROW Keyword ###
    The DISTINCTROW keyword is used to select unique rows from the result set.
    - DISTINCTROW is synonymous with DISTINCT.

-- Syntax:
    SELECT DISTINCTROW column_name1, column_name2, ...
    FROM table_name

-- Return:
    Returns the unique rows in the result set.

-- column_name1, column_name2, ...
    The columns to select unique values from.

-- table_name:
    The name of the table to select from.

-- Example:
    - Returns the unique status and the count of orders.
    SELECT DISTINCTROW status, COUNT(*)
    FROM orders
    JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
    GROUP BY status;
*/

/*
### Using FLOOR() function ###
    FLOOR() function rounds a number down to the nearest integer.

-- Syntax:
    FLOOR(number)

-- Return:
    Returns the number rounded down.

-- number:
    The number to round down.
    - If the number is an integer, the result is the integer.
    - If the number is a decimal, the result is the integer part of the decimal.

-- Example:
    - Returns the number rounded down using the FLOOR() function.
    SELECT FLOOR(1); -- Result: 1
    SELECT FLOOR(1.5); -- Result: 1
    SELECT FLOOR(1.9); -- Result: 1
    SELECT FLOOR(-1.5); -- Result: -2
    SELECT FLOOR(-1.9); -- Result: -2
*/

/*
### Using CEIL() function ###
    CEIL() functions rounds a number up to the nearest integer.

-- Syntax:
    CEIL(number)

-- Return:
    Returns the number rounded up.

-- number:
    The number to round up.
    - If the number is an integer, the result is the integer.
    - If the number is a decimal, the result is the integer part of the decimal.

-- Example:
    - Returns the number rounded up using the CEIL() function.
    SELECT CEIL(1); -- Result: 1
    SELECT CEIL(1.5); -- Result: 2
    SELECT CEIL(1.9); -- Result: 2
    SELECT CEIL(-1.5); -- Result: -1
    SELECT CEIL(-1.9); -- Result: -1
*/

/*
### Using CEILING() function ###
    CEILING() functions rounds a number up to the nearest integer.
    - CEILING() is synonymous with CEIL(number).

-- Syntax:
    CEILING(number)

-- Return:
    Returns the number rounded up.

-- number:
    The number to round up.
    - If the number is an integer, the result is the integer.
    - If the number is a decimal, the result is the integer part of the decimal.

-- Example:
    - Returns the number rounded up using the CEILING() function.
    SELECT CEILING(1); -- Result: 1
    SELECT CEILING(1.5); -- Result: 2
    SELECT CEILING(1.9); -- Result: 2
    SELECT CEILING(-1.5); -- Result: -1
    SELECT CEILING(-1.9); -- Result: -1
*/

/*
### Subqueries ###
    Subqueries are used to nest a query within another query.
    - Subqueries are also known as inner queries or nested queries.
    - Subqueries are independent of the outer query.
    - Common subquery types are:
        - Scalar subquery: Returns a single value.
        - Column subquery: Returns a single column.
        - Row subquery: Returns a single row.
        - Table subquery: Returns a table.

-- scalar_subquery:
    SELECT column_name1, column_name2, ...
    FROM table_name
    WHERE column_name1 comparison_operator (SELECT column_name1
                                             FROM table_name
                                             WHERE condition)

    - The scalar subquery returns a single value.
    - The scalar subquery is used in the WHERE clause to compare the column value to the subquery value.
    - Returns the rows from the table_name that the column_name1 satisfies the comparison with the subquery.
    - Returns NULL if the subquery returns no rows.
    - Results in an error if the subquery returns more than one row.
    - Results in an error if the subquery returns more than one column.

-- row_subquery:
    SELECT column_name1, column_name2, ...
    FROM table_name
    WHERE [ROW] (column_name1, column_name2, ...) comparison_operator (SELECT column_name1, column_name2, ...
                                                                       FROM table_name
                                                                       WHERE condition)

-- column_subquery:
    - [NOT] [ALL | ANY | SOME]
        SELECT column_name1, column_name2, ...
        FROM table_name
        WHERE column_name1 comparison_operator comparison_operator [NOT] [ALL | ANY | SOME] (SELECT column_name1
                                                                                             FROM table_name
                                                                                             WHERE condition)
    - [NOT] IN
        SELECT column_name1, column_name2, ...
        FROM table_name
        WHERE column_name1 comparison_operator [NOT] IN (SELECT column_name1
                                                         FROM table_name
                                                         WHERE condition)
    - [NOT] EXISTS
        SELECT column_name1, column_name2, ...
        FROM table_name
        WHERE [NOT] EXISTS (SELECT column_name1
                            FROM table_name
                            WHERE condition)

-- table_subquery:
    SELECT column_name1, column_name2, ...
    FROM table_name [AS] table_alias1
    JOIN (SELECT column_name1, column_name2, ...
          FROM table_name
          WHERE condition) [AS] table_alias2 ON table_alias1.column_name1 = table_alias2.column_name1

-- Return:
    Returns the rows from the table_name that the column_name1 satisfies the comparison with the subquery.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name:
    The name of the table to select from.

-- comparison_operator:
    The comparison operator is a logical operator that compares two values.
    - The comparison operator returns true if the column_name1 satisfies the comparison with the subquery.
    - The comparison operator returns false if the column_name1 does not satisfy the comparison with the subquery.
    - The comparison operator can be the following:
        = - Equal to
        <> - Not equal to
        > - Greater than
        < - Less than
        >= - Greater than or equal to
        <= - Less than or equal to
        <=> - Equal to null-safe

-- condition:
    The condition to evaluate.
    - If the condition is true, the row is included in the result set.
    - If the condition is false, the row is excluded from the result set.

-- Example 1:
    - Returns the customers who have ordered more than the average quantity ordered.
    SELECT c.customerName, od.quantityOrdered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE od.quantityOrdered > (SELECT AVG(quantityOrdered)
                                 FROM orderdetails);

-- Example 2:
    - Returns the customers who have ordered more than the average quantity ordered.
    SELECT c.customerName, od.quantityOrdered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE od.quantityOrdered > ALL (SELECT quantityOrdered
                                    FROM orderdetails);

-- Example 3:
    - Returns the customers who have ordered more than the average quantity ordered.
    SELECT c.customerName, od.quantityOrdered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE od.quantityOrdered > ANY (SELECT quantityOrdered
                                    FROM orderdetails);

-- Example 4:
    - Returns the customers who have ordered more than the average quantity ordered.
    SELECT c.customerName, od.quantityOrdered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE od.quantityOrdered > SOME (SELECT quantityOrdered
                                     FROM orderdetails);

-- Example 5:
    - Returns the customers who have ordered more than the average quantity ordered.
    SELECT c.customerName, od.quantityOrdered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE od.quantityOrdered IN (SELECT quantityOrdered
                                 FROM orderdetails);

-- Example 6:
    - Returns the customers who have ordered more than the average quantity ordered.
    SELECT c.customerName, od.quantityOrdered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE EXISTS (SELECT *
                  FROM orderdetails
                  WHERE orderNumber = o.orderNumber);
*/

/*
### Correlated Subquery ###
    Correlated subqueries are used to reference the outer query in the subquery.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM table_name1 [AS] alias1
    WHERE column_name1 comparison_operator (SELECT column_name1
                                            FROM table_name2 [AS] alias2
                                            WHERE alias1.column_name1 comparison_operator alias2.column_name1)

-- Return:
    Returns the rows from the table_name1 that the column_name1 satisfies the comparison with the subquery.

-- column_name1, column_name2, ...
    The columns to select from the table.

-- table_name1:
    The name of the table to select from.

-- Optional: AS
    The keyword to specify the table alias.
    - The AS keyword is optional to specify the table alias.

-- alias1:
    The alias of the table to reference in the outer query.

-- comparison_operator:
    The comparison operator is a logical operator that compares two values.
    - The comparison operator returns true if the column_name1 satisfies the comparison with the subquery.
    - The comparison operator returns false if the column_name1 does not satisfy the comparison with the subquery.
    - The comparison operator can be the following:
        = - Equal to
        <> - Not equal to
        > - Greater than
        < - Less than
        >= - Greater than or equal to
        <= - Less than or equal to
        <=> - Equal to null-safe

-- table_name2:
    The name of the table in the subquery to compare the column_name1 to.

-- alias2:
    The alias of the table to reference in the subquery.

-- Example:
    - Returns the customers who have ordered more than the average quantity ordered.
    SELECT c.customerName, od.quantityOrdered
    FROM customers c
    JOIN orders o ON c.customerNumber = o.customerNumber
    JOIN orderdetails od ON od.orderNumber = o.orderNumber
    WHERE od.quantityOrdered > (SELECT AVG(quantityOrdered)
                                 FROM orderdetails
                                 WHERE orderNumber = o.orderNumber);
*/

/*
### Derived Tables ###
    Derived tables are used to create a temporary table within a query.

-- Syntax:
    SELECT column_name1, column_name2, ...
    FROM (SELECT column_name1, column_name2, ...
          FROM table_name) [AS] derived_table_name

-- Return:
    Returns the result set from the derived table.

-- column_name1, column_name2, ...
    The columns to select from the derived table.

-- table_name:
    The name of the table to select from.

-- Optional: AS
    The keyword to specify the derived table name.
    - The AS keyword is optional to specify the derived table name.

-- derived_table_name:
    The name of the derived table.
    - The derived table name is used to reference the derived table in the query.

-- Example 1:
    - Returns the total sales from the orderdetails table.
    SELECT SUM(quantityOrdered * priceEach) AS total_sales
    FROM (SELECT quantityOrdered, priceEach
          FROM orderdetails) AS orderdetails;

-- Example 2:
    - Returns the total sales from the derived table where the order status is 'Shipped'.
    SELECT SUM(quantityOrdered * priceEach) AS total_sales
    FROM (SELECT orderNumber, quantityOrdered, priceEach
          FROM orderdetails) orderdetails
    JOIN orders o ON orderdetails.orderNumber = o.orderNumber
    WHERE o.status = 'Shipped';
*/

/*
### User-Defined Variables ###
    User-defined variables are used to store values temporarily.

-- Syntax:
    SET @variable_name := value;

-- SET:
    Assigns a value to a local variable.

-- @variable_name:
    The name of the local variable.
    - The local variable name must begin with the @ symbol.
    - The local variable name must be unique within the session.

-- :=
    The assignment operator to assign a value to a local variable.

-- value:
    The value to store in the local variable.

-- Return:
    Returns the value stored in the local variable.

-- Example 1:
    - The @total_sales is a local variable that stores the total sales.
    SET @total_sales := 0;

-- Example 2:
    - The @total_sales is used to calculate the total sales from the orderdetails table.
    SELECT @total_sales := @total_sales + quantityOrdered * priceEach
    FROM orderdetails;

-- Example 3:
    - Returns the total sales from the orderdetails table.
    SELECT @total_sales;
*/

/*
### Using Stored Procedures ###
    Stored procedures are used to execute a set of SQL statements.

-- Syntax:
    CREATE PROCEDURE procedure_name()
    BEGIN
        SQL statements;
    END;

    CALL procedure_name();

-- CREATE PROCEDURE:
    Creates a stored procedure to execute a set of SQL statements.

-- procedure_name:
    The name of the stored procedure.

-- BEGIN:
    Begins the block of SQL statements to execute in the stored procedure.

-- SQL statements:
    The SQL statements to execute in the stored procedure.

-- END:
    Ends the block of SQL statements to execute in the stored procedure.

-- CALL:
    Calls the stored procedure to execute the SQL statements.

-- Return:
    Returns the result of the SQL statements executed in the stored procedure.

-- Example 1:
    - Creates a stored procedure to get all orders.
    CREATE PROCEDURE get_orders()
    BEGIN
        SELECT *
        FROM orders;
    END;

-- Example 2:
    - Calls the stored procedure to get all orders.
    CALL get_orders();
*/

/*
-- Arithmetic Operators:
    + - Addition
    - - Subtraction
    * - Multiplication
    / - Division
    % - Modulus

-- Comparison Operators:
    = - Equal to
    <> - Not equal to
    != - Not equal to
    > - Greater than
    < - Less than
    >= - Greater than or equal to
    <= - Less than or equal to
    <=> - NULL-safe equal to

-- Logical Operators:
    AND - Combines two conditions and returns true if both conditions are true.
    OR - Combines two conditions and returns true if at least one condition is true.
    NOT - Negates a condition and returns true if the condition is false.
    BETWEEN - Returns true if a value is within a range.
    EXIST - Returns true if a subquery returns any rows.
    IN - Returns true if a value is in a list of values.
    ALL - Returns true if all values in a list of values are true.
    ANY - Returns true if any value in a list of values is true.
    SOME - Returns true if some values in a list of values are true.
    IS NULL - Returns true if a value is NULL.
    IS NOT NULL - Returns true if a value is not NULL.
    LIKE - Returns true if a value matches a pattern.
    RLIKE - Returns true if a value matches a regular expression.
    REGEXP - Returns true if a value matches a regular expression.

-- Aggregate Functions:
    AVG() - Returns the average value of a numeric column.
    COUNT() - Returns the number of rows in a result set.
    MAX() - Returns the maximum value of a column.
    MIN() - Returns the minimum value of a column.
    SUM() - Returns the sum of a numeric column.

-- String Functions:
    CHAR_LENGTH() - Returns the number of characters in a string.
    CONCAT() - Concatenates two or more strings.
    FORMAT() - Formats a number to a specified number of decimal places.
    INSERT() - Inserts a substring into a string at a specified position.
    INSTR() - Returns the position of the first occurrence of a substring in a string.
    LCASE() - Converts a string to lowercase.
    LEFT() - Returns the leftmost characters of a string.
    LENGTH() - Returns the length of a string.
    LOCATE() - Returns the position of the first occurrence of a substring in a string.
    LOWER() - Converts a string to lowercase.
    LTRIM() - Removes leading spaces from a string.
    MID() - Returns a substring from a string.
    POSITION() - Returns the position of the first occurrence of a substring in a string.
    REPEAT() - Repeats a string a specified number of times.
    REPLACE() - Replaces a substring in a string with another substring.
    REVERSE() - Reverses a string.
    RIGHT() - Returns the rightmost characters of a string.
    RTRIM() - Removes trailing spaces from a string.
    SPACE() - Returns a string of spaces.
    STRCMP() - Compares two strings.
    SUBSTRING() - Returns a substring from a string.
    TRIM() - Removes leading and trailing spaces from a string.
    UCASE() - Converts a string to uppercase.
    UPPER() - Converts a string to uppercase.

-- String Comparison Functions:
    BINARY - Compares two strings using the binary collation.
    COLLATE - Sets the collation for a string comparison.
    LIKE - Compares a string to a pattern.
    RLIKE - Compares a string to a regular expression.
    REGEXP - Compares a string to a regular expression.

-- Mathematical Functions:
    ABS() - Returns the absolute value of a number.
    ACOS() - Returns the arccosine of a number.
    ASIN() - Returns the arcsine of a number.
    ATAN() - Returns the arctangent of a number.
    ATAN2() - Returns the arctangent of the quotient of two numbers.
    CEIL() - Rounds a number up to the nearest integer.
    CEILING() - Rounds a number up to the nearest integer.
    COS() - Returns the cosine of a number.
    COT() - Returns the cotangent of a number.
    DEGREES() - Converts radians to degrees.
    EXP() - Returns e raised to the power of a number.
    FLOOR() - Rounds a number down to the nearest integer.
    LN() - Returns the natural logarithm of a number.
    LOG() - Returns the logarithm of a number to a specified base.
    LOG10() - Returns the base-10 logarithm of a number.
    PI() - Returns the value of pi.
    POW() - Returns a number raised to the power of another number.
    RADIANS() - Converts degrees to radians.
    RAND() - Returns a random number.
    ROUND() - Rounds a number to a specified number of decimal places.
    SIGN() - Returns the sign of a number.
    SIN() - Returns the sine of a number.
    SQRT() - Returns the square root of a number.
    TAN() - Returns the tangent of a number.
    TRUNCATE() - Truncates a number to a specified number of decimal places.

-- Date and Time Functions:
    CURDATE() - Returns the current date.
    CURTIME() - Returns the current time.
    NOW() - Returns the current date and time.
    DATE() - Extracts the date part of a date or datetime expression.
    DAY() - Extracts the day of the month from a date or datetime expression.
    DAYNAME() - Returns the name of the day of the week.
    DAYOFMONTH() - Returns the day of the month for a date or datetime expression.
    DAYOFWEEK() - Returns the day of the week for a date or datetime expression.
    DAYOFYEAR() - Returns the day of the year for a date or datetime expression.
    EXTRACT() - Extracts a part of a date or datetime expression.
    HOUR() - Extracts the hour from a date or datetime expression.
    MINUTE() - Extracts the minute from a date or datetime expression.
    MONTH() - Extracts the month from a date or datetime expression.
    QUARTER() - Extracts the quarter from a date or datetime expression.
    SECOND() - Extracts the second from a date or datetime expression.
    TIME() - Extracts the time part of a date or datetime expression.
    TIMESTAMP() - Converts a date or datetime expression to a timestamp.
    WEEK() - Extracts the week from a date or datetime expression.
    YEAR() - Extracts the year from a date or datetime expression.

-- Cast Functions:
    CAST() - Converts a value to a specified data type.
    CONVERT() - Converts a value to a specified data type.

-- Control Flow Functions:
    CASE - Evaluates a list of conditions and returns a value.
    IF - Executes a statement if a condition is true.
    IFNULL - Returns a specified value if a value is NULL.
    NULLIF - Returns NULL if two expressions are equal.

-- JOIN Functions:
    CROSS JOIN - Returns the Cartesian product of two tables.
    INNER JOIN - Returns the rows that have matching values in both tables.
    LEFT JOIN - Returns all rows from the left table and the matched rows from the right table.
    RIGHT JOIN - Returns all rows from the right table and the matched rows from the left table.
    SELF JOIN - Joins a table to itself.
    NATURAL JOIN - Joins two tables using implicit columns.

-- Set Functions:
    UNION - Combines the result sets of two or more SELECT statements.
    UNION ALL - Combines the result sets of two or more SELECT statements, including duplicates.
    INTERSECT - Returns the common rows between two SELECT statements.
    EXCEPT - Returns the rows that are in the first SELECT statement but not in the second SELECT statement.

-- Subquery Functions:
    EXISTS - Returns true if a subquery returns any rows.
    IN - Returns true if a value is in a list of values.
    ALL - Returns true if all values in a list of values are true.
    ANY - Returns true if any value in a list of values is true.
    SOME - Returns true if some values in a list of values are true.

-- Subquery Comparison Functions:
    = ALL - Returns true if a value is equal to all values in a list of values.
    <> ALL - Returns true if a value is not equal to all values in a list of values.
    > ALL - Returns true if a value is greater than all values in a list of values.
    < ALL - Returns true if a value is less than all values in a list of values.
    >= ALL - Returns true if a value is greater than or equal to all values in a list of values.
    <= ALL - Returns true if a value is less than or equal to all values in a list of values.
    = ANY - Returns true if a value is equal to any value in a list of values.
    <> ANY - Returns true if a value is not equal to any value in a list of values.
    > ANY - Returns true if a value is greater than any value in a list of values.
    < ANY - Returns true if a value is less than any value in a list of values.
    >= ANY - Returns true if a value is greater than or equal to any value in a list of values.
    <= ANY - Returns true if a value is less than or equal to any value in a list of values.
    = SOME - Returns true if a value is equal to some value in a list of values.
    <> SOME - Returns true if a value is not equal to some value in a list of values.
    > SOME - Returns true if a value is greater than some value in a list of values.
    < SOME - Returns true if a value is less than some value in a list of values.
    >= SOME - Returns true if a value is greater than or equal to some value in a list of values.
    <= SOME - Returns true if a value is less than or equal to some value in a list of values.

-- Database Models:
    - Hierarchical Model
        - Represents data in a tree-like structure.
    - Network Model
        - Represents data in a graph-like structure.
    - Relational Model
        - Represents data in tables.
    - Object-Oriented Model
        - Represents data as objects.
    - Object-Relational Model
        - Represents data as objects and tables.
    - Document Model
        - Represents data as documents.
    - Key-Value Model
        - Represents data as key-value pairs.
    - Graph Model
        - Represents data as nodes and edges.

-- ACID Database Properties:
    - Atomicity
        - Ensures that all operations in a transaction are completed successfully.
    - Consistency
        - Ensures that the database remains in a consistent state after a transaction.
    - Isolation
        - Ensures that transactions are executed independently of each other.
    - Durability
        - Ensures that the changes made by a transaction are permanent.

-- Entity-Relationship Diagram (ERD)
    - Entity-Relationship Diagram (ERD) is a visual representation of the entities and relationships in the database.
    - ERD is used to design and model the database.
    - ERD is used to communicate the database design.
    - ERD is used to document the database design.
    - ERD is used to validate the database design.
    - ERD is used to implement the database design.

-- Entity Relationship Diagram Components:
    - Entities
        - Represents a table in a database.
        - Represents a concept, location, event, role, or thing.
        - Represents a noun.
        - Represents a row in a table.
        - Represents a single instance of an entity.
    - Attributes
        - Represents a column in a table.
        - Represents a fact or description of an entity.
        - Represents a property of an entity.
        - Represents a noun.
    - Relationships
        - Represents a connection between entities.
        - Represents an association between entities.
        - Represents a verb.
        - Represents a connection between tables.
    - Cardinality
        - Represents the number of instances of an entity that can be associated with another entity.
        - Represents the number of rows in a table that can be associated with another table.
    - Primary Key
        - Uniquely identifies a row in a table.
        - Ensures that each row in a table is unique.
        - Ensures that each row in a table is identifiable.
    - Foreign Key
        - Links a row in one table to a row in another table.
        - Establishes a relationship between tables.
        - Establishes a connection between tables.
    - Index
        - Improves the performance of queries.
        - Retrieves data faster.
        - Sorts and filters data.
    - View
        - Stores a query as a virtual table.
        - Represents a subset of data from one or more tables.
        - Simplifies complex queries.
    - Trigger
        - Executes a set of SQL statements in response to an event.
        - Enforces constraints.
        - Automates tasks.
    - Procedure
        - Executes a set of SQL statements.
        - Automates tasks.
        - Encapsulates logic.
    - Function
        - Returns a value based on input parameters.
        - Encapsulates logic.
        - Reuses code.
    - Event
        - Executes a set of SQL statements at a scheduled time.
        - Automates tasks.
        - Schedules tasks.
    - Constraint
        - Enforces rules on the data in a table.
        - Ensures data integrity.
        - Ensures data consistency.
    - Key
        - Uniquely identifies a row in a table.
        - Ensures that each row in a table is unique.
        - Ensures that each row in a table is identifiable.
    - Optionality
        - Represents the optionality of a relationship.
        - Represents the minimum and maximum number of instances of an entity that can be associated with another entity.
    - Participation
        - Represents the participation of an entity in a relationship.
        - Represents the minimum and maximum number of instances of an entity that can be associated with another entity.
    - Generalization
        - Represents a relationship between entities.
        - Represents a connection between entities.
        - Represents an association between entities.
    - Specialization
        - Represents a relationship between entities.
        - Represents a connection between entities.
        - Represents an association between entities.
    - Aggregation
        - Represents a relationship between entities.
        - Represents a connection between entities.
        - Represents an association between entities.

-- Levels of Entity Relationship Diagram
    - Conceptual Level
        - Conceptual ERD is used to model the database at a high level.
        - Conceptual ERD is used to represent the entities and relationships in the database.
        - Conceptual ERD is used to define the scope of the database.
        - Conceptual ERD is used to define the requirements of the database.
        - Entity names are used to model the database at a high level.
        - Entity relationships are used to model the database at a high level.
    - Logical Level
        - Logical ERD is used to model the database at a detailed level.
        - Logical ERD is used to represent the entities, attributes, and relationships in the database.
        - Logical ERD is used to define the structure of the database.
        - Logical ERD is used to define the constraints of the database.
        - Attributes are used to model the database at a detailed level.
        - Primary keys are used to model the database at a detailed level.
        - Foreign keys are used to model the database at a detailed level.
        - Normalization is used to model the database at a detailed level.
        - Logic Model is the process of arranging data into logical, organized groups of objects that can easily be queried.
        - Logic Design reduce data repetition or eliminate it completely.
    - Physical Level
        - Physical ERD is used to model the database at a physical level.
        - Physical ERD is used to represent the tables, columns, and indexes in the database.
        - Physical ERD is used to define the storage of the database.
        - Physical ERD is used to define the performance of the database.
        - Tables names are used to model the database at a physical level.
        - Column names are used to model the database at a physical level.
        - Column data types are used to model the database at a physical level.
        - Primary keys are used to model the database at a physical level.
        - Foreign keys are used to model the database at a physical level.

-- Conceptual Data Model Diagram:
    - Entity Names
    - Entity Relationships
-- Logical Data Model Diagram:
    - Entity Names
    - Entity Relationships
    - Attributes
    - Primary Keys
    - Foreign Keys
-- Physical Data Model Diagram:
    - Tables Names
    - Column Names
    - Column Data Types
    - Primary Keys
    - Foreign Keys

-- Data Definition Language (DDL)
    - Data Definition Language (DDL) is used to define the structure of the database.
    - DDL is used to create, modify, and delete database objects.
    - DDL is used to define the tables, views, indexes, procedures, functions, triggers, and events in the database.
    - DDL is used to define the constraints on the tables.
    - DDL is used to define the relationships between the tables.

-- Data Manipulation Language (DML)
    - Data Manipulation Language (DML) is used to manipulate the data in the database.
    - DML is used to insert, update, delete, and retrieve data from the database.
    - DML is used to query the database.
    - DML is used to modify the data in the database.
    - DML is used to retrieve the data from the database.

-- Data Query Language (DQL)
    - Data Query Language (DQL) is used to retrieve data from the database.
    - DQL is used to query the database.
    - DQL is used to retrieve the data from the database.
    - DQL is used to select, filter, and sort the data in the database.
    - DQL is used to retrieve the data from the tables.

-- Data Control Language (DCL)
    - Data Control Language (DCL) is used to control the access to the database.
    - DCL is used to grant and revoke privileges to users.
    - DCL is used to control the permissions on the database objects.

-- Transaction Control Language (TCL)
    - Transaction Control Language (TCL) is used to control the transactions in the database.
    - TCL is used to start, commit, and rollback transactions.
    - TCL is used to control the changes made by transactions.

-- Database Objects:
    - Tables
        - Tables are used to store data in rows and columns.
        - Tables are used to represent entities in the database.
        - Tables are used to store the data in the database.
    - Views
        - Views are used to store a query as a virtual table.
        - Views are used to represent a subset of data from one or more tables.
        - Views are used to simplify complex queries.
    - Indexes
        - Indexes are used to improve the performance of queries.
        - Indexes are used to retrieve data faster.
        - Indexes are used to sort and filter data.
    - Procedures
        - Procedures are used to execute a set of SQL statements.
        - Procedures are used to automate tasks.
        - Procedures are used to encapsulate logic.
    - Functions
        - Functions are used to return a value based on input parameters.
        - Functions are used to encapsulate logic.
        - Functions are used to reuse code.
    - Triggers
        - Triggers are used to execute a set of SQL statements in response to an event.
        - Triggers are used to enforce constraints.
        - Triggers are used to automate tasks.
    - Events
        - Events are used to execute a set of SQL statements at a scheduled time.
        - Events are used to automate tasks.
        - Events are used to schedule tasks.

-- Table Constraints:
    - NOT NULL
        - NOT NULL constraint ensures that a column cannot contain NULL values.
        - NOT NULL constraint ensures that a column must contain a value.
    - UNIQUE
        - UNIQUE constraint ensures that all values in a column are unique.
        - UNIQUE constraint ensures that a column cannot contain duplicate values.
    - PRIMARY KEY
        - PRIMARY KEY constraint combines the NOT NULL and UNIQUE constraints.
        - PRIMARY KEY constraint ensures that a column cannot contain NULL values and duplicate values.
    - FOREIGN KEY
        - FOREIGN KEY constraint ensures that values in a column match values in another table.
        - FOREIGN KEY constraint ensures that a column must contain values that exist in another table.
    - CHECK
        - CHECK constraint ensures that values in a column meet a specified condition.
        - CHECK constraint ensures that a column must contain values that satisfy a condition.
    - DEFAULT
        - DEFAULT constraint sets a default value for a column.
        - DEFAULT constraint sets a value for a column if no value is specified.

-- Column Constraints:
    - NOT NULL
        - NOT NULL constraint ensures that a column cannot contain NULL values.
        - NOT NULL constraint ensures that a column must contain a value.
    - UNIQUE
        - UNIQUE constraint ensures that all values in a column are unique.
        - UNIQUE constraint ensures that a column cannot contain duplicate values.
    - PRIMARY KEY
        - PRIMARY KEY constraint combines the NOT NULL and UNIQUE constraints.
        - PRIMARY KEY constraint ensures that a column cannot contain NULL values and duplicate values.
    - FOREIGN KEY
        - FOREIGN KEY constraint ensures that values in a column match values in another table.
        - FOREIGN KEY constraint ensures that a column must contain values that exist in another table.
    - CHECK
        - CHECK constraint ensures that values in a column meet a specified condition.
        - CHECK constraint ensures that a column must contain values that satisfy a condition.
    - DEFAULT
        - DEFAULT constraint sets a default value for a column.
        - DEFAULT constraint sets a value for a column if no value is specified.

-- Table Relationships:
    - One-to-One
        - One-to-One relationship is a relationship where one record in a table is related to one record in another table.
        - One-to-One relationship is a relationship where one record in a table is associated with one record in another table.
    - One-to-Many
        - One-to-Many relationship is a relationship where one record in a table is related to multiple records in another table.
        - One-to-Many relationship is a relationship where one record in a table is associated with multiple records in another table.
    - Many-to-Many
        - Many-to-Many relationship is a relationship where multiple records in a table are related to multiple records in another table.
        - Many-to-Many relationship is a relationship where multiple records in a table are associated with multiple records in another table.

-- DQL Functions:
    SELECT - SELECT statement is used to retrieve data from a database.
    SELECT - SELECT statement is used to query the database.
    SELECT - SELECT statement is used to retrieve the data from the database.

-- DML Functions:
    SELECT - SELECT statement is used to retrieve data from a database.
    INSERT - INSERT statement is used to insert data into a table.
    UPDATE - UPDATE statement is used to update data in a table.
    DELETE - DELETE statement is used to delete data from a table.

-- DDL Functions:
    CREATE - CREATE statement is used to create a new database object.
    ALTER - ALTER statement is used to modify an existing database object.
    DROP - DROP statement is used to delete a database object.
    TRUNCATE - TRUNCATE statement is used to delete all rows from a table.
    RENAME - RENAME statement is used to rename a database object.

-- DCL Functions:
    GRANT - GRANT statement is used to grant privileges to a user.
    REVOKE - REVOKE statement is used to revoke privileges from a user.

-- TCL Functions:
    BEGIN - BEGIN statement is used to start a transaction.
    COMMIT - COMMIT statement is used to commit a transaction.
    ROLLBACK - ROLLBACK statement is used to roll back a transaction.

-- Normalization - Reduces redundancy and improves data integrity.
        - First Normal Form (1NF)
            - Eliminates repeating groups in a table.
            - All Attributes have a unique name.
            - Atomicity of data.
            - Each column has a single (atomic) value.
            - Each row is unique.
            - Each column has a unique name.
            - Each table has a unique name.
            - Each table has a primary key.
            - Values are stored in the table should be of the same domain.
        - Second Normal Form (2NF)
            - Eliminates partial dependencies in a table.
            - All non-key attributes are fully functional dependent on the primary key.
        - Third Normal Form (3NF)
            - Eliminates transitive dependencies in a table.
            - All non-key attributes are non-transitively dependent on the primary key.
            - Remove columns that are not dependent on the primary key.
        - Boyce-Codd Normal Form (BCNF)
            - Eliminates non-trivial dependencies in a table.
        - Fourth Normal Form (4NF)
            - Eliminates multi-valued dependencies in a table.
        - Fifth Normal Form (5NF)
            - Eliminates join dependencies in a table.
-- Denormalization - Combines tables to improve performance.
        - Combines multiple tables into a single table.
        - Reduces the number of tables in a database.
        - Improves the performance of queries.
        - Increases the redundancy of data.

-- CRUD Functions:
    CREATE - CREATE statement is used to create a new database object.
    READ - READ statement is used to retrieve data from a database.
    UPDATE - UPDATE statement is used to update data in a table.
    DELETE - DELETE statement is used to delete data from a table.

-- Advantage of RDBMS
    - **Simplicity**
        - A Relational data model in DBMS is simpler than the hierarchical and network model.
    - **Structural Independence**
        - The relational database is only concerned with data, not with a structure. This can improve the model's performance.
    - **Easy to use**
        - The relational model in a DBMS, with its intuitive tables of rows and columns, is a user-friendly tool that you can easily grasp and navigate.
    - **Query capability**
        - It makes it possible for a high-level query language like [SQL](https://www.guru99.com/sql.html) to avoid complex database navigation.
    - **Data independence**
        - The Structure of the Relational database can be changed without having to change any application.


-- Table Functions:
    CREATE TABLE - Creates a new table.
    ALTER TABLE - Modifies an existing table.
    DROP TABLE - Deletes a table.
    TRUNCATE TABLE - Deletes all rows from a table.
    RENAME TABLE - Renames a table.
    DESCRIBE - Describes the columns of a table.
    SHOW TABLES - Shows the tables in a database.

-- Constraint Functions:
    ADD CONSTRAINT - Adds a constraint to a table.
    DROP CONSTRAINT - Deletes a constraint from a table.

-- Constraint Functions:
    PRIMARY KEY - Adds a primary key constraint to a table.
    FOREIGN KEY - Adds a foreign key constraint to a table.
    UNIQUE - Adds a unique constraint to a table.
    CHECK - Adds a check constraint to a table.
    DEFAULT - Adds a default constraint to a table.
    NOT NULL - Adds a not null constraint to a table.

-- Column Functions:
    ADD COLUMN - Adds a column to a table.
    MODIFY COLUMN - Modifies a column in a table.
    DROP COLUMN - Deletes a column from a table.
    RENAME COLUMN - Renames a column in a table.

-- Index Functions:
    CREATE INDEX - Creates an index on a table.
    DROP INDEX - Deletes an index from a table.

-- View Functions:
    CREATE VIEW - Creates a view from a SELECT statement.
    DROP VIEW - Deletes a view.
    SHOW CREATE VIEW - Shows the CREATE VIEW statement for a view.

-- User Functions:
    CREATE USER - Creates a new user.
    DROP USER - Deletes a user.
    RENAME USER - Renames a user.
    SET PASSWORD - Sets a password for a user.
    GRANT - Grants privileges to a user.
    REVOKE - Revokes privileges from a user.


-- Session Functions:
    SET - Sets a session variable.
    SHOW - Shows the value of a session variable.

-- System Functions:
    DATABASE() - Returns the current database name.
    SCHEMA() - Returns the current database name.
    VERSION() - Returns the version of the database.

-- Information Schema Functions:
    INFORMATION_SCHEMA - Returns information about the database.

-- User-Defined Functions:
    CREATE FUNCTION - Creates a user-defined function.
    DROP FUNCTION - Deletes a user-defined function.

-- Stored Procedure Functions:
    CREATE PROCEDURE - Creates a stored procedure.
    DROP PROCEDURE - Deletes a stored procedure.

-- Trigger Functions:
    CREATE TRIGGER - Creates a trigger.
    DROP TRIGGER - Deletes a trigger.

-- Event Functions:
    CREATE EVENT - Creates an event.
    DROP EVENT - Deletes an event.

-- Cursor Functions:
    DECLARE - Declares a cursor.
    OPEN - Opens a cursor.
    FETCH - Fetches a row from a cursor.
    CLOSE - Closes a cursor.

-- Error Functions:
    SIGNAL - Raises an error.
    RESIGNAL - Raises an error.
    GET DIAGNOSTICS - Returns diagnostic information.

-- Lock Functions:
    GET_LOCK - Acquires a named lock.
    RELEASE_LOCK - Releases a named lock.

-- Grouping Functions:
    GROUP_CONCAT() - Concatenates values into a single string.
    GROUPING() - Returns the grouping of a set of values.
    GROUPING_ID() - Returns the grouping ID of a set of values.

-- Encryption Functions:
    AES_DECRYPT() - Decrypts an encrypted string.
    AES_ENCRYPT() - Encrypts a string.
    DES_DECRYPT() - Decrypts an encrypted string.
    DES_ENCRYPT() - Encrypts a string.

-- Hash Functions:
    MD5() - Calculates the MD5 hash of a string.
    SHA1() - Calculates the SHA-1 hash of a string.
    SHA() - Calculates the SHA-1 hash of a string.
    SHA2() - Calculates the SHA-2 hash of a string.

-- Miscellaneous Functions:
    UUID() - Returns a UUID.

-- Compression Functions:
    COMPRESS() - Compresses a string.
    UNCOMPRESS() - Uncompresses a string.

-- Bit Functions:
    BIT_AND() - Returns the bitwise AND of two numbers.
    BIT_COUNT() - Returns the number of bits set to 1.
    BIT_LENGTH() - Returns the length of a string in bits.
    BIT_OR() - Returns the bitwise OR of two numbers.
    BIT_XOR() - Returns the bitwise XOR of two numbers.

-- JSON Functions:
    JSON_ARRAY() - Returns a JSON array.
    JSON_ARRAYAGG() - Returns a JSON array aggregated from a result set.
    JSON_ARRAY_APPEND() - Appends a value to a JSON array.
    JSON_ARRAY_INSERT() - Inserts a value into a JSON array.
    JSON_CONTAINS() - Returns true if a JSON document contains a specified value.
    JSON_CONTAINS_PATH() - Returns true if a JSON document contains a specified path.
    JSON_DEPTH() - Returns the depth of a JSON document.
    JSON_EXTRACT() - Extracts a value from a JSON document.
    JSON_INSERT() - Inserts a value into a JSON document.
    JSON_KEYS() - Returns the keys from a JSON document.
    JSON_LENGTH() - Returns the length of a JSON document.
    JSON_MERGE() - Merges two or more JSON documents.
    JSON_MERGE_PATCH() - Merges two JSON documents.
    JSON_MERGE_PRESERVE() - Merges two JSON documents.
    JSON_OBJECT() - Returns a JSON object.
    JSON_OBJECTAGG() - Returns a JSON object aggregated from a result set.
    JSON_PRETTY() - Returns a formatted JSON document.
    JSON_QUOTE() - Quotes a JSON document.
    JSON_REMOVE() - Removes a value from a JSON document.
    JSON_REPLACE() - Replaces a value in a JSON document.
    JSON_SEARCH() - Searches a JSON document for a specified value.
    JSON_SET() - Sets a value in a JSON document.
    JSON_STORAGE_SIZE() - Returns the storage size of a JSON document.
    JSON_TYPE() - Returns the type of a JSON value.
    JSON_UNQUOTE() - Unquotes a JSON document.
    JSON_VALID() - Returns true if a JSON document is valid.


-- Database Indexes:
    - Clustered Index
        - Stores the data rows in the index.
    - Non-Clustered Index
        - Stores the data rows separately from the index.
    - Unique Index
        - Ensures that all values in a column are unique.
    - Composite Index
        - An index that consists of multiple columns.
    - Covering Index
        - An index that includes all the columns in a query.
    - Full-Text Index
        - An index that is used for full-text searches.

-- Database Views:
    - Virtual Table
        - A table that is created from a SELECT statement.
    - Read-Only
        - A view that cannot be modified.
    - Updatable
        - A view that can be modified.
    - Materialized
        - A view that stores the results of the SELECT statement.

-- Database Triggers:
    - Stored Procedure
        - A set of SQL statements that are executed when a specific event occurs.
    - Event
        - An action that triggers the execution of a stored procedure.
    - Trigger
        - A stored procedure that is executed when a specific event occurs.
    - Before Trigger
        - A trigger that is executed before the event occurs.
    - After Trigger
        - A trigger that is executed after the event occurs.

-- Database Locks:
    - Shared Lock
        - Prevents other transactions from modifying a resource.
    - Exclusive Lock
        - Prevents other transactions from reading or modifying a resource.
    - Implicit Lock
        - Automatically acquired by the database.
    - Explicit Lock
        - Manually acquired by the user.

-- Database Backup and Recovery:
    - Full Backup
        - Backs up the entire database.
    - Differential Backup
        - Backs up the changes since the last full backup.
    - Incremental Backup
        - Backs up the changes since the last backup.
    - Point-In-Time Recovery
        - Restores the database to a specific point in time.
    - Rollback
        - Reverts the database to a previous state.
    - Recovery
        - Restores the database to a consistent state.

-- Database Replication:
    - Master-Slave Replication
        - A master database replicates data to one or more slave databases.
    - Master-Master Replication
        - Two or more databases replicate data to each other.
    - Multi-Master Replication
        - Multiple databases replicate data to each other.
    - One-Way Replication
        - Data is replicated from one database to another.
    - Two-Way Replication
        - Data is replicated between two databases.

-- Database Sharding:
    - Horizontal Sharding
        - Splits a table into multiple tables.
    - Vertical Sharding
        - Splits a table into multiple columns.
    - Key-Based Sharding
        - Splits a table based on a key.
    - Range-Based Sharding
        - Splits a table based on a range.
    - Hash-Based Sharding
        - Splits a table based on a hash function.

-- Database Partitioning:
    - Range Partitioning
        - Splits a table based on a range of values.
    - List Partitioning
        - Splits a table based on a list of values.
    - Hash Partitioning
        - Splits a table based on a hash function.
    - Key Partitioning
        - Splits a table based on a key.
    - Composite Partitioning
        - Splits a table based on multiple criteria.

-- Database Clustering:
    - Shared-Nothing
        - Each node in the cluster has its own storage.
    - Shared-Disk
        - All nodes in the cluster share the same storage.
    - Master-Slave
        - One node in the cluster is the master and the others are slaves.
    - Master-Master
        - All nodes in the cluster can read and write data.
    - Active-Passive
        - One node in the cluster is active and the others are passive.

-- Database Scalability:
    - Vertical Scaling
        - Increases the capacity of a single server.
    - Horizontal Scaling
        - Increases the capacity by adding more servers.
    - Read Scaling
        - Increases the capacity for read operations.
    - Write Scaling
        - Increases the capacity for write operations.
    - Load Balancing
        - Distributes the workload across multiple servers.

-- Database Security:
    - Authentication
        - Verifies the identity of a user.
    - Authorization
        - Grants or denies access to resources.
    - Encryption
        - Converts data into a secure format.
    - Auditing
        - Tracks and logs database activities.
    - Backup and Recovery
        - Protects data from loss or corruption.

-- Database Performance Tuning:
    - Indexing
        - Improves the performance of SELECT queries.
    - Query Optimization
        - Improves the performance of SQL queries.
    - Caching
        - Stores frequently accessed data in memory.
    - Partitioning
        - Splits a table into smaller parts.
    - Sharding
        - Splits a table into multiple tables.

-- Database Monitoring:
    - Performance
        - Monitors the performance of the database.
    - Availability
        - Monitors the availability of the database.
    - Security
        - Monitors the security of the database.
    - Backup and Recovery
        - Monitors the backup and recovery of the database.
    - Replication
        - Monitors the replication of the database.



*/