/*
9. 3G: List Name and Average of students with less than 50%

Write queries that return the following resultsets:

Students making average progress in their courses of less than 50% need to be offered tutoring assistance.

Write a query to list First Name, Last Name, and Average Progress of all students achieving average progress of less than 50%.
The Average Progress displayed should be rounded to one decimal place.
The output should be sorted first by Average Progress in descending order, then by First Name in ascending order, then by the Last Name in ascending order.
*/

SELECT s.firstName,
       s.lastName,
       ROUND(AVG(sc.progress), 1) AS Average_Progress
FROM student s
    JOIN studentcourse sc ON sc.studentId = s.id
GROUP BY s.id
HAVING average_progress < 50
ORDER BY 3 DESC, 1, 2;