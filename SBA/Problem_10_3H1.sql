/*
10. 3H1: list Course Name and Students Average

Write queries that return the following resultsets:

Faculty are awarded bonuses based on the progress made by students in their courses.

Write a query to list each Course Name and the Average Progress of students in that course.
The Average Progress displayed should be rounded to one decimal place.
The output should be sorted first by Average Progress in descending order, then by Course Name in ascending order.
*/

SELECT c.name AS Course_Name, ROUND(AVG(sc.progress), 1) AS Average_Progress
FROM studentcourse sc
    JOIN course c ON c.id = sc.courseId
GROUP BY 1
ORDER BY 2 DESC, 1;