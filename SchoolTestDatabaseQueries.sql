-- SELECT: it's selectiong data from a table and that is exactly what the query looks like
-- * = select all columns
SELECT * FROM Students
--Result: grid ctrl+d(default) or ctrl+t text or ctrl+f rpt file
--and next click to execute or f5

--Select two columns
SELECT firstname, lastname, enrollmentdate from Students

SELECT firstname as 'First Name',  -- 'First Name'= alias
lastname [Last Name],  -- [Last Name] = alias
enrollmentdate [Enrollment Date] 
from Students

SELECT * FROM Courses

SELECT firstname,
lastname,
enrollmentdate
FROM Students
--adding the condition that is hinged on the column
WHERE lastname = 'test'

SELECT firstname [First Name],
lastname [Last Name],
dateOfBirth [Date of birth]
FROM Students
--wild card = like
WHERE lastname like 'test%'

SELECT firstname [First Name],
lastname [Last Name],
dateOfBirth [Date of birth]
FROM Students
--wild card = like
WHERE firstname like '%Student%'

--Retrieve only Full Names of Students ad their enrollment dates
SELECT firstname [First Name],
lastname [Last Name],
enrollmentDate [Enrollment Date]
FROM Students

--add new two columns
SELECT firstname [First Name], lastname [Last Name], 1 [Random number], 'Hello student',
enrollmentDate [Enrollment Date]
FROM Students

--concatenate first and last name
SELECT firstname [First Name], lastname [Last Name], firstname+' '+lastname [Full Name],
enrollmentDate [Enrollment Date]
FROM Students

SELECT firstname+' '+lastname [Full Name],
enrollmentDate [Enrollment Date]
FROM Students

SELECT *
FROM Courses

--Select Course with the highest number of credits
SELECT MAX(numberOfCredits)
FROM Courses

--Select Courses with the number of credits greater than 2
SELECT title [Title], numberOfCredits [Number of credits], courseCode [Course code]
FROM Courses
WHERE numberOfCredits > 2

--Select Course with the number of credits 3 and less
SELECT title [Title], numberOfCredits [Number of credits], courseCode [Course code]
FROM Courses

--Update all enrollment date that are empty (null)
--Update specific records using a condition
UPDATE Students SET enrollmentDate = '2019-05-01'
--condition = null
WHERE enrollmentDate is null

--Update alla enrollment dates
--Update multiple records (be careful)
UPDATE Students SET enrollmentDate ='2019-06-10'

--Update students with ids 7 & 11. Change first and last names
--Update multiple columns
UPDATE Students SET firstname = 'Luigi', lastname ='Verdi'
WHERE id = 7
UPDATE Students SET firstname = 'Fabio', lastname ='Fognini'
WHERE id = 11

--Delete student with id 1
DELETE FROM Students 
WHERE id = 1


--delete student named Luigi Verdi
DELETE FROM Students
WHERE firstname+' '+lastname = 'Luigi Verdi'
--another way is this: 
DELETE FROM Students
WHERE firstname = 'Luigi' AND lastname = 'Verdi'

--Delete all students with names containing the word 'student'
DELETE FROM Students
WHERE firstname like 'student%'

Select * from Teachers
Select * from Courses
Select * from Students

Select * from Enrollments

-- Joins: what the two or more tables have in common 
-- Inner join 
select * from Enrollments
inner join Teachers on Teachers.id = Enrollments.teacherId
inner join Students on Students.id = Enrollments.studentId
inner join Courses on Courses.id = Enrollments.courseId

--we're going to select the specific column that we actually
--want for our report
-- we will want to see the details of teacher 1
-- on all the courses.
select 
	t.firstname [Teacher Firstname],
	t.lastname [Teacher Lastname],
	s.firstname [Student Firstname],
	s.lastname [Student Lastname],
	c.title [Course Title],
	c.courseCode [Course Code]
from Enrollments as e 
inner join Teachers as t on t.id = e.teacherId
inner join Students as s on s.id = e.studentId
inner join Courses as c on c.id = e.courseId
-- we looked at filtering on our weird queries and the condition
-- would be it could be that the lecturers firstname is maybe Gina
where t.id = 1
-- we want to order by course title
order by c.title

-- left, right, full join
--only select records that have that meet the condition.
--Records that do not meet the condition will not be returnedin the result set.
--inner : intesection every teachers who have courses and students
select * from Enrollments as e 
inner join Teachers as t on e.teacherId = t.id

--Will select alla values in the 'left table', whether or not they meet the condition.
--Be sure to scructure the query correctly to bring back the records that you are 
--interested in.
--Maybe the administration wants to see how many students have 
--enrolled in that class regardless of if they have a lecture or not.
select * from Enrollments as e 
left join Teachers as t on e.teacherId = t.id

select * from Enrollments as e 
right join Teachers as t on e.teacherId = t.id
select * from Enrollments

--full join
select * from Enrollments as e 
full join Teachers as t on e.teacherId = t.id

--Distinct: I'm about to select I will look or only unique rules.
select teacherId, courseId from Enrollments
--Distinct eliminated all of those repeating the rules
select distinct teacherId, courseId from Enrollments

--Group by is every column that is being reverenced needs
-- to be included in the group by
select teacherId, studentId, courseId from Enrollments 
where teacherId = 1

select teacherId, studentId, courseId from Enrollments 
where teacherId = 1
group by teacherId, studentId, courseId

select teacherId, courseId from Enrollments
where teacherId = 1
group by teacherId, courseId

select teacherId, studentId from Enrollments
where teacherId = 1
group by teacherId, studentId

--group by + inner join
select 
	teacherId, 
	t.firstname + ' ' + t.lastname [Teacher Name],
	studentId,
	s.firstname + ' ' + s.lastname [Student Name]	
from Enrollments as e
inner join Teachers as t on t.id = teacherId
inner join Students as s on s.id = studentId
where teacherId = 1
group by teacherId, t.firstname, t.lastname, studentId, s.firstname, s.lastname

select 
	teacherId, 
	t.firstname + ' ' + t.lastname [Teacher Name],
	courseId,
	c.title,
	c.courseCode
from Enrollments as e
inner join Teachers as t on t.id = teacherId
inner join Courses as c on c.id = courseId
where teacherId = 1
group by teacherId, t.firstname, t.lastname, courseId, c.title, c.courseCode

-- AVG 
select courseId, avg(grade) from Enrollments
where courseId = 5
group by courseId

--all the courses
select courseId, avg(grade) from Enrollments
group by courseId

select courseId, avg(grade) from Enrollments
--Error!Use having
--where AVG(Grade) is not null
group by courseId
having AVG(grade) is not null
order by AVG(grade)

select courseId, avg(grade) from Enrollments
group by courseId
having AVG(Grade) > 70
order by AVG(Grade)

--Bring back the number of student enrolled per course
select c.courseCode [Course Code], c.title, COUNT(studentId) [Student's number]
from Enrollments as e
inner join Courses as c on c.id = e.courseId
group by c.courseCode, c.title

select courseId, COUNT(studentId) from Enrollments
group by courseId

--Bring back the highest and lowest grade for each courses
select courseId, Max(grade) from Enrollments
where grade is not null
group by courseId

select courseId, Min(grade) from Enrollments
where grade is not null
group by courseId

--bring back the total numer of credits that each student is doing
select
SUM(c.numberOfCredits) [Number of credits],
s.firstname + ' ' + s.lastname [Student Name]
from Enrollments as e
inner join Students s on e.studentId = s.id
inner join Courses c on c.id = e.courseId
group by s.firstname, s.lastname
