--Entering a records
insert into Students([lastname],[firstname],[dateOfBirth],[enrollmentDate])
values('Rossi','Mario','1990-01-15','2021-05-01')

--Error!
--insert into Students([lastname],[firstname],[dateOfBirth],[enrollmentDate])
--values('Jane','Doe','1992-03-10')

insert into Students([lastname],[firstname],[dateOfBirth],[enrollmentDate])
values('Jane','Doe','1992-03-10',null)

insert into Students([lastname],[firstname],[dateOfBirth])
values('Maria','Rossi','1986-04-05')

--multiple records in one statements:
insert into Students([lastname],[firstname],[dateOfBirth],[enrollmentDate])
values
	('Test','Student','2001-09-08',null),
	--duplicate line (ctrl+c+v)
	('Test1','Student11','2000-01-08','2019-03-05'),
	('Test2','Student2','2000-02-08',null),
	('Test3','Student3','2000-03-08','2019-03-05'),
	('Test4','Student4','2000-04-08',null),
	('Test5','Student5','2000-05-08',null),
	('Test6','Student6','2000-06-08','2019-03-05')

insert into Students([lastname],[firstname],[dateOfBirth],[enrollmentDate])
values
	('Sinner','Yannik','1998-01-09','2015-12-05'),
	('Berrettini','Matteo','1996-03-11','2014-10-05'),
	('Fan','Ornella','1986-04-13','2015-07-01'),
	('Halep','Simona','1990-04-11','2021-04-01'),
	('Dokic','Helena','1987-08-01','2021-05-01'),
	('Serena','Williams','1984-08-10','2021-06-02'),
	('Venus','Williams','1982-08-11','2021-07-03')


insert into Students([lastname],[firstname],[dateOfBirth],[enrollmentDate])
values('Pini','Peppino','1995-01-15','2019-06-10')

--multiple records in one statements:
insert into Courses([title],[numberOfCredits],[courseCode])
values	
	('Computer science',12,'CS201'),	
	('Electric cars',6,'EX101'),
	('Project Management',10,'PM301'),
	('Aeronautical Engineering',4,'AE101')

insert into Courses([title],[numberOfCredits],[courseCode])
values	
	('Fluid Mechanics',3,'FM201'),	
	('Thermodynamics',2,'TH101'),
	('Basics of Robotics',1,'RB101'),
	('Basics of Deep Learning',1,'DL101'),
	('Deep Reinforcement Learning',null,'RL101')

insert into Teachers([lastname],[firstname],[dateJoined])
values	
	('Gini','Gina','2017-03-01'),	
	('Gianin','Gino','2008-04-01'),	
	('Pini','Pino','2021-05-01')

insert into Teachers([lastname],[firstname],[dateJoined])
values	
	('Tsispas','Stephanos','2022-01-15'),	
	('Raducanu','Emma','2022-01-10'),	
	('Ymer','Elias','2021-09-21')

insert into Enrollments([teacherId], [studentId], [courseId],[grade])
values	
	(1,null,3,87),	
	(1,null,7,45),	
	(1,null,8,90.7)

insert into Enrollments([teacherId], [studentId], [courseId],[grade])
values	
	(null,20,4,100),	
	(null,20,5,35.8),	
	(null,21,6,45),
	(null,21,4,87),
	(null,21,5,null),
	(null,20,6,null),
	(null,null,2,null),
	(null,22,2,null)
