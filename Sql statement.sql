--Start codng.
--Create database table
CREATE TABLE department (

 Dep_Id int primary Key,
 Dep_Name varchar(30),
 Dep_Manager varchar(30),
 Mgr_Id int,
 Dep_Manager_Phone int(11),
 Dep_Employee int

);

CREATE TABLE employee (

 Emp_Id int primary Key,
 Emp_Name varchar(30),
 Emp_Position varchar(30),
 Emp_Department varchar(30),
 Emp_Sex Varchar(1),
 Emp_salary int(6)

);

 ALTER TABLE department
 ADD FOREIGN KEY(Mgr_Id)
 REFERENCES employee(Emp_Id)
 ON DELETE SET NULL;

 UPDATE department
 SET Mgr_Id = 1
 WHERE Dep_Id = 1;

 UPDATE department
 SET Mgr_Id = 2
 WHERE Dep_Id = 2;

 UPDATE department
 SET Mgr_Id = 3
 WHERE Dep_Id = 3;

 UPDATE department
 SET Mgr_Id = 4
 WHERE Dep_Id = 4;

CREATE TABLE supplier (

 Sup_Id int primary Key,
 Sup_Name varchar(30),
 Sup_Phone int(11),
 Dep_Id int,
 FOREIGN KEY(Dep_Id) REFERENCES department(Dep_Id) ON DELETE SET NULL

);

CREATE TABLE commodity (

 Com_Id int primary Key,
 Com_Name varchar(30),
 Com_Price int(3),
 Com_Sell_Date date,
 Com_Department varchar(30),
 Sup_Id int,
 FOREIGN KEY(Sup_Id) REFERENCES supplier(Sup_Id) ON DELETE SET NULL

);

CREATE TABLE customer (

 Cus_Id int primary Key,
 Cus_Name varchar(30),
 Cus_Buy_Com Varchar(30),
 Cus_Total_Cost int

);

--Find Table Information
SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM supplier;
SELECT * FROM commodity;
SELECT * FROM customer;


--Delete table Information
drop table department;
drop table employee;
drop table supplier;
drop table commodity;
drop table customer;

--Insert data in the Table

INSERT INTO department VALUES(1, 'Sells Department', 'Tareq', NULL , 01992939391 , 5 );
INSERT INTO department VALUES(2, 'Buys Department', 'Jon', NULL , 01992934334 , 3 );
INSERT INTO department VALUES(3, 'Store Department', 'Von', NULL , 01892939383 , 1 );
INSERT INTO department VALUES(4, 'Mangement Department', 'Dane', NULL , 01982939376 , 1 );

INSERT INTO employee VALUES(1, 'Tareq', 'Manager' , 'Sells Department' , 'M', 10500);
INSERT INTO employee VALUES(2, 'Jon', 'Manager' , 'Buys Department' , 'M', 8500);
INSERT INTO employee VALUES(3, 'Von', 'Manager' , 'Store Department' , 'M', 9500);
INSERT INTO employee VALUES(4, 'Dane', 'Manager' , 'Management Department' , 'M', 9000);
INSERT INTO employee VALUES(5, 'Yu', 'Assistant Manager' , 'Sells Department' , 'F', 6000);
INSERT INTO employee VALUES(6, 'Shu', 'Worker' , 'Sells Department' , 'M', 5000);
INSERT INTO employee VALUES(7, 'Lin', 'Worker' , 'Sells Department' , 'F', 5000);
INSERT INTO employee VALUES(8, 'Lu', 'Worker' , 'Sells Department' , 'F', 5000);
INSERT INTO employee VALUES(9, 'Xiao', 'Worker' , 'Buys Department' , 'M', 5500);
INSERT INTO employee VALUES(10, 'Jon', 'Assistant Manager' , 'Buys Department' , 'M', 6000);

INSERT INTO supplier VALUES(101, 'Robinson', 01234456123, 3);
INSERT INTO supplier VALUES(102, 'Tommy', 01534457890, 1);
INSERT INTO supplier VALUES(103, 'Dobson', 01894456189, 1);
INSERT INTO supplier VALUES(104, 'Dowsan', 01674756189, 2);
INSERT INTO supplier VALUES(105, 'Rock', 01345446123, 3);

INSERT INTO commodity VALUES(1001, 'Rice', 5 , '2021-12-31' , "Grocery" , 101 );
INSERT INTO commodity VALUES(1002, 'Flour',4 , '2021-12-31' , "Grocery" , 101 );
INSERT INTO commodity VALUES(1003, 'Oil', 12 , '2021-12-31' , "Grocery" , 101 );
INSERT INTO commodity VALUES(1004, 'Fish', 9 , '2021-12-31' , "Fish and Sea Food" , 104 );
INSERT INTO commodity VALUES(1005, 'Beef', 100 , '2021-12-30' , "Meat" , 104 );
INSERT INTO commodity VALUES(1006, 'Chicken', 25 , '2021-12-30' , "Meat" , 104 );
INSERT INTO commodity VALUES(1007, 'Mango', 16 , '2021-12-30' , "Fruits" , 102 );
INSERT INTO commodity VALUES(1008, 'Beef', 100 , '2021-12-30' , "Meat" , 104 );
INSERT INTO commodity VALUES(1009, 'Rice', 5 , '2021-12-30' , "Grocery" , 101 );
INSERT INTO commodity VALUES(1010, 'Egg', 13 , '2021-12-30' , "Grocery" , 105 );

INSERT INTO customer VALUES(11, 'Rock', "Rice, Flour", 20);
INSERT INTO customer VALUES(12, 'Rock', 'Beef, Flour', 125);
INSERT INTO customer VALUES(13, 'Danny', 'Mango, Egg', 34);
INSERT INTO customer VALUES(14, 'tonny', 'Rice, Fish', 50);
INSERT INTO customer VALUES(15, 'jon', 'Oil, Egg', 50);

--All Queries

-- Find all employees at Sells department
SELECT *
FROM employee
WHERE Emp_Department = 'Sells Department';

-- Find all employees ordered by salary
SELECT *
from employee
ORDER BY Emp_salary ASC;

-- Find all employees ordered by sex
SELECT *
from employee
ORDER BY Emp_Sex;

-- Find the sum of all employee's salaries
SELECT SUM(Emp_salary)
FROM employee;

--Find all the commodity at Grocery department
SELECT *
FROM commodity
WHERE Com_Department = 'Grocery';

--Find a commodity information by Supplier ID
SELECT *
FROM commodity
WHERE Sup_Id = 102;

--Find the supplier information of a commodity
SELECT *
FROM supplier
WHERE Sup_Id = 102;

--Find all the supliers who are supply product at department 1
SELECT *
FROM supplier
WHERE Dep_Id = 1;

--Find customer information
SELECT *
FROM customer
WHERE Cus_Name = 'Rock';

--Find customer who buyed Rice and Fish
SELECT *
FROM customer
WHERE Cus_Buy_Com = 'Rice, Fish';
