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

# Example Using UPDATE
UPDATE employees
SET reportsTo = 1143
WHERE employeeNumber = 1056;

# Example Using DELETE
DELETE FROM employees
WHERE employeeNumber = 1056;

-- USE SQL INSERT INTO STATEMENT
    -- INSERT INTO statement is used to insert new rows into a table.

-- Syntax:
    -- INSERT INTO table_name (column1, column2, column3, ...)
    -- VALUES (value1, value2, value3, ...);

-- (column1, column2, column3, ...)
    -- column1, column2, column3, ... are the names of the columns in the table.
    -- Column names are optional in the INSERT statement.
    -- order of the columns is important.
    -- the order of the columns in the INSERT statement should match the order of the columns in the table.
    -- if the columns are not in the same order, the values will be inserted into the wrong columns.
    -- if the columns are not in the same order, the INSERT statement will fail.
    -- When the column names are not specified, the values should be in the same order as the columns in the table.
    -- When the column names are specified, the values should be in the same order as the column names.
-- Why use column names?
    -- When the table has many columns, it is easier to use column names.
    -- When the table has many columns, it is easier to read the INSERT statement.
    -- When the table has many columns, it is easier to write the INSERT statement.
    -- When the table has many columns, it is easier to maintain the INSERT statement.

-- VALUES (value1, value2, value3, ...)
    -- value1, value2, value3, ... are the values to be inserted into the columns.
    -- the number of values should match the number of columns in the table.
    -- the data type of the values should match the data type of the columns in the table.
    -- the values should be in the same order as the columns in the table.
    -- the values should be separated by commas.
    -- the values should be enclosed in parentheses.
    -- the values should be enclosed in single quotes if the data type is a string.
    -- the values should be enclosed in single quotes if the data type is a date.
    -- the values should be enclosed in single quotes if the data type is a time.
    -- the values should be enclosed in single quotes if the data type is a timestamp.
    -- the values should be enclosed in single quotes if the data type is a character.
    -- the values should be enclosed in single quotes if the data type is a varchar.
    -- the values should be enclosed in single quotes if the data type is a text.
    -- the values should be enclosed in single quotes if the data type is a binary.
    -- Multiple insert statements can be combined into a single insert statement using a comma.

-- Insert one row using INSERT without column names
    -- INSERT INTO table_name
    -- VALUES (value1, value2, value3, ...);
    INSERT INTO employees
    VALUES (1056, 'John', 'Doe', '123', 'john@gmail.com', 'Sales Rep', 1143, 1056, 134);

-- Insert one row using INSERT with column names
    -- INSERT INTO table_name
    -- (column1, column2, column3, ...)
    -- VALUES (value1, value2, value3, ...);
    INSERT INTO employees
    (employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours)
    VALUES (1056, 'John', 'Doe', '123', 'john@gmail.com', 'Sales Rep', 1143, 1056, 134);

-- Insert multiple rows using INSERT without column names
    -- INSERT INTO table_name
    -- VALUES
    -- (value1, value2, value3, ...),
    -- (value1, value2, value3, ...),
    -- (value1, value2, value3, ...);
    INSERT INTO employees
    VALUES (1056, 'Doe', 'John', '123', 'john@gmail.com', 'Sales Rep', 1143, 1056, 134),
           (1057, 'Doe', 'Jane', '123', 'jane@gmail.com', 'Sales Rep', 1143, 1056, 133),
           (1058, 'Doe', 'Jim', '123', 'jim@gmail.com', 'Sales Rep', 1143, 1056, 132);

-- Insert multiple rows using INSERT with column names
    -- INSERT INTO table_name
    -- (column1, column2, column3, ...)
    -- VALUES
    -- (value1, value2, value3, ...),
    -- (value1, value2, value3, ...),
    -- (value1, value2, value3, ...);
    INSERT INTO employees
    (employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours)
    VALUES
    (1056, 'Doe', 'John', '123', 'john@gmail.com', 'Sales Rep', 1143, 1056, 134),
    (1057, 'Doe', 'Jane', '123', 'jane@gmail.com', 'Sales Rep', 1143, 1056, 133),
    (1058, 'Doe', 'Jim', '123', 'jim@gmail.com', 'Sales Rep', 1143, 1056, 132);

