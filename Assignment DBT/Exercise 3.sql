use exercise;
show tables;
select * from supplier;
-- 1. Display all the Supplier names with the initial letter capital.   
select concat(upper (left(Sname,1)) , lower(substr(Sname,2)))from Supplier ;

-- 2. Display all the Supplier names in upper case.   
select upper(Sname) from Supplier ;

-- 3. Display all the Supplier names in lower case.   
select lower(Sname) from Supplier ;

-- 4. Display all the Supplier names padded to 25 characters, with spaces on the left.   
select lpad(Sname,25,' ') from Supplier;

-- 5. Display all the Supplier names (with ‘la’ replaced by ‘ro’).     
select replace(Sname,'la','ro') from Supplier;
select replace(Sname,'av','xyz') from Supplier;

-- 6. Implement the above command such that ‘l’ is replaced with ‘r’ and ‘a’ is replaced with ‘o’.
select replace(replace(Sname,'l','r'),'a','o') from Supplier;

-- 7. Display the Supplier names and the lengths of the names.   
select Sname, length(Sname) from Supplier;

-- 8. Use the soundex function to search for a supplier by the name of ‘BLOKE’.   
select * from Supplier where soundex(Sname) = soundex('BLOKE');
select * from Supplier where soundex(Sname) = soundex('shree');

-- 9. Display the Supplier name and the status (as Ten, Twenty, Thirty, etc.).   

select Sname ,
case 
when S_Status=10 then 'Ten'
when S_Status=20 then 'Twenty'
when S_Status=30 then 'Thirty'
else 'Other'
end "Sname with Status"
from Supplier;

select case 
when S_Status=10 then concat(Sname,'Ten')
when S_Status=20 then concat(Sname,'Twenty')
when S_Status=30 then concat(Sname,'Thirty')
else 'Other'
end "Sname with Status"
from Supplier;

-- 10. Display the current day (e.g. Thursday).   
select dayname(sysdate()) from dual;
select dayname(sysdate());



