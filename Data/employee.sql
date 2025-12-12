CREATE TABLE employees (
    EmployeeID BIGINT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BirthDate DATE,
    Gender VARCHAR(10),
    HireDate DATE,
    Department VARCHAR(100),
    JobTitle VARCHAR(100),
    Salary INT,
    ManagerID BIGINT,  -- Self-referencing for hierarchical relationships
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    EmploymentType VARCHAR(50) CHECK (EmploymentType IN ('Full-Time', 'Part-Time', 'Contract')),
    Status VARCHAR(50) CHECK (Status IN ('Active', 'On Leave', 'Terminated'))
);

INSERT INTO employees (EmployeeID, FirstName, LastName, BirthDate, Gender, HireDate, Department, JobTitle, Salary, ManagerID, Email, PhoneNumber, Address, City, State, Country, EmploymentType, Status)
VALUES
(1, 'John', 'Doe', '1985-03-25', 'Male', '2015-06-01', 'Engineering', 'Software Engineer', 90000, NULL, 'john.doe@example.com', '555-1234', '123 Elm St', 'New York', 'NY', 'USA', 'Full-Time', 'Active'),
(2, 'Jane', 'Smith', '1990-07-15', 'Female', '2018-02-01', 'Marketing', 'Marketing Manager', 85000, 1, 'jane.smith@example.com', '555-5678', '456 Oak St', 'Chicago', 'IL', 'USA', 'Full-Time', 'Active'),
(3, 'Alex', 'Johnson', '1980-11-10', 'Male', '2010-04-25', 'Engineering', 'Senior Developer', 120000, 1, 'alex.johnson@example.com', '555-8765', '789 Pine St', 'Los Angeles', 'CA', 'USA', 'Full-Time', 'Active'),
(4, 'Emily', 'Davis', '1992-02-20', 'Female', '2020-05-15', 'Human Resources', 'HR Specialist', 65000, 2, 'emily.davis@example.com', '555-4321', '321 Maple St', 'San Francisco', 'CA', 'USA', 'Part-Time', 'Active'),
(5, 'Michael', 'Lee', '1983-09-30', 'Male', '2012-03-10', 'Engineering', 'Lead Engineer', 135000, 1, 'michael.lee@example.com', '555-3456', '654 Cedar St', 'Austin', 'TX', 'USA', 'Full-Time', 'On Leave'),
(6, 'Sarah', 'Martinez', '1995-01-01', 'Female', '2021-08-20', 'Sales', 'Sales Associate', 50000, 2, 'sarah.martinez@example.com', '555-6789', '987 Birch St', 'Miami', 'FL', 'USA', 'Contract', 'Active');

Select * from Department;
Select * from employees;

Select * from employees as e
Inner join Department as d 
On e.department = d.departmentID --- gives matched items

Select * from employees as e
Left join Department as d 
On e.department = d.departmentID --- gives matched items and all contains from left table
Where d.departmentID is null
-- loads out the data where right table is null

Select * from employees as e
Right join Department as d 
On e.department = d.departmentID --- gives matched items and all contains from right table
--- loads out all table

Select * from employees as e
Full join Department as d 
On e.department = d.departmentID --- gives matched items and all contains from both table

Select * from employees as e
Cross join Department as d
Order by Employee ID --- cross join muliples left table by all rows in right table

Select * from employees a
Join employees b
On a.employeeID = b. managerID


#highest salary 
Select top 1 * from employees order by salary desc

#highest salary 
Select * from employees 
Where salary=(select max(salary) from employee);

#2nd highest salary 
Select * from employees 
Where salary < (select max(salary) from employee);

#3rd highest salary 
#without windows functions
SELECT* from emplooyees
Where salary= (
	Select salary
	FROM employtees
	ORDER BY salary DESC
	OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY
	)

#with windows functions

With rankingsalary(
SELECT rank() over(order by salary desc) as rankingEmployees,* from employees
)
SELECT 8 from ranking salary
Where rankingEmployess =3

#Efficient depends on - query execution plan

#Subquery

#common table expression CTE

#Windows Functions


--row_number() or rank or dense rank() or avg,sum over(partitioon by column name order by column name asc|desc )
Select row_number() over(partition by dept order by salary) as rn, -- creates rownumber
rank() over(partition by dept order by salary) as rank, --gives same rank for same salary by skipping number
dense_rank() over(partition by dept order by salary) as dense_rank, --gives same rank for same salary by without number
* from employees;


Select row_number() over(order by salary) as rn, * from employees

Select row_number() over(order by salary desc) as rn, * from employees


#Ntiles
SELECT name,salary,
NTILE(4) OVER (ORDER BY Salary DESC) AS Tercile
FROM EMPLOYEES

#LAG
SELECT name,salary,
LAG(salary) OVER (ORDER BY Salary DESC) AS QTY_LAG,
CAST(((QTY - LAG(QTY) over (PARTITION BY PRODUCT ORDER BY DAY))/LAG(QTY) over (PARTITION BY PRODUCT ORDER BY DAY)) * 100 AS decimal(19,2)) AS PERCENTAGE_CHANGE,
PRODUCT,
QTY,
DAY
FROM EMPLOYEES

#LEAD

# AGGREGATE FUNCTIONS(SUM, AVG, MIN, MAX)

SELECT NAME,DEPT, SALARY,
SUM(CAST(SALARY AS INT)) OVER PARTITION BY dept) AS DEPTTOTAL
AVG(CAST(SALARY AS INT)) OVER PARTITION BY dept) AS DEPTAVG
MAX(CAST(SALARY AS INT)) OVER PARTITION BY dept) AS DEPTSLARYMAX
MIN(CAST(SALARY AS INT)) OVER PARTITION BY dept) AS DEPTSLARYMIN
