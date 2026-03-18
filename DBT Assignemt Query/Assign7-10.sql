use assignment;
-- Assignment –7 Summarizing Data with Aggregate Functions.
-- 1) Write a query that counts all orders for October 3. 
select count(*) from Orders where Odate ='1990-10-03';

-- 2) Write a query that counts the number of different non-NULL city values in the Customers table.
 select count(distinct(City)) from Customers;

--  3) Write a query that selects each customer’s smallest order.
select Cnum , min(Amt) from Orders group by Cnum;

-- 4) Write a query that selects the first customer, in alphabetical order, whose name begins with G.
select * from Customers where Cname like 'G%' order by Cname limit 1;

-- 5) Write a query that selects the highest rating in each city. 
select City , max(Rating) from Customers group by City;

-- 6) Write a query that counts the number of salespeople registering orders for each day. 
-- (If a salesperson has more than one order on a given day, he or she should be counted only once.)
 select Odate , count(Snum) from Orders group by Odate;

-- Assignment –8 Formatting Query output.
-- 1) Assume each salesperson has a 12% commission. Write a query on the orders table that will produce 
-- the order number, the salesperson number, and the amount of the salesperson’s commission for that order.
select Onum , Snum , Amt*0.12 "Amount of SalesPerson Comm" from Orders;
select Onum , Snum , ifnull(Amt,0)*0.12 "Amount of SalesPerson Comm" from Orders;

-- 2) Write a query on the Customers table that will find the highest rating in each city. 
-- Put the output in this form: For the city (city), the highest rating is : (rating). 
select concat('For the City' , City , ', the Highest Rating is ', max(Rating)) "Result "from Customers group by City;

-- 3) Write a query that lists customers in descending order of rating. Output the rating field first, 
-- followed by the customer’s name and number. 
select Rating , Cname ,Cnum from Customers order by Rating desc;

-- 4) Write a query that totals the orders for each day and places the results in descending order. 
select distinct Odate , sum(Amt) "Total_Amt" from Orders group by Odate order by Total_Amt desc;

-- Assignment – 9 Querying Multiple Tables at Once.
-- 1) Write a query that lists each order number followed by the name of the customer who made the order. 
select Onum , Cname from Orders, Customers where Orders.Cnum = Customers.Cnum ;

-- 2) Write a query that gives the names of both the salesperson and the customer for each order along with the order number. 
select s.Sname , c.Cname , o.Onum from Orders o join Customers c on
o.Cnum = c.Cnum join SalesPeople s on o.Snum = s.Snum;  -- slow

select SalesPeople.Sname , Customers.Cname , Orders.Onum from Orders , Customers , SalesPeople 
where Orders.Cnum = Customers.Cnum  and Orders.Snum = SalesPeople.Snum;  -- fast

-- 3) Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name, the salesperson’s name, and the salesperson’s rate of commission. 
select Cname , Sname , Comm from Customers join SalesPeople on
Customers.Snum = SalesPeople.Snum where Comm > 0.12;

-- 4) Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100. 
select Onum , Sname , Amt*Comm from Orders join Customers on
Orders.Cnum = Customers.Cnum join SalesPeople on
Orders.Snum = SalesPeople.Snum where Rating > 100;

-- Assignment – 10 Joining a Table to Itself.
-- 1) Write a query that produces all pairs of salespeople who are living in the same city. Exclude combinations of 
-- salespeople with themselves as well as duplicate rows with the order reversed. 
select a.Sname , b.Sname , a.City from SalesPeople a , SalesPeople b where a.City = b.City and a.Snum < b.Snum;


-- 2) Write a query that produces the names and cities of all customers with the same rating as Hoffman. 
 select a.Cname , b.City from Customers a , Customers b where a.Rating = b.Rating and a.Cname ='Hoffman';
select Cname , City from Customers where Rating = (select Rating from Customers where Cname = 'Hoffman');

