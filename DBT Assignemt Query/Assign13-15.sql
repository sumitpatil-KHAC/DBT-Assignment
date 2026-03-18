use assignment;
-- Assignment – 13 Using the UNION clause.
-- 1) Create a union of two queries that shows the names, cities, and ratings of all customers. Those with rating of 200 
-- or greater will also have the words “High Rating”, while the others will have the words “Low Rating”. 
select Cname , City , Rating , 'High Rating' as Rating_Status 
from Customers where Rating >= 200 
union  select Cname , City , Rating , 'Low Rating' as Rating_Status 
from Customers where Rating < 200;


-- 2) Write a command that produces the name and number of each salesperson and each customer 
-- with more than one current order. Put the results in alphabetical order
select Sname , Snum from SalesPeople 
union select Cname , Customers.Cnum from Customers,Orders 
where Customers.Cnum = Orders.Cnum group by Cname , Cnum having count(Onum)> 1 order by 1;

-- 3) Form a union of three queries. Have the first select the snums of all salespeople in San Jose; 
-- the second, the cnums of all customers in San Jose; and the third the onums of all orders on October 
-- 3. Retain duplicates between the last two queries but eliminate any redundancies between either of them and the first.
-- (Note: in the sample tables as given, there would be no such redundancy. This is besides the point.) 
 select Snum from SalesPeople where City = 'San Jose' union select Cnum from Customers where City = 'San Jose' union all select Onum from Orders where Odate ='1990-10-03' ;

-- Assignment – 14 Entering, Deleting, and Changing Field Values.
-- 1) Write a command that puts the following values, in their given order, into the salespeople table: city – San Jose, name – Blanco, comm – NULL, cnum – 1100. 
 insert into SalesPeople (City , Sname , Comm , Snum ) values ('San Jose' , 'Blanco', null , 1100);

-- 2) Write a command that removes all orders from customer Clemens from the Orders table.
 delete from orders where Cnum = (select Cnum from Customers where Cname = 'Clemens');

-- 3) Write a command that increases the rating of all customers in Rome by 100. 
update Customers set Rating = Rating + 100 where City = 'Rome';

-- 4) Salesperson Serres has left the company. Assign her customers to Motika. 
update Customers set Snum = (select Snum from SalesPeople where Sname ='Motika') where Snum = (select Snum from SalesPeople where Sname = 'Serres');


-- Assignment – 15 Using Subqueries with DML Commands.
-- 1) Assume there is a table called Multicust, with all of the same column definitions as Salespeople. Write a command that inserts all salespeople with more than one customer into this table. 
insert into Multicust (Snum, Sname, City, Comm) 
select s.Snum, s.Sname, s.City, s.Comm from SalesPeople s 
where s.Snum in ( select C.Snum from Customers C group by C.Snum having count(*) > 1 );

-- 2) Write a command that deletes all customers with no current orders.
delete from Customers where not exists (select * from Orders where Orders.Onum = Customers.Cnum );

-- 3) Write a command that increases by twenty percent the commissions of all salespeople with total orders above Rs. 3,000. 
update SalesPeople set Comm = Comm*1.2 where Snum in (select sum(Amt) from Orders group by Snum having sum(Amt) > 3000);

