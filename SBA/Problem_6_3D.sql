/*
6. 3D: Lists total # of students enrolled each year

Write queries that return the following resultsets:

The enrollment team is gathering analytics about student enrollment throughout the years.

Write a query that lists the Total Number of Students that were enrolled in classes during each School Year.
The first column should have the header "Students". Provide a second "Year" column showing the enrollment year.
The output should be sorted first by the School Year in ascending order, then by Total Number of Students in descending order.
*/

SELECT COUNT(DISTINCT studentId) AS Students, YEAR(startDate) AS Year
FROM studentcourse
GROUP BY 2
ORDER BY 2, 1 DESC;