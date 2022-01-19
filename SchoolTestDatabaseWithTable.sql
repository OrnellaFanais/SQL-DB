-- Create a database
CREATE DATABASE school_test

USE school_test;

-- Create a table
-- The name of the table is pluralise because the table is going to be
-- storing records for students
CREATE TABLE Students(
	-- columns that you wants to create
	-- column name (id) datatype (int) attribute(primary key, not null,
	-- allow it to count automatically (IDENTITY(1,1) the first 1 is the
	-- first one record and the second one value is the increment by 1))
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	lastname NVARCHAR(50) NOT NULL,
	firstname NVARCHAR(50) NOT NULL,
	dateOfBirth DATETIME NOT NULL,
	enrollmentDate DATETIME
);

CREATE TABLE Courses(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	title NVARCHAR(50) NOT NULL,
	numberOfCredits int,
	--Example courseCode: CS201
	courseCode NVARCHAR(5) NOT NULL
);

CREATE TABLE Teachers(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	lastname NVARCHAR(50) NULL,
	firstname NVARCHAR(50) NULL,
	dateJoined DATE NULL,
);

CREATE TABLE Enrollments(
	id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	teacherId int,
	studentId int,
	courseId int,
	grade float null
	CONSTRAINT [FK_Enrollments_Students] FOREIGN KEY ([studentId]) 
        REFERENCES Students(id),
		CONSTRAINT [FK_Enrollments_Teachers] FOREIGN KEY ([teacherId]) 
        REFERENCES Teachers(id),
	CONSTRAINT [FK_Enrollments_Courses] FOREIGN KEY ([courseId]) 
        REFERENCES Courses(id)
);