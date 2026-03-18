use assignment;
-- DB Assignment 5 : Relational and Logical Operators.
-- 1)Write a query that will give you all orders for more than Rs. 1,000.
select * from orders where Amt>1000;

-- 2) Write a query that will give you the names and cities of all salespeople in London with a commission above .10.
select Sname ,City from salespeople where City ='London' and Comm > .10;

-- 3) Write a query on the Customers table whose output will exclude all customers with a rating <= 100, unless they are located in Rome.
 select * from customers where Rating <= 100 and City = 'Rome' or Rating > 100;

-- 4) What will be the output from the following query? 
select * from Orders where (amt < 1000 or not (Odate = '1990-10-03' and cNum > 2003));
/*
3001	18.69	1990-10-03	2008	1007
3003	767.19	1990-10-03	2001	1001
3005	5160.45	1990-10-03	2003	1002
3007	75.75	1990-10-04	2004	1002
3008	4723.00	1990-10-05	2006	1001
3010	1309.95	1990-10-06	2004	1002
3009	1713.23	1990-10-04	2002	1003
*/

--  5) What will be the output of the following query?
 Select * from Orders where NOT ((odate = '1990-10-03' OR snum >1006) AND amt >= 1500);
 /*
 3001	18.69	1990-10-03	2008	1007
3003	767.19	1990-10-03	2001	1001
3006	1098.16	1990-10-03	2008	1007
3007	75.75	1990-10-04	2004	1002
3008	4723.00	1990-10-05	2006	1001
3010	1309.95	1990-10-06	2004	1002
3009	1713.23	1990-10-04	2002	1003
*/

--  6) What is a simpler way to write this query? 
-- Select snum, sname, city, comm From Salespeople where (comm > .12 OR comm <.14);
select Snum , Sname ,City , Comm from SalesPeople where Comm not between .12 and .14 ;

-- Assignment –6 Using Special Operators in Conditions.
-- 1) Write two different queries that would produce all orders taken on October 3rd or 4th, 1990. 
select * from Orders where Odate='1990-10-03' or Odate ='1990-10-04';
select * from Orders where Odate between '1990-10-03' and '1990-10-04';

-- 2) Write a query that selects all of the customers serviced by Peel or Motika. (Hint: the snum field relates the two tables to one another). 
 select * from Customers where Snum=1001 or Snum=1004;

-- 3) Write a query that will produce all the customers whose names begin with a letter from ‘A’ to ‘G’. 
select * from Customers where left(Cname,1) between 'A' and  'G';
select * from Customers where Cname like 'A%' or Cname like 'B%' or Cname like 'C%'or Cname like 'D%'or Cname like 'E%'or Cname like 'F%' or Cname like 'G%';

-- 4) Write a query that selects all customers whose names begin with the letter ‘C’. 
select * from Customers where Cname like 'C%';

-- 5) Write a query that selects all orders except those with zeroes or NULLs in the amt field.
select * from Orders where Amt is not null and Amt <> 0 ;
select * from Orders where Amt is not null and Amt != 0 ;



