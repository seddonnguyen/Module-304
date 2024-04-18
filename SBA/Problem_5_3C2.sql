/*
5. 3C2: List # of students in courses without faculty.

Write queries that return the following resultsets:

Quite a few students have been complaining that the professors are absent from some of their courses.

Write a query to list the Course Names and the Number of Students in those courses for all courses where there are no assigned faculty.
The output should be sorted first by the Number of Students in descending order, then by Course Name in ascending order.
*/

SELECT c.name AS Course_Name, COUNT(sc.studentId) AS Number_of_Students
FROM studentcourse sc
    JOIN      course c ON c.id = sc.courseId
    LEFT JOIN facultycourse f ON f.courseId = c.id
WHERE f.facultyId IS NULL
GROUP BY 1
ORDER BY 2 DESC, 1;