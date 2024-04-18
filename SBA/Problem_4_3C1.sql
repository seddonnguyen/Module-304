/*
4. 3C1: List courses without faculty.

Write queries that return the following resultsets:

Quite a few students have been complaining that the professors are absent from some of their courses.

Write a query to list the names of all Courses where the number of faculty assigned to those courses is zero.
The output should be sorted by Course Name in ascending alphabetical order.
*/

SELECT c.name AS Course_Name
FROM facultycourse f
    RIGHT JOIN course c ON c.id = f.courseId
WHERE f.facultyId IS NULL
ORDER BY 1;