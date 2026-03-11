-- Exercise 2

create database exercise;
use exercise; 
create table Semp(
   empNo char(4),
   empName char(20),
   basic float,
   deptNo char(2),
   deptHead char(4)
);
create table Sdept( 
   deptNo char(2),
   deptName char(15)
);
insert into Sdept (deptNo , deptName) values 
('10','Development') , 
('20','Training') ;

select * from Sdept;

insert into Semp (empNo , empName , basic, deptNo ) values
('0001', 'SUNIL' , 6000.0 , '10'),
('0002', 'HIREN' , 8000.0 , '20');

insert into Semp (empNo , empName , basic, deptNo , deptHead) values
('0003', 'ALI' , 4000.0 , '10','1001'),
('0004', 'GEORGE' , 6000.0 , '10','1002') ;

select * from Semp;

create table Supplier (
   S_id tinyint primary key,
   Sname varchar(40),
   S_Status tinyint,
   City varchar(20)
);
-- drop table Supplier;
create table Parts(
   Parts_id int primary key,
   Pname varchar(30),
   Color varchar(10),
   Weight tinyint,
   City varchar(15)
);
drop table Parts;

create table Projects(
   Projects_id tinyint primary key,
   Jname varchar(25),
   City varchar(15)
);
create table SupplierPartsProject(
   S_id tinyint primary key,
   Parts_id tinyint primary key,
   Projects_id tinyint primary key,
   Qty int
);
insert into Supplier ( S_id , Sname , S_Status , City ) values 
(1 , 'Matoshree Enterprise ', 10 , 'London' ) ,
(2 , 'Shree Enterprise ', 20 , 'Paris' ) ,
(3 , 'Max Enterprise ', 30 , 'Athens' ) ,
(4 , 'Adi Enterprise ', 20 , 'London' ) ,
(5 , 'Vaibhav Enterprise ', 10 , 'Athens' ) ,
(6 , 'Vaishnav Enterprise ', 20 , 'Paris' ) ,
(7 , 'Satendar Enterprise ', 30 , 'London' ) ;

insert into Parts ( Parts_id , Pname , Color , Weight , City ) values 
(1001 , 'Motor' ,'Red' , 12 , 'London' ) ,
(1002 , 'Electric Comp' ,'Blue' , 13, 'Athens' ) ,
(1003 , 'Monitor' ,'Green' , 14 , 'Paris' ) ,
(1004 , 'Mouse' ,'Yellow' , 15 , 'London' ) ,
(1005 , 'Keyboard' ,'Red' , 18 , 'Athens' ) ;

insert into Parts values (1006, 'Standard', 'Green' , 20 , 'London');

insert into Projects ( Projects_id , Jname , City ) values
(21 , 'Mathew Cons.' , 'London') , 
(22 , 'Steve Cons.' , 'Athens') ,
(23 , 'Laccy Cons.' , 'Paris') ,
(24 , 'Martin Cons.' , 'London') ;

insert into Projects values (25 , 'Sun microsystem ' , 'Athens');
insert into SupplierPartsProject ( S_id , Parts_id , Projects_id , Qty ) values 
( );

-- 5. Display all the data from the S table.    
select * from Supplier;

-- 6. Display only the S# and SNAME fields from the S table.    
select S_id, Sname from Supplier;

-- 7. Display the PNAME and COLOR from the P table for the CITY=”London”.    
select Pname , Color , City from Parts where City = 'London';

-- 8. Display all the Suppliers from London.    
select * from Supplier where City = 'London';

-- 9. Display all the Suppliers from Paris or Athens.    
select * from Supplier where City = 'Paris' or City = 'Athens';

-- 10. Display all the Projects in Athens.    
select * from Projects where City = 'Athens';

-- 11. Display all the Partnames with the weight between 12 and 14 (inclusive of both).    
select Pname , Weight from Parts where Weight >= 12 and  Weight <= 14 ;

-- 12. Display all the Suppliers with a Status greater than or equal to 20.    
select * from Supplier where S_Status >= 20;

-- 13. Display all the Suppliers except the Suppliers from London.    
select * from Supplier where City!= 'London';

-- 14. Display only the Cities from where the Suppliers come from.    
select City from Supplier;

-- 15. Assuming that the Part Weight is in GRAMS, display the same in MILLIGRAMS and KILOGRAMS.
select Weight , Weight*1000 "Milligrams" , Weight/1000  "Kilograms"from  Parts ;

--  Exercise - 2

-- 1. Display the Supplier table in the descending order of CITY.  
 select * from Supplier order by City desc;
 select * from Supplier order by 4 desc;
 
 -- 2. Display the Part Table in the ascending order of CITY and within the city in the ascending order of Part names. 
 select Pname , City from Parts order by City , Pname;
 
 -- 3. Display all the Suppliers with a status between 10 and 20.   
select * from Supplier where S_Status >= 10 and S_Status <=20;

-- 4. Display all the Parts and their Weight, which are not in the range of 10 and 15.   
select Pname , Weight from Parts where Weight < 10 or Weight > 15; 

-- 5. Display all the Part names starting with the letter ‘S’.   
select * from Parts where Pname like 'S%' ;

-- 6. Display all the Suppliers, belonging to cities starting with the letter ‘L’.   
select * from Supplier where City like 'L%';

-- 7. Display all the Projects, with the third letter in JNAME as ‘n’.   
select * from Projects where Jname like '__n%';
