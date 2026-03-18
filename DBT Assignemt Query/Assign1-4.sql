create database assignment;
use assignment;
create table SalesPeople(
     Snum int ,
     Sname varchar(10) ,
     City varchar(10) ,
     Comm float (3,2) 
);
create table Customers(
	Cnum int ,
	Cname varchar(10),
    City varchar(10),
     Rating int ,
    Snum int 
) ;
create table Orders(
     Onum int ,
     Amt float(7,2),
     Odate date ,
     Cnum int ,
     Snum int 
);
insert into SalesPeople (Snum , Sname , City , Comm) values
     (1001 , 'Peel' , 'London' , .12 ) ,
	(1002 , 'Serres' , 'San Jose' , .13 ) ,
	(1004 , 'Motika' , 'London' , .11 ) ,
     (1007 , 'Rifkin' , 'Barcelona' , .15 ) ,
     (1003 , 'Axelrod' , 'New York' , .10 ) ;

 select * from SalesPeople;

insert into Customers (Cnum , Cname , City , Rating , Snum) values
    (2001 , 'Hoffman' , 'London' , 100 , 1001 ),
	(2002 , 'Giovanni' , 'Rome' , 200 , 1003 ),
	(2003 , 'Liu' , 'San Jose' , 200 , 1002 ),
     (2004 , 'Grass' , 'Berlin' , 300 , 1002 ),
     (2006 , 'Clemens' , 'London' , 100 , 1001 ),
     (2008 , 'Cisneros' , 'San Jose' , 300 , 1007 ),
     (2007 , 'Pereira' , 'Rome' , 100 , 1004);
select * from Customers;

insert into Orders (Onum , Amt , Odate , Cnum , Snum) values
    (3001 , 18.69 , '1990-10-03' , 2008 , 1007 ),
	(3003 , 767.19 , '1990-10-03' , 2001 , 1001 ),
    (3002 , 1900.10 , '1990-10-03' , 2007 , 1004 ),
	(3005 , 5160.45 , '1990-10-03' , 2003 , 1002 ),
	(3006 , 1098.16 , '1990-10-03' , 2008 , 1007 ),
     (3007 , 75.75 , '1990-10-04' , 2004 , 1002 ),
      (3008 , 4723.00 , '1990-10-05' , 2006 , 1001 ),
      (3010 , 1309.95 , '1990-10-06' , 2004 , 1002 ),
     (3009 , 1713.23 , '1990-10-04' , 2002 , 1003 );

insert into Orders (Onum , Amt , Odate , Cnum , Snum) values
(3011 , 9891.88 , '1990-10-03' , 2006 , 1001 );

 select * from Orders;
--  Assignment 2
-- 1) Which field of the Customers table is the primary key? 
/* In the above Customers  table there is no specified primary key but Cnum can be primary key if 
declared at time of table creation , or by using alter table we can add primary key to Cnum . 
The purpose of primary key is that the value must be unique and not null for the table of primary attribute .*/
-- 2) What is the 4th column of the Customers table? 
-- Rating is the fourth column of Customers table.
-- 3) What is another word for row? For column? 
-- Row – Tuple , Entity , Opportunity  .Column – Attribute .
-- 4) Why isn’t it possible to see the first five rows of a table?
/*Because , every row in the table is stored as a separate file with some memory address , 
this memory address remains constant . So, we can see the rows in ascending order of their memory 
address and not in the order they are inserted into table . So, it is not possible to see the first nor 
the last five  rows of a table. */

-- Assignment 3
-- 1) Does ANSI recognize the data type DATE? 
/*Yes , ANSI recognized the date data type . and its format is ‘YYYY-MM-DD’ .
Date is of 7 bytes. Range is , ‘1000-01-01’ to ‘9999-12-31’*/

-- 2) Which subdivision of SQL is used to insert values in tables?
-- Data Manipulation Language (DML) subdivision of SQL is  used to insert values in tables.

-- Assignment 4 -  Retrieving Information from Tables.
-- 1) Write a select command that produces the order number, amount, and date for all rows in the Orders table. 
 select Onum , Amt , Odate from Orders;

-- 2) Write a query that produces all rows from the Customers table for which the salesperson’s number is 1001. 
select * from Customers where Snum = 1001;

-- 3) Write a query that displays the Salespeople table with the columns in the following order: city, sname, snum, comm.
select City , Sname , Snum , Comm from SalesPeople;

-- 4) Write a select command that produces the rating followed by the name of each customer in San Jose. 
select Rating , Cname , City from Customers where City = 'San Jose';

-- 5) Write a query that will produce the snum values of all salespeople (suppress the duplicates) with orders in the Orders table. 
select distinct Snum from Orders;



