/*
2. 3A: Lists number of courses of each department.

Write queries that return the following result sets:

The Curriculum Planning Committee is attempting to fill in gaps in the current course offerings.

You need to provide them with a query which lists each department and the number of courses offered by that department.
The output should be sorted first by the Number of Courses in ascending order, then by Department Name in ascending order.
*/

SELECT d.name AS Department_Name, COUNT(c.id) AS Number_of_Courses
FROM department d
    JOIN course c ON d.id = c.deptId
GROUP BY 1
ORDER BY 2, 1;