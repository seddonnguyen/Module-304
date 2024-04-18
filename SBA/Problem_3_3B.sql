/*
3. 3B: Lists course and number of students in that course

Write queries that return the following resultsets:

The recruiting department needs to know which courses are most popular with the students.

Please provide them with a query which lists the name of each course and the number of students in that course.
The output should be sorted by the Number of Students in descending order, then by Course Name in ascending order.
*/

SELECT c.name AS Course_Name, COUNT(s.id) AS Number_of_Students
FROM course c
    JOIN studentcourse sc ON c.id = sc.courseId
    JOIN student s ON s.id = sc.studentId
GROUP BY 1
ORDER BY 2 DESC, 1;