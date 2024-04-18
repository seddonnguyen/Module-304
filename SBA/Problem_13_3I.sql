/*
13. 3I: Min & Max Grades

Write queries that return the following resultsets:

Students are awarded two grades based on the minimum and maximum progress they are making in their courses.

The grading scale is as follows:
Progress < 40: F
Progress < 50: D
Progress < 60: C
Progress < 70: B
Progress >= 70: A

Write a query that displays each student's First Name, Last Name, Minimum Grade based on their minimum progress, and Maximum Grade based on their maximum progress.
The output should be sorted by Minimum Grade in descending order, then by Maximum Grade in descending order, then by First Name in ascending order, then by Last Name in ascending order
*/

SELECT s.firstName,
       s.lastName,
       CASE
           WHEN sc.minProgress < 40 THEN 'F'
           WHEN sc.minProgress < 50 THEN 'D'
           WHEN sc.minProgress < 60 THEN 'C'
           WHEN sc.minProgress < 70 THEN 'B'
           ELSE 'A'
           END AS Minimun_Grade,
       CASE
           WHEN sc.maxProgress < 40 THEN 'F'
           WHEN sc.maxProgress < 50 THEN 'D'
           WHEN sc.maxProgress < 60 THEN 'C'
           WHEN sc.maxProgress < 70 THEN 'B'
           ELSE 'A'
           END AS Maximum_Grade
FROM student s
    JOIN (SELECT sc.studentId, MIN(sc.progress) AS minProgress, MAX(sc.progress) AS maxProgress
          FROM studentcourse sc
          GROUP BY sc.studentId) AS sc ON sc.studentId = s.id
ORDER BY 3 DESC, 4 DESC, 1, 2;