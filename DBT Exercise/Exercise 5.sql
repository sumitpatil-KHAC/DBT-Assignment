create database exercise2;
use exercise2;
create table Supplier
(
    Sno char(3) primary key,
    Sname varchar(20),
    Status int,
    City varchar(20)
);
drop table Parts;
create table Parts
(
    Pno char(3) primary key,
    Pname varchar(20),
    Color varchar(10),
    Weight int,
    City varchar(20)
);

create table Project
(
    Jno char(3) primary key,
    Jname varchar(20),
    City varchar(20)
);
drop table SPJ;
create table SPJ
(
    Sno char(3),
    Pno char(3),
    Jno char(3),
    Qty int,
    
    primary key (Sno, Pno, Jno),

    foreign key (Sno) references Supplier(Sno),
    foreign key (Pno) references Parts(Pno),
    foreign key (Jno) references Project(Jno)
);
create table Employee
(
    EmpNo int primary key,
    Ename varchar(20),
    ManagerNo int,
    deptno int,
    sal float,
    foreign key (ManagerNo) references Employee(EmpNo)
);
drop table Employee;
insert into Supplier (Sno, Sname, Status, City) 
values ('S1','Ramesh',20,'Pune');

insert into Supplier (Sno, Sname, Status, City) 
values ('S2','Suresh',10,'Mumbai');

insert into Supplier (Sno, Sname, Status, City) 
values ('S3','Mahesh',20,'Pune');

insert into Supplier (Sno, Sname, Status, City) 
values ('S4','Rajesh',30,'Delhi');

insert into Supplier (Sno, Sname, Status, City) 
values ('S5','Naresh',20,'Mumbai');

insert into Parts (Pno, Pname, Color, Weight, City) 
values ('P1','Bolt','Red',12,'Pune');

insert into Parts (Pno, Pname, Color, Weight, City) 
values ('P2','Nut','Blue',15,'Mumbai');

insert into Parts (Pno, Pname, Color, Weight, City) 
values ('P3','Screw','Red',16,'Delhi');

insert into Parts (Pno, Pname, Color, Weight, City) 
values ('P4','Cam','Green',14,'Pune');

insert into Parts (Pno, Pname, Color, Weight, City) 
values ('P5','Wheel','Black',18,'Mumbai');

insert into Project (Jno, Jname, City) 
values ('J1','Bridge','Pune');

insert into Project (Jno, Jname, City) 
values ('J2','Building','Mumbai');

insert into Project (Jno, Jname, City) 
values ('J3','Road','Delhi');

insert into Project (Jno, Jname, City) 
values ('J4','Dam','Pune');
insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S1','P1','J1',300);

insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S1','P3','J3',200);

insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S2','P2','J2',400);

insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S3','P4','J1',250);

insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S3','P5','J4',350);

insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S4','P3','J3',600);

insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S5','P2','J2',150);

insert into SPJ (Sno, Pno, Jno, Qty) 
values ('S1','P5','J4',300);

insert into Employee values (101,'Amit',NULL,10,1000);
insert into Employee values (102,'Vijay',101,10,1300);
insert into Employee values (103,'Kiran',101,20,900);
insert into Employee values (104,'Neha',102,20,3000);
insert into Employee values (105,'Pooja',102,10,1200);

select count(*) from Supplier;   -- 5
select count(*) from Parts;  -- 5
select Count(*) from SPJ;   -- 8
select count(*) from Project;    -- 4
select * from Supplier;

-- 1. Display the Supplier name and the Quantity sold.   
select Sname , Qty from SPJ , Supplier where SPJ.Sno = Supplier.Sno;

select * from Parts;
-- 2. Display the Part name and Quantity sold. 
select Pname , Qty from SPJ , Parts where SPJ.Pno = Parts.Pno;

select * from Project;
-- 3. Display the Project name and Quantity sold. 
select Jname , Qty from SPJ , Project where SPJ.Jno = Project.Jno;

-- 4. Display the Supplier name, Part name, Project name and Quantity sold. 
select Sname ,Pname , Jname , Qty from SPJ 
join Supplier on SPJ.Sno = Supplier.Sno 
join Parts on SPJ.Pno = Parts.Pno 
join Project on SPJ.Jno = Project.Jno;

select * from Parts;
select * from Supplier;
select * from Project;
-- 5. Display the Supplier name, Supplying Parts to a Project in the same City. 
select Sname , Pname , Jname , Supplier.City
from SPJ
join Supplier on SPJ.Sno = Supplier.Sno
join Parts on SPJ.Pno = Parts.Pno
join Project on SPJ.Jno = Project.Jno
where Supplier.City = Project.City;

-- 6. Display the Part name that is ‘Red’ is color, and the Quantity sold.
select Pname , Color , Qty from  SPJ join Parts 
on SPJ.Pno = Parts.Pno where Color = 'Red' ;

select * from Parts;
select * from SPJ;
select * from Supplier;
-- 7. Display all the Quantity sold by Suppliers with the Status = 20. 
select Qty , Status from SPJ 
join Supplier on SPJ.Sno = Supplier.Sno 
where Status = 20;

-- 8. Display all the Parts and Quantity with a Weight > 14. 
select Pname , Qty from SPJ 
join Parts on SPJ.Pno = Parts.Pno
where Weight > 14;

-- 9. Display all the Project names and City, which has bought more than 500 Parts. 
select jname , City , sum(Qty) from SPJ 
join Project on SPJ.Jno = Project.Jno
group by jname , City 
having sum(Qty) > 500;

-- 10. Display all the Part names and Quantity sold that have a Weight less than 15. 
select Pname , Qty from Parts 
join SPJ on SPJ.Pno = Parts.Pno
where Weight < 15;

-- 11. Display all the Employee names and the name of their Managers. 
select * from Employee;
select b.Ename , b.ManagerNo from Employee a , Employee b where a.EmpNo = b.ManagerNo;