-- Insert multiple rows using INSERT and SELECT without column names
    -- INSERT INTO table_name
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    INSERT INTO employees
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- Insert multiple rows using INSERT and SELECT with column names
    -- INSERT INTO table_name
    -- (column1, column2, column3, ...)
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    INSERT INTO employees
    (employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours)
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- USE SQL UPDATE STATEMENT
    -- UPDATE statement is used to update existing rows in a table.

-- Syntax:
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...
    -- WHERE condition;

-- SET column1 = value1, column2 = value2, ...
    -- column1, column2, ... are the names of the columns in the table.
    -- value1, value2, ... are the values to be updated in the columns.
    -- the number of columns should match the number of values.
    -- the data type of the values should match the data type of the columns.
    -- the values should be separated by commas.
    -- the values should be enclosed in single quotes if the data type is a string.
    -- the values should be enclosed in single quotes if the data type is a date.
    -- the values should be enclosed in single quotes if the data type is a time.
    -- the values should be enclosed in single quotes if the data type is a timestamp.
    -- the values should be enclosed in single quotes if the data type is a character.
    -- the values should be enclosed in single quotes if the data type is a varchar.
    -- the values should be enclosed in single quotes if the data type is a text.
    -- the values should be enclosed in single quotes if the data type is a binary.

-- WHERE condition
    -- the WHERE clause is optional.
    -- the WHERE clause is used to update the rows that meet the condition.
    -- the WHERE clause is used to update the rows that meet the criteria.
    -- the WHERE clause is used to update the rows that meet the filter.

-- Update one row using UPDATE
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...
    -- WHERE condition;
    UPDATE employees
    SET reportsTo = 1143
    WHERE employeeNumber = 1056;

-- Update multiple rows using UPDATE
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...
    -- WHERE condition;
    UPDATE employees
    SET reportsTo = 1143,
        VacationHours = 134
    WHERE employeeNumber = 1056;

-- Update all rows using UPDATE
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...;
    UPDATE employees
    SET reportsTo = 1143,
        VacationHours = 134;

-- Update rows using UPDATE with SELECT
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...
    -- WHERE column_name IN (SELECT column_name FROM another_table WHERE condition);
    UPDATE employees
    SET reportsTo = 1143
    WHERE employeeNumber IN (SELECT employeeNumber FROM employees WHERE reportsTo = 1143);

-- USE SQL DELETE STATEMENT
    -- DELETE statement is used to delete existing rows in a table.

-- Syntax:
    -- DELETE FROM table_name
    -- WHERE condition;

-- WHERE condition
    -- the WHERE clause is optional.
    -- the WHERE clause is used to delete the rows that meet the condition.
    -- the WHERE clause is used to delete the rows that meet the criteria.
    -- the WHERE clause is used to delete the rows that meet the filter.

-- Delete one row using DELETE
    -- DELETE FROM table_name
    -- WHERE condition;
    DELETE FROM employees
    WHERE employeeNumber = 1056;

-- Delete multiple rows using DELETE
    -- DELETE FROM table_name
    -- WHERE condition;
    DELETE FROM employees
    WHERE employeeNumber = 1056;

-- Delete all rows using DELETE
    -- DELETE FROM table_name;
    DELETE FROM employees;

-- Delete rows using DELETE with SELECT
    -- DELETE FROM table_name
    -- WHERE column_name IN (SELECT column_name FROM another_table WHERE condition);
    DELETE FROM employees
    WHERE employeeNumber IN (SELECT employeeNumber FROM employees WHERE reportsTo = 1143);

-- USE INSERT INTO STATEMENT and CREATE TEMPORARY TABLE
    -- INSERT INTO statement is used to insert new rows into a table.
    -- CREATE TEMPORARY TABLE statement is used to create a temporary table.

-- Syntax:
    -- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;

-- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- table_name is the name of the temporary table.
    -- IF NOT EXISTS is optional.
    -- IF NOT EXISTS is used to check if the table exists before creating it.
    -- IF NOT EXISTS is used to create the table if it does not exist.
    -- IF NOT EXISTS is used to skip the creation of the table if it
    -- already exists.
    -- IF NOT EXISTS is used to prevent an error if the table already exists.

-- AS
    -- AS is optional.
    -- AS is used to create a temporary table from the result set of a SELECT statement.
    -- AS is used to create a temporary table from the columns of another table.
    -- AS is used to create a temporary table from the rows of another table.

