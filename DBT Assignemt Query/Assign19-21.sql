use assignment;
-- Assignment – 19 Views.
-- 1) Create a view that shows all of the customers who have the highest ratings. 
create view high_rating as select * from Customers where Rating = (select max(Rating) from Customers);

-- 2) Create a view that shows the number of salespeople in each city. 
create view no_salpep_city as select City, count(*) from SalesPeople group by City;

-- 3) Create a view that shows the average and total orders for each salesperson after his or her name. Assume all names are unique. 
 create view avg_total_ord as select Sname , avg(Amt) , count(Onum) , sum(Amt) from Orders , SalesPeople where SalesPeople.Snum = Orders.Snum group by Sname;

-- 4) Create a view that shows each salesperson with multiple customers. 
create view multi_cust_sal as select * from SalesPeople where Snum in (select Snum from Customers group by Snum having count(*)>1);

-- Assignment – 20 Changing Values through Views.
-- 1) Which of these views are updateable (will allow DML operations)?
/* 
#1 Create View Dailyorders as Select Distinct cnum, snum, onum, odate from Orders; 
#2 Create View Custotals as Select cname, Sum (amt) Sum_Amt from Orders, Customers where Orders.cnum=Customers.cnum Group by cname;
#3 Create view Thirdorders as Select * from Dailyorders where odate=’1990-10-03’; 
#4 Create view Nullcities as Select snum, sname, city from Salespeople where city is NULL OR sname BETWEEN ‘A’ and ‘MZ’; 
 Here , only 4th is update able 
1st is non update able ,- because of distinct 
2nd is non update able ,- because it uses join , group by , and aggregate function(sum)
3rd is non update able ,- because Dailyorders  view(Parent view) itself is non-updateable . 
Hence its child view will also be non-updateable.
*/
-- 2) Create a view of the Salespeople table called Commissions. This view will include only the snum and comm fields. Through this view, someone could enter or change commissions, but only to values between .10 and .20. 
create view commissions as select Sname , Comm from SalesPeople where Comm between .10 and .20 with check option;

-- 3) Some SQL implementations have a built-in constant representing the current date, sometimes called “CURDATE” or “SYSDATE”. The word SYSDATE can therefore be used in a SQL statement, and be replaced by the current date when the value is accessed by commands such as Select or Insert. We will use a view of the Orders table called Entryorders to insert rows into the Orders table. Create the Orders table, so that SYSDATE is automatically inserted for odate if no value is given. Then create the Entryorders view so that no values can be given. 
 alter table orders modify Odate date default(curdate());
 create view EntryOrders as select Onum,Amt,Snum,Cnum from Orders with check option;

-- Assignment - 21 Grant and Revoke.
-- 1) Give Amit the right to change the ratings of the customers.
grant update(Rating) on Customers to Amit;

-- 2) Give Manoj the right to give other users the right to query the Orders table. 
 grant select on Orders to Manoj with grant option;

-- 3) Take the INSERT privilege on Salespeople away from Ajita. 
 revoke insert on SalesPeople from Ajita; 

-- 4) Grant Abhijeet the right to insert or update the Customers table while keeping her possible rating values in the range of 100 to 500. 
alter table Customers add constraint chk_rating check(Rating between 100 and 500);
 grant insert , update on Customers to Abhijeet;

-- 5) Allow Vikram to query the Customers table, but restrict his access to those customers whose rating is the lowest.
create view low_rating as select * from Customers where Rating = (select min(Rating) from Customers);
grant select on low_rating to Vikram;
