USE classicmodels;

# Problem 1:
/*
Write a query to display each customer’s name (as “Customer Name”), along with the name of the employee who is responsible for that customer’s orders.
The employee name should be in a single “Sales Rep” column, formatted as “lastName, firstName.”
The output should be sorted alphabetically by customer name. 
*/

SELECT c.customerName                        AS 'Customer Name',
       CONCAT(e.lastName, ', ', e.firstName) AS 'Sales Rep'
FROM customers c
         JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
ORDER BY c.customerName;

# Problem 2:
/*
To determine which products are the most popular with our customers.
For each product, list the total quantity ordered, along with the total sale generated (total quantity ordered * priceEach) for that product.
The column headers should be “Product Name,” “Total # Ordered,” and “Total Sale.”
List the products by “Total Sale” descending.
*/

SELECT p.productName                          AS 'Product Name',
       SUM(od.quantityOrdered)                AS 'Total # Ordered',
       SUM(od.quantityOrdered * od.priceEach) AS 'Total Sale'
FROM products p
         JOIN orderdetails od USING (productCode)
GROUP BY p.productName, p.buyPrice
ORDER BY 3 DESC;

# Problem 3:
/*
Write a query that lists order status and the number of orders with that status.
Column headers should be “Order Status” and “Total Orders.”
Sort alphabetically by status.
*/

SELECT status        AS 'Order Status',
       COUNT(status) AS 'Total Orders'
FROM orders
GROUP BY status
ORDER BY status;

# Problem 4:
/*
Write a query to list, for each product line, the total number of products sold from that product line.
The first column should be “Product Line” and the second should be “total Sold.”
Order by the second column, descending.
*/

SELECT p.productLine           AS 'Product Line',
       SUM(od.quantityOrdered) AS 'total Sold'
FROM products p
         JOIN orderdetails od USING (productCode)
GROUP BY p.productLine
ORDER BY 2 DESC;


# Problem 5:
/*
Your product team is requesting data to help them create a bar chart of monthly sales made since the company’s inception.
Write a query to output the month (January, February, etc.), 4-digit year, and total sales for each month.
The first column should be labeled ‘Month,’ the second column should be labeled ‘Year,’ and the third column should be labeled ‘Payments Received.’
Values in the third column should be formatted as numbers with two decimals (e.g., 694,292.68).
*/
SELECT MONTHNAME(paymentDate) AS 'Month',
       YEAR(paymentDate)      AS 'Year',
       FORMAT(SUM(amount), 2) AS 'Payments Received'
FROM payments
GROUP BY 2, 1
ORDER BY 2, 1;

# Problem 6:
/*
Write a query to display the Name, Product Line, Scale, and Vendor of all of the Car products — both classic and vintage.
The output should display all vintage cars first (sorted alphabetically by name), and all classic cars last (also sorted alphabetically by name).
*/
SELECT p.productName as Name,
       p.productLine as 'Product Line',
       p.productScale as Scale,
       p.productVendor as Vendor
FROM productlines pl
         JOIN products p USING (productLine)
WHERE p.productLine IN ('Classic Cars', 'Vintage Cars')
ORDER BY p.productLine DESC, p.productName;