-- SELECT column1, column2, column3, ...
    -- column1, column2, column3, ... are the names of the columns in the temporary table.
    -- column1, column2, column3, ... are the names of the columns in the result set.
    -- column1, column2, column3, ... are the names of the columns in the SELECT statement.
    -- column1, column2, column3, ... are the names of the columns in the another table.
    -- column1, column2, column3, ... are the names of the columns in the table.

-- FROM another_table
    -- another_table is the name of the table to select the columns from.
    -- another_table is the name of the table to select the rows from.

-- WHERE condition
    -- the WHERE clause is optional.
    -- the WHERE clause is used to filter the rows in the another table.
    -- the WHERE clause is used to filter the rows in the table.

-- Create a temporary table using CREATE TEMPORARY TABLE
    -- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    CREATE TEMPORARY TABLE IF NOT EXISTS employees_temp
    AS
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- Insert rows into a temporary table using INSERT INTO
    -- INSERT INTO table_name
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    INSERT INTO employees_temp
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- USE MySQL UPDATE STATEMENT and CREATE TEMPORARY TABLE
    -- UPDATE statement is used to update existing rows in a table.
    -- CREATE TEMPORARY TABLE statement is used to create a temporary table.

-- Syntax:
    -- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;

-- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- table_name is the name of the temporary table.
    -- IF NOT EXISTS is optional.
    -- IF NOT EXISTS is used to check if the table exists before creating it.
    -- IF NOT EXISTS is used to create the table if it does not exist.
    -- IF NOT EXISTS is used to skip the creation of the table if it
    -- already exists.
    -- IF NOT EXISTS is used to prevent an error if the table already exists.

-- AS
    -- AS is optional.
    -- AS is used to create a temporary table from the result set of a SELECT statement.
    -- AS is used to create a temporary table from the columns of another table.
    -- AS is used to create a temporary table from the rows of another table.

-- SELECT column1, column2, column3, ...
    -- column1, column2, column3, ... are the names of the columns in the temporary table.
    -- column1, column2, column3, ... are the names of the columns in the result set.
    -- column1, column2, column3, ... are the names of the columns in the SELECT statement.
    -- column1, column2, column3, ... are the names of the columns in the another table.
    -- column1, column2, column3, ... are the names of the columns in the table.

-- FROM another_table
    -- another_table is the name of the table to select the columns from.
    -- another_table is the name of the table to select the rows from.

-- WHERE condition
    -- the WHERE clause is optional.
    -- the WHERE clause is used to filter the rows in the another table.
    -- the WHERE clause is used to filter the rows in the table.

-- Create a temporary table using CREATE TEMPORARY TABLE
    -- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    CREATE TEMPORARY TABLE IF NOT EXISTS employees_temp
    AS
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- Update rows in a temporary table using UPDATE
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...
    -- WHERE condition;
    UPDATE employees_temp
    SET reportsTo = 1143
    WHERE employeeNumber = 1056;

-- USE MySQL DELETE STATEMENT and CREATE TEMPORARY TABLE
    -- DELETE statement is used to delete existing rows in a table.
    -- CREATE TEMPORARY TABLE statement is used to create a temporary table.

-- Syntax:
    -- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;

-- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- table_name is the name of the temporary table.
    -- IF NOT EXISTS is optional.
    -- IF NOT EXISTS is used to check if the table exists before creating it.
    -- IF NOT EXISTS is used to create the table if it does not exist.
    -- IF NOT EXISTS is used to skip the creation of the table if it
    -- already exists.
    -- IF NOT EXISTS is used to prevent an error if the table already exists.

-- AS
    -- AS is optional.
    -- AS is used to create a temporary table from the result set of a SELECT statement.
    -- AS is used to create a temporary table from the columns of another table.
    -- AS is used to create a temporary table from the rows of another table.

-- SELECT column1, column2, column3, ...
    -- column1, column2, column3, ... are the names of the columns in the temporary table.
    -- column1, column2, column3, ... are the names of the columns in the result set.
    -- column1, column2, column3, ... are the names of the columns in the SELECT statement.
    -- column1, column2, column3, ... are the names of the columns in the another table.
    -- column1, column2, column3, ... are the names of the columns in the table.

-- FROM another_table
    -- another_table is the name of the table to select the columns from.
    -- another_table is the name of the table to select the rows from.

-- WHERE condition
    -- the WHERE clause is optional.
    -- the WHERE clause is used to filter the rows in the another table.
    -- the WHERE clause is used to filter the rows in the table.

