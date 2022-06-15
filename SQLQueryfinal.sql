CREATE DATABASE Employee;

CREATE TABLE Employee3 (
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Sex char,
ActiveStatus BIT,
Salary int,
Designation varchar(50),
Age int

);

INSERT INTO Employee3
VALUES
('1','Iron','Maiden','M','1','20000','Software Developer','23'),
('2','Ananya','Singh','F','0','15000','Manager','40'),
('3','Ram','Das','M','1','30000','Manager','34'),
('4','Alice','North','F','0','25000','HR','29');

SELECT FirstName,LastName,Designation
FROM Employee3

SELECT DISTINCT Designation
FROM Employee3;


SELECT Salary FROM Employee3
WHERE Salary<20000;


SELECT Salary,Age FROM Employee3
WHERE Salary>20000 AND Age<35;

SELECT* FROM Employee3
WHERE Salary>10000 AND Designation='HR';

SELECT Salary FROM Employee3
ORDER BY Salary DESC;

UPDATE Employee3
SET Designation = 'Manager', Salary = '50000'
WHERE Salary>20000;

DELETE FROM Employee3
WHERE Designation = 'Manager' AND Salary>10000;

SELECT TOP 3 * FROM Employee3;

SELECT Salary FROM Employee3
WHERE FirstName = 'Iron';

SELECT * FROM Employee3;

CREATE TABLE Department(
department varchar(100),
EmployeeID int
);

INSERT INTO Department
VALUES
('Management','1'),
('Customer Service','2'),
('Hardware','3'),
('Software','4');

SELECT *
FROM Employee3
LEFT JOIN Department
ON Employee3.EmployeeID = Department.EmployeeID;

SELECT *
FROM Employee3
RIGHT JOIN Department
ON Employee3.EmployeeID = Department.EmployeeID

SELECT *
FROM Employee3
FULL OUTER JOIN Department
ON Employee3.EmployeeID = Department.EmployeeID;

CREATE TABLE ABC(
Name varchar(50)
);

INSERT INTO ABC
VALUES 
('Nandini'),
('Parnika');

CREATE TABLE LMN(
Name varchar(50)
);

INSERT INTO LMN
VALUES
('Shruti'),
('Anushka');

CREATE TABLE XYZ(
Name varchar(50)
);

INSERT INTO XYZ
VALUES
('Aditya'),
('Ishank');

SELECT * FROM ABC
UNION SELECT * FROM LMN
UNION SELECT * FROM XYZ

SELECT Designation
FROM Employee3
GROUP BY Designation;

CREATE TABLE OrderTable(
OrderID int,
orderDate date,
orderno int,
customername varchar(50)
);

INSERT INTO OrderTable
VALUES
('1','2020-06-02','2300','Sahil'),
('2','2020-06-04','4500','Aman'),
('3','2020-05-23','340','Isha'),
('4','2020-06-12','120','Ananya');

Select  customername
from OrderTable
where orderno<2000;

SELECT * INTO Employee_Backup
FROM Employee3;

CREATE TABLE NewEmployee(
ID int NOT NULL UNIQUE,
FirstName varchar(50) NOT NULL,
age int,
CHECK (age>=10),
city varchar(100) DEFAULT 'Delhi',
PRIMARY KEY(ID)
);

CREATE UNIQUE INDEX inx
ON Employee3 (FirstName , LastName);

CREATE TABLE Managers(
salary int,
datejoin date,
FName varchar(60),
);

INSERT INTO Managers
VALUES
('70000','2022-06-07','Nandini'),
('50000','2022-04-05','Anushka'),
('65000','2022-05-03','Shruti');

CREATE VIEW [Manager salary] AS
SELECT datejoin , Fname
FROM Managers
WHERE salary>60000;

SELECT * FROM [Manager salary];

CREATE TABLE desig(
designation varchar(500)
);

INSERT INTO desig
VALUES
('Manager'),
('Developer');

DROP TABLE desig;

SELECT FirstName,LastName,Salary,Salary*.15 PF
FROM Employee3;

SELECT Salary,
RANK() OVER (
ORDER BY  Salary DESC
) AS Rank_sal
FROM Employee3;

WITH cte_sal (staff) AS (
SELECT 
FirstName + ' ' + LastName
FROM  Employee3
)

SELECT staff
FROM cte_sal

SELECT Salary
FROM Employee3
WHERE Salary>10000

EXCEPT 
SELECT Salary
FROM Employee3
WHERE Salary = 15000

SELECT
EmployeeID,
FirstName,
LastName,
Salary
FROM Employee3
WHERE
salary>(SELECT AVG(salary) FROM Employee3);

CREATE PROC usp_divide(
    @a decimal,
    @b decimal,
    @c decimal output
) AS
BEGIN
 BEGIN TRY
 SET @c = @a / @b;
END TRY
BEGIN CATCH
 SELECT  
            ERROR_NUMBER() AS ErrorNumber,  
			ERROR_SEVERITY() AS ErrorSeverity, 
            ERROR_STATE() AS ErrorState,  
            ERROR_PROCEDURE() AS ErrorProcedure, 
            ERROR_LINE() AS ErrorLine, 
            ERROR_MESSAGE() AS ErrorMessage;  
 END CATCH
END;
GO

DECLARE @r decimal;
EXEC usp_divide 10, 2, @r output;
PRINT @r;

CREATE TABLE employee_salarytable1(
HR int,
DA int,
basics int
);

INSERT INTO employee_salarytable1
VALUES
('1000','2000','3000'),
('2300','1500','4000'),
('1500','2340','5000');

DECLARE @HR int, @DA int, @basics int

DECLARE PrintBasics CURSOR
FOR
SELECT HR,DA,basics FROM employee_salarytable1

open PrintBasics

Fetch next from PrintBasics into
@HR,@DA,@basics


Close PrintBasics


SELECT Abs(-243.5) AS AbsNum;

SELECT COUNT(EmployeeID) AS NumberOfEmployees FROM Employee3;

SELECT ATN2(0.50, 1);

SELECT USER_NAME();

SELECT ISNUMERIC(4567);

SELECT IIF(500<1000, 'YES', 'NO');

SELECT DAY('2017/08/25') AS DayOfMonth;

SELECT ISDATE('2017-08-25');

SELECT FirstName, CAST (EmployeeID AS varchar)
EmployeeID from Employee3

CREATE TABLE products1 (
pid int,
orderp int,
orders int
);

INSERT INTO products1
VALUES
('1','1200','300'),
('2','','200'),
('3','400','300'),
('4','5000','150');

SELECT pid, orderp+orders
FROM products1

create function dbo.fn_IsLeapYear (@year int)
returns bit
as
begin
return(select case datepart(mm, dateadd(dd, 1, cast((cast(@year as varchar(4)) + '0228') as datetime)))
when 2 then 1
else 0
end)
end
go

CREATE PROCEDURE ShowInformation
AS
SELECT * FROM Employee3,Department,employee_salarytable1
GO;

EXEC ShowInformation;














