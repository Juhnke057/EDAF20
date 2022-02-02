use hbg14;

select * FROM Students;
-- D3
-- a
select firstName, lastName
from Students;
-- b
select firstName, lastName
from Students
order by lastName;
-- c
select *
from Students
where pNBR
like '75%';
-- d
select COUNT(*)
from Students 
where mod(substring(pNBR,10,1),2)=0;
-- e
select COUNT(*)
from Students;
-- f
select *
from Courses
where CourseCode
like 'FMA%';
-- g
select *
from Courses
where Credits>5;
-- h
select CourseCode
from TakenCourses
where pNbr = '790101-1234';
-- i
select courseName, Credits
from Courses
join TakenCourses
on Courses.CourseCode=TakenCourses.CourseCode
where pnbr = '790101-1234';
-- j
select sum(credits)
from Courses
join TakenCourses
on Courses.CourseCode=TakenCourses.CourseCode
where pnbr = '790101-1234';
-- k
select avg(grade)
from TakenCourses
join Courses
on Courses.CourseCode=TakenCourses.CourseCode
where pNbr = '790101-1234';
-- lh
select CourseCode 
from TakenCourses
join Students
on TakenCourses.pNbr = Students.pNbr
where Students.firstName = 'Eva' and Students.lastName = 'Alm';
-- li
SELECT CourseName, credits
FROM Courses
JOIN TakenCourses 
ON Courses.courseCode = TakenCourses.courseCode
JOIN Students 
ON TakenCourses.pNbr = Students.pNbr
WHERE Students.firstName = 'Eva' AND Students.lastName = 'Alm';
-- lj
select sum(credits)
from Courses
join TakenCourses
on Courses.CourseCode=TakenCourses.courseCode
join Students
on TakenCourses.pNbr=Students.pNbr
WHERE Students.firstName = 'Eva' AND Students.lastName = 'Alm';
-- lk
select avg(grade)
from TakenCourses
join Students
on TakenCourses.pNbr=Students.pNbr
WHERE Students.firstName = 'Eva' AND Students.lastName = 'Alm';
-- m
select firstname, lastname
from Students
where pNbr not in(
select pNbr
from TakenCourses);
-- n
create or replace view avarageGrade as
select pNbr, avg(grade) as avg
from TakenCourses
group by pNbr;
select *
from averageGrade
where avg =(
select MAX(avg)
from averageGrade);
-- o
select Students.pNbr, sum(credits)
from Students
left join TakenCourses on TakenCourses.pNbr = Students.pNbr
left join Courses on Courses.courseCode = TakenCourses.courseCode
group by Students.pNbr;
-- p
select Students.firstName, Students.lastName, sum(credits)
from Students
left join TakenCourses on TakenCourses.pNbr = Students.pNbr
left join Courses on Courses.courseCode = TakenCourses.courseCode
group by Students.lastName;
-- q
select firstName, lastName, count(*)
from Students
group by firstName, lastName
having count(*)>1;
