USE Banking;

# Problem 1:
/*
 For each product, show the product name "Product" and the product type name "Type."
*/
SELECT p.NAME AS Product, pt.NAME AS Type
FROM product p
INNER JOIN product_type pt USING(PRODUCT_TYPE_CD);

# Problem 2:
/*
 For each branch, list the branch name and city, plus the last name and title of each employee who works in that branch.
*/
SELECT b.NAME AS Branch, b.CITY, e.LAST_NAME, e.TITLE
FROM branch b
INNER JOIN employee e ON b.BRANCH_ID = e.ASSIGNED_BRANCH_ID;

# Problem 3:
/*
 Show a list of each unique employee title.
*/
SELECT DISTINCT TITLE
FROM employee;

# Problem 4:
/*
 Show the last name and title of each employee, along with the last name and title of that employee's boss.
*/
SELECT e.LAST_NAME as Name, e.TITLE as Title, boss.LAST_NAME AS 'Boss Name', boss.TITLE AS 'Boss Title'
FROM employee e
LEFT JOIN employee boss ON e.SUPERIOR_EMP_ID = boss.EMP_ID;

# Problem 5:
/*
 For each account, show the name of the account's product, the available balance, and the customer's last name.
*/
SELECT p.NAME AS Product, a.AVAIL_BALANCE, i.LAST_NAME
FROM account a
INNER JOIN product p USING(PRODUCT_CD)
LEFT JOIN customer c USING(CUST_ID)
LEFT JOIN INDIVIDUAL i USING(CUST_ID);

# Problem 6:
/*
 List all account transaction details for individual customers whose last name starts with 'T'.
*/
# RLIKE is used to match the regular expression
SELECT ac.*, i.LAST_NAME
FROM ACC_TRANSACTION ac
INNER JOIN ACCOUNT a USING(ACCOUNT_ID)
INNER JOIN CUSTOMER c USING(CUST_ID)
INNER JOIN INDIVIDUAL i USING(CUST_ID)
WHERE i.LAST_NAME RLIKE 'T.*';