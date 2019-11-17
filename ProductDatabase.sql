CREATE DATABASE ProductDatabase;
GO

USE ProductDatabase;
GO

CREATE TABLE Category(
	CategoryId INT PRIMARY KEY,
	[Name] NVARCHAR(max)
);
GO

CREATE TABLE Product(
	ProductId INT PRIMARY KEY,
	[Name] NVARCHAR(max),
	Price DECIMAL(10,2),
	Quantity INT,
	OrderDate DATETIME2,
	Discount INT,
	Color NVARCHAR(max),
	IsChecked BIT,
	CategoryId INT,
	CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);
GO

INSERT INTO Category VALUES 
(101, 'Fruit'), (102, 'Vegetable');
GO

INSERT INTO Product VALUES
(201, 'Banana', 4.00,  30,	'2019-10-1', 10,	'Yellow',	1, 101),
(202, 'Pear',	8.00,  10,	'2019-11-1',  0,	'Green',	0, 101),
(203, 'Apple',	5.00,  50,	'2019-11-2',  5,	'Red',		1, 101),
(204, 'Orange', 6.00,  60,	'2019-11-5',  5,	'Orange',	0, 101),
(205, 'Lettuce',9.00, 100,	'2019-11-2',  0,	'Green',	1, 102),
(206, 'Tomato',	5.00,  50,	'2019-11-8',  0,	'Red',		0, 102),
(207, 'Potato',	2.00, 200,	'2019-11-9',  1,	'White',	1, 102);
GO
