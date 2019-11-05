CREATE DATABASE UniversityDatabase
GO

USE UniversityDatabase;
GO

CREATE TABLE Department (
    DepartmentId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);
GO

-- Create the Employee table
CREATE TABLE Student (
    EmployeeId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES Department(DepartmentId)
);
GO

-- Insert sample data in Department table
INSERT INTO Department VALUES 
	('Education'),
	('Science'),
	('Marketing');
GO

-- Insert sample data in Employee table
INSERT INTO Student VALUES 
	('Ahmed',	1),
	('Omar',	1),
	('Said',	2),
	('Zaid',	3);
GO
