USE classicmodels;

SELECT c.customerNumber,
       c.customerName,
       o.orderNumber,
       o.orderDate,
       od.productCode,
       p.productName,
       priceEach                   AS price,
       quantityOrdered             AS quantity,
       priceEach * quantityOrdered AS total
FROM customers c
         JOIN orders o
              USING (customerNumber)
         JOIN orderdetails od
              USING (orderNumber)
         JOIN products p
              USING (productCode)
GROUP BY c.customerNumber, o.orderDate, o.orderNumber, od.productCode
ORDER BY c.customerNumber, o.orderDate DESC, o.orderNumber, od.productCode;