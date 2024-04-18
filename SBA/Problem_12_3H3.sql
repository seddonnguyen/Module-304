/*
12. 3H3: List faculty name and the average progress of their all their courses.

Write queries that return the following resultsets:

Faculty are awarded bonuses based on the progress made by students in their courses.

Write a query that outputs the faculty First Name, Last Name, and the Average Progress made over all of their courses.
The Average Progress displayed should be rounded to one decimal place.
The output should be sorted by Average Progress in descending order, then by First Name in ascending order, then by Last Name in ascending order.
*/

SELECT f.firstName, f.lastName, ROUND(AVG(sc.progress), 1) AS Average_Progress
FROM facultycourse fc
    JOIN faculty f ON f.id = fc.facultyId
    JOIN studentcourse sc ON sc.courseId = fc.courseId
GROUP BY 1, 2
ORDER BY 3 DESC, 1, 2;