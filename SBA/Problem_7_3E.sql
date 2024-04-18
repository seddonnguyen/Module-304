/*
7. 3E: lists Start Date and # of Students enrolled in August of each year

Write queries that return the following resultsets:

The enrollment team is gathering analytics about student enrollment and they now want to know about August admissions specifically.

Write a query that lists the Start Date and Total Number of Students who enrolled in classes in August of each year.
The output should be ordered first by Start Date in ascending order and then by Total Number of Students in ascending order.
*/

SELECT sc.startdate AS Start_Date, COUNT(DISTINCT sc.studentid) AS Total_Number_of_Students
FROM studentcourse sc
WHERE MONTH(sc.startdate) = 8
GROUP BY 1
ORDER BY 1, 2;