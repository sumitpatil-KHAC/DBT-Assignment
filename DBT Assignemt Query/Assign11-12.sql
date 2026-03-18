use assignment;
-- Assignment – 11 Subqueries.
-- 1) Write a query that uses a subquery to obtain all orders for the customer named Cisneros.
--  Assume you do not know his customer number (cnum). 
select * from Orders where Cnum = (select Cnum from Customers where Cname = 'Cisneros' );

-- 2) Write a query that produces the names and ratings of all customers who have above-average orders. 
 select distinct Cname , Rating from Customers , Orders 
 where Customers.Cnum = Orders.Cnum and Amt > (select avg(Amt) from Orders );
 
-- 3) Write a query that selects the total amount in orders for each salesperson for whom this total is greater than the amount of the largest order in the table. 
select Snum , sum(Amt) from Orders group by Snum having sum(Amt) > (select max(Amt) from Orders);


-- Assignment – 12 Using the operators IN, ANY, and ALL.
-- 1) Write a query that selects all customers whose ratings are equal to or greater than ANY of Serres’. 
select * from  Customers where Rating >=Any (select Rating from Customers , SalesPeople where Customers.Snum = SalesPeople.Snum and Sname ='Serres');
select * from  Customers where Rating >=Any (select Rating from Custo ers where Snum in ( select Snum from  SalesPeople where Sname ='Serres'));

-- 2) Write a query using ANY or ALL that will find all salespeople who have no customers located in their city. 
select * from SalesPeople where City !=All ( select City from Customers where SalesPeople.City = Customers.City);

-- 3) Write a query that selects all orders for amounts greater than any for the customers in London.
select * from Orders where Amt >Any (select Amt from Orders , Customers where Orders.Cnum = Customers.Cnum and Customers.City = 'London');

-- 4) Write the above query using MIN or MAX. 
select * from Orders where Amt >Any (select min(Amt) from Orders , Customers where Orders.Cnum = Customers.Cnum and Customers.City = 'London');
select * from Orders having Amt > (select min(Amt) from Orders , Customers where Orders.Cnum = Customers.Cnum and Customers.City = 'London');
