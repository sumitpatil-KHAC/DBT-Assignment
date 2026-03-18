use exercise;
show tables;

-- 1. Display the minimum Status in the Supplier table.   
select min(S_Status) from Supplier;

-- 2. Display the maximum Weight in the Parts table.   
select max(weight) from Parts;

-- 3. Display the average Weight of the Parts. 
select avg(weight) from Parts;  
select avg(ifnull(weight,0)) from Parts;

select * from  SupplierPartsProject;
select * from Parts;
select count(*) from SupplierPartsProject; -- 5
select count(*) from Parts;      -- 6
-- 4. Display the total Quantity sold for part ‘P1’.   
select sum(Qty) from Parts , SupplierPartsProject where 
Parts.Parts_id = SupplierPartsProject.Parts_id and Pname like 'P1%';            
select sum(Qty) from Parts , SupplierPartsProject where 
Parts.Parts_id = SupplierPartsProject.Parts_id and Pname like 'M%';

select * from supplier;
-- 5. Display the total Quantity sold for each part.   
select Parts.Parts_id, sum(Qty) from Parts, SupplierPartsProject
where Parts.Parts_id = SupplierPartsProject.Parts_id 
group by Parts_id ; 


-- 6. Display the average Quantity sold for each part.   
select Parts.Pname, avg(Qty) from Parts, SupplierPartsProject
where Parts.Parts_id = SupplierPartsProject.Parts_id 
group by Pname ; 


-- 7. Display the maximum Quantity sold for each part, provided the maximum Quantity is greater than 800.
select Parts.Pname, max(Qty) max_qty from Parts, SupplierPartsProject
where Parts.Parts_id = SupplierPartsProject.Parts_id 
group by Pname
having max_qty > 800 ; 


select * from supplier;
-- 8. Display the Status and the count of Suppliers with that Status.   
select S_Status , count(S_Status) from Supplier group by S_Status;

select * from projects;
-- 9. Display the count of Projects going on in different cities.   
select City , count(Jname) from Projects group by City;

-- 10. What is the difference between COUNT(Status) and COUNT(*) ?   
select count(S_Status) from Supplier;  -- dont calculates null rows
select count(*) from Supplier;     -- calculates null rows also

/*
-- 11. Display the Status and the Count of Suppliers with that Status in the following format as shown below:-   
Status     Count   
Ten           1   
Twenty        2   
Thirty        3 
*/
select 
case 
when S_Status='10' then 'Ten' 
when S_Status='20' then 'Twenty' 
when S_Status='30' then 'Thirty' 
else "Others" 
end "Status", count(Sname) count
from Supplier group by S_Status;  