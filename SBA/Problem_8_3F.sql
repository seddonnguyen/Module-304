/*
8. 3F: List students Name and # of Courses in their major

Write queries that return the following resultsets:

Students are required to take 4 courses, and at least two of these courses must be from the department of their major.

Write a query to list students' First Name, Last Name, and Number of Courses they are taking in their major department.
The output should be sorted first by the Number of Courses in descending order, then by First Name in ascending order, then by the Last Name in ascending order.
*/

SELECT s.firstname, s.lastname, COUNT(sc.courseId) AS Number_of_Courses
FROM studentcourse sc
    JOIN student s ON s.id = sc.studentId
    JOIN course c ON c.id = sc.courseId
WHERE s.majorId = c.deptId
GROUP BY sc.studentId
ORDER BY 3 DESC, 1, 2;