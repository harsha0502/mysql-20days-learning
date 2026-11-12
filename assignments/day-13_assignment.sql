use assignments;
show tables;

/*
1. List all students with the courses they are enrolled in.
2.Show course names along with student names.
3.Get names of students enrolled in "Physics".
4.List all students with their courses, if enrolled.
5.Show all courses and the students who enrolled, even if none.
6.Display all students with course details, even if some courses have no enrollments.
7.List all students and all courses, even if there is no match (simulate FULL JOIN).
8.Show pairs of students who have the same age.
9.Count how many students are enrolled in each course.
Q10. Show the number of courses each student is enrolled in.
Q11. List all students and their courses ordered by student name.
Q12. Show student names and course names ordered by course name.
Q13. Show only courses with more than one student enrolled.
Q14. List students enrolled in more than one course.
Q15. Display student names and count of enrollments, ordered

*/

-- 1
SELECT s.name, c.course_name
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id;

-- 2
SELECT  c.course_name, s.name
FROM courses c
INNER JOIN Enrollments e
ON c.course_id = e.course_id
INNER JOIN students s
ON s.student_id = e.student_id;

-- 3
SELECT s.name
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id
where c.course_name = 'Physics';

-- 4
select s.name, c.course_name
from students s
inner join enrollments e
on s.student_id = e.student_id
inner join courses c
on e.course_id = c.course_id;