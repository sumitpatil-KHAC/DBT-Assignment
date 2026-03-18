use assignment;
-- Assignment – 16 Creating Tables and Indexes.
-- 1) Write a command that will enable a user to pull orders grouped by date out of the Orders table quickly. 
create index i_order on Orders(Odate);
select Onum, Odate from Orders order by Odate;

-- 2) If the Orders table has already been created, how can you force the onum field to be unique (assume all current values are unique)? 
create unique index i_orders_Onum on Orders(Onum);
alter table Orders add constraint uq_orders_onum unique (Onum);

-- 3) Create an index that would permit each salesperson to retrieve his or her orders grouped by date quickly. 
create index i_Orders_Snum on orders(Snum , Odate);

-- 4) Let us assume that each salesperson is to have only one customer of a given rating, and that this is currently the case. Enter a command that enforces it. 
create index i_customers_Snum on Customers(Snum , Rating);

-- Assignment – 17 Constraining the Values of your data.
-- 1) Create the Orders table so that all onum values as well as all combinations of cnum and snum are different from one another, and so that NULL values are excluded from the date field. 
create table ord as select * from Orders;
alter table ord add primary key (Onum) , add unique(Cnum , Snum) , modify Odate Date Not Null;

-- 2) Create the Salespeople table so that the default commission is 10% with no NULLS permitted, snum is the primary key, and all names fall alphabetically between A and M, inclusive (assume all names will be uppercase).
 create table salepep as select * from SalesPeople;
alter table salepep add primary key(Snum) , modify Comm Decimal(4,2) not null default 0.10 , 
add constraint chk_name check(Sname >= 'A' and Sname <= 'MZZZZ');

-- 3) Create the Orders table, making sure that the onum is greater than the cnum, and the cnum is greater that the snum. Allow no NULLS in any of these three fields.
alter table ord modify Onum int not null , modify Cnum int not null , modify Snum int not null , 
add constraint c_orders_1 check(Onum > Cnum and Cnum > Snum);

-- Assignment – 18 Maintaining the Integrity of your Data.
-- 1) Create a table called Cityorders. This will contain the same onum, amt and snum fields as the Orders table, and the same cnum and city fields as the Customers table, so that each customer’s order will be entered into this table along with his or her city. Onum will be the primary key of Cityorders. All of the fields in Cityorders will be constrained to match the Customers and Orders tables. Assume the parent keys in these tables already have the proper constraints.
create table cityOrders( Onum int primary key , Amt decimal(7,2) default 5000 , Snum int not null, Cnum int not null , City varchar(20) not null , constraint fk_co_Onum foreign key(Onum) references Orders(Onum) , constraint fk_co_Cnum foreign key(Cnum) references Customers(Cnum) );

-- 2) Redefine the Orders table as follows:- add a new column called prev, which will identify, for each order, the onum of the previous order for that current customer. Implement this with a foreign key referring to the Orders table itself. The foreign key should refer as well to the cnum of the customer, providing a definite enforced link between the current order and the one referenced. 
alter table orders add prev int;
alter table orders add constraint uk_ord_onum_cnum unique(Onum ,Cnum);
 alter table orders add constraint fk_ord_prev foreign key(prev,Cnum) references orders(Onum,Cnum);
