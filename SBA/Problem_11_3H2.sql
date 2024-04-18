/*
11. 3H2: Course with the highest Average Progress

Write queries that return the following resultsets:

Faculty are awarded bonuses based on the progress made by students in their courses.

Write a query that shows the Course Name and the Average Student Progress of the Course with the highest Average Progress in the system.
The Average Progress displayed should be rounded to one decimal place.
*/

SELECT c.name AS Course_Name, ROUND(AVG(sc.progress), 1) AS Average_Progress
FROM studentcourse sc
    JOIN course c ON c.id = sc.courseId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;