-- Create a temporary table using CREATE TEMPORARY TABLE
    -- CREATE TEMPORARY TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    CREATE TEMPORARY TABLE IF NOT EXISTS employees_temp
    AS
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- Delete rows in a temporary table using DELETE
    -- DELETE FROM table_name
    -- WHERE condition;
    DELETE FROM employees_temp
    WHERE employeeNumber = 1056;

-- USE SQL INSERT INTO STATEMENT and CREATE TABLE
    -- INSERT INTO statement is used to insert new rows into a table.
    -- CREATE TABLE statement is used to create a new table.

-- Syntax:
    -- CREATE TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;

-- CREATE TABLE IF NOT EXISTS table_name
    -- table_name is the name of the table.
    -- IF NOT EXISTS is optional.
    -- IF NOT EXISTS is used to check if the table exists before creating it.
    -- IF NOT EXISTS is used to create the table if it does not exist.
    -- IF NOT EXISTS is used to skip the creation of the table if it
    -- already exists.
    -- IF NOT EXISTS is used to prevent an error if the table already exists.

-- AS
    -- AS is optional.
    -- AS is used to create a table from the result set of a SELECT statement.
    -- AS is used to create a table from the columns of another table.
    -- AS is used to create a table from the rows of another table.

-- SELECT column1, column2, column3, ...
    -- column1, column2, column3, ... are the names of the columns in the table.
    -- column1, column2, column3, ... are the names of the columns in the result set.
    -- column1, column2, column3, ... are the names of the columns in the SELECT statement.
    -- column1, column2, column3, ... are the names of the columns in the another table.
    -- column1, column2, column3, ... are the names of the columns in the table.

-- FROM another_table
    -- another_table is the name of the table to select the columns from.
    -- another_table is the name of the table to select the rows from.

-- WHERE condition
    -- the WHERE clause is optional.
    -- the WHERE clause is used to filter the rows in the another table.
    -- the WHERE clause is used to filter the rows in the table.

-- Create a table using CREATE TABLE
    -- CREATE TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    CREATE TABLE IF NOT EXISTS employees_temp
    AS
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- Insert rows into a table using INSERT INTO
    -- INSERT INTO table_name
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    INSERT INTO employees_temp
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- USE SQL UPDATE STATEMENT and CREATE TABLE
    -- UPDATE statement is used to update existing rows in a table.
    -- CREATE TABLE statement is used to create a new table.

-- Syntax:
    -- CREATE TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;

-- CREATE TABLE IF NOT EXISTS table_name
    -- table_name is the name of the table.
    -- IF NOT EXISTS is optional.
    -- IF NOT EXISTS is used to check if the table exists before creating it.
    -- IF NOT EXISTS is used to create the table if it does not exist.
    -- IF NOT EXISTS is used to skip the creation of the table if it
    -- already exists.
    -- IF NOT EXISTS is used to prevent an error if the table already exists.

-- AS
    -- AS is optional.
    -- AS is used to create a table from the result set of a SELECT statement.
    -- AS is used to create a table from the columns of another table.
    -- AS is used to create a table from the rows of another table.

-- SELECT column1, column2, column3, ...
    -- column1, column2, column3, ... are the names of the columns in the table.
    -- column1, column2, column3, ... are the names of the columns in the result set.
    -- column1, column2, column3, ... are the names of the columns in the SELECT statement.
    -- column1, column2, column3, ... are the names of the columns in the another table.
    -- column1, column2, column3, ... are the names of the columns in the table.

-- FROM another_table
    -- another_table is the name of the table to select the columns from.
    -- another_table is the name of the table to select the rows from.

-- WHERE condition
    -- the WHERE clause is optional.
    -- the WHERE clause is used to filter the rows in the another table.
    -- the WHERE clause is used to filter the rows in the table.

-- Create a table using CREATE TABLE
    -- CREATE TABLE IF NOT EXISTS table_name
    -- AS
    -- SELECT column1, column2, column3, ...
    -- FROM another_table
    -- WHERE condition;
    CREATE TABLE IF NOT EXISTS employees_temp
    AS
    SELECT employeeNumber, lastName, firstName, extension, email, jobTitle, officeCode, reportsTo, VacationHours
    FROM employees
    WHERE employeeNumber = 1056;

-- Update rows in a table using UPDATE
    -- UPDATE table_name
    -- SET column1 = value1, column2 = value2, ...
    -- WHERE condition;
    UPDATE employees_temp
    SET reportsTo = 1143
    WHERE employeeNumber = 1056;