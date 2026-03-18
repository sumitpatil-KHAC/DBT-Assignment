use exercise2;
show tables;
select * from supplier;
-- 1. Display all the Suppliers with the same Status as the supplier, ‘CLARK’.   
select b.Sname , b.Status from Supplier a, Supplier b where a.Status = b.Status and a.Sname ='Clark';
select b.Sname , b.Status from Supplier a, Supplier b where a.Status = b.Status and a.Sname ='Ramesh';

select * from Employee;
-- 2. Display all the Employees in the same department as the employee ‘MILLER’.   
select b.Ename , a.deptno from Employee a , Employee b where a.deptno = b.deptno and a.Ename = 'Miller';
select b.Ename , a.deptno from Employee a , Employee b where a.deptno = b.deptno and a.Ename = 'Vijay';

select * from Parts;
-- 3. Display all the Parts which have more Weight than all the Red parts.   
select Pname from Parts where Weight > all(select max(Weight) from Parts where Color = 'Red');

select * from Project;
-- 4. Display all the Projects going on in the same city as the project ‘TAPE’.   
select a.Jname , a.City from Project a , Project b where a.City = b.City and a.Jname ='Tape';
select b.Jname , b.City from Project a , Project b where a.City = b.City and a.Jname ='Dam';

-- 5. Display all the Parts with Weight less than all the Green parts.   
select Pname from Parts where Weight < all(select min(Weight) from Parts where Color = 'Green');

select * from Supplier;
select * from SPJ;
-- 6. Display the name of the Supplier who has sold the maximum Quantity (in one sale).  
 select Sname from Supplier where Sno = (select Sno from SPJ where Qty =( select max(Qty) from SPJ ));  
 
 show tables;
 select * from Employee;
 -- 7. Display the name of the Employee with the minimum Salary.   
select Ename from Employee where sal = (select min(sal) from Employee );

-- 8. Display the name of the Supplier who has sold the maximum overall Quantity (sum of Sales). 
 select Sname from Supplier
 where Sno = (select Sno from SPJ 
 group by Sno 
 having sum(Qty) = 
 (select max(total) from 
 ( select sum(Qty) total from SPJ  group by Sno ) as t));  
 
 -- 9. Display the name of the Department with the maximum number of Employees.   
use cdac;
show tables;
select * from emp2;  -- 6
select * from dept;
select dName from dept
where deptNo = (
select deptNo from emp2
group by deptNo
having count(*) = 
(select max(emp_count) from (
select count(*) as emp_count from emp2
group by deptNo) as x));