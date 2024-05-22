---------------------- NEW assignment--------------------

create table empl(

Employee_id int primary key,
First_Name varchar(20),
Last_Name varchar(20),
Salary float,
Joining_date dateTime,
Department varchar(30)
);



insert into empl values (1,'Anika','Arora', 100000, '2020-02-14 9:00:00','HR')
 
insert into empl values (2,'Veena','Verma',80000, '2011-06-15 9:00:00', 'Admin')

insert into empl values (3,'Vishal', 'Singhal' ,300000 , '2020-02-16 9:00:00' , 'HR')

insert into empl values (4, 'Sushanth', 'Singh' ,500000 , '2020-02-17 9:00:00', 'Admin')

insert into empl values (5, 'Bhupal','Bhati', 500000, '2011-06-18 9:00:00', 'Admin')

insert into empl values (6, 'Dheeraj', 'Diwan', 200000, '2011-06-19 9:00:00', 'Account')

insert into empl values (7, 'Karan', 'Kumar', 75000, '2020-01-14 9:00:00', 'Account')

insert into empl values (8, 'Chandrika', 'Chauhan', 90000, '2011-04-15 9:00:00', 'Admin')



  select * from empl


-------------------------creating employee bonus--------------------
  

  create table emply_Bonus(

ref_id  int not null primary key,
bonus_amount float ,
bonus_date dateTime
);

select* from emply_Bonus
insert into emply_Bonus values(
 1,5000,'2020-02-14 9:00:00'   )

 insert into emply_Bonus values (
   2,3000, '2020-02-14 9:00:00')

insert into emply_Bonus values(
  3,4000,'2020-02-16  9:00:00')


  insert into emply_Bonus values(
  4,4500,'2020-02-16   9:00:00')


  insert into emply_Bonus values(
  5,3500,2011-02-16)

  Select * from emply_Bonus




  -------------------------Creating employee title-----------


create  table employe_title(
ref_id  int not null primary key,
em_title varchar (30),
affective_date  datetime
);


insert into employe_title values(
 1,'Manager','2016-02-20 0:00:00') 



 insert into employe_title values(
 2,'Executive',  '2016-06-11 0:00:00' )


 insert into employe_title values(
 8,'Executive',  '2016-06-11 0:00:00' )


 insert into employe_title values(
 5,'Manager',  '2016-06-11 0:00:00' )



 insert into employe_title values(
 4,'Asst,Manager',  '2016-06-11 0:00:00' )



 insert into employe_title values(
 7,'Executive',  '2016-06-11 0:00:00' )



 insert into employe_title values(
 6,'Lead',  '2016-06-11 0:00:00' )


 insert into employe_title values(
 3,'Lead',  '2016-06-11 0:00:00' )


 select *  from  employe_title


---------------------Tasks To Be Performed:------------
 
--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name

select  first_name  as 'Employee_name' from emp_table

--2 Display “LAST_NAME” from Employee table in upper case.

select upper(last_name)  from emp_table

--3 Display unique values of DEPARTMENT from EMPLOYEE table.

select department from empl

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.

select SUBSTRING(Last_name,1,3)
from empl

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
select department
from  empl

select len(Department) from empl;

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.a space char should separate them.
select first_name+' '+last_name as Full_name
  from empl

--7 DISPLAY all EMPLOYEE details from the employee table 
  --order by FIRST_NAME in Ascending.
select* 
    from empl
	order by First_Name desc

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and 
   --DEPARTMENT Descending.
   select* 
   from empl
   order by First_Name asc,department desc

  --9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

  select *
from empl
where First_Name  like 'Veena'  

select *
from empl
where First_Name  like 'Karan'  

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.

select*
from empl
where Department ='Admin'

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
select *
from empl
where First_Name  like 'V%'

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000
  select *
  from empl
  where Salary between 100000 and 500000

--13 Display details of the employees who have joined in Feb-2020.
select *
from empl
where year(Joining_date)= 2020 and month(Joining_date)=2

--14 Display employee names with salaries >= 50000 and <= 100000.
select * 
from empl 
where salary>=50000 and Salary<=100000

--15 DISPLAY details of the EMPLOYEES who are also Managers.
select ref_id 
from employ_title where em_title='manager'

--16 DISPLAY duplicate records having matching data in some fields of a table.
 
 select *,
 case when salary=LAG(Salary) over (order by salary) Then 'Yes'
 else 'No' End Dup_Value
 from empl
 order by Salary

--17 Display only odd rows from a table.
select * 
from empl
where Employee_id%2=1

--18. Clone a new table from EMPLOYEE table.
select *
into emplnew
from empl

select*
from emplnew

--19. DISPLAY the TOP 2 highest salary from a table.
select distinct top 2 salary
from empl
order by Salary desc

--20. DISPLAY the list of employees with the same salary.

select employee_id,First_name,salary,count(*)
over(partition by salary order by salary) 
from empl

 --21. Display the second highest salary from a table.
select max(salary) from empl
where Salary<( select max (salary) from empl)

--22 Display the first 50% records from a table.
select top 50 percent * 
from empl

--23. Display the departments that have less than 4 people in it.
select department,count('id') as total_employees
from empl
group by department having count('id')<4
  
--24. Display all departments along with the number of people in there.
select department,count(*) as "total_ employee"
from empl
group by department

--25 Display the name of employees having the highest salary in each department.

  select department,MAX(salary)
  from empl
  group by Department

--26 Display the names of employees who earn the highest salary.

select top 3 First_Name,Salary from empl order by Salary desc

--27 Display the average salaries for each department

select department,AVG(salary)
from empl
group by department

--28 display the name of the employee who has got maximum bonus
select top  2 bonus_amount from emply_Bonus order by bonus_amount desc


--29 Display the first name and title of all the employee

select  e.first_name,t.em_title from empl
as  e left join employ_title as t
on e.First_Name=t.em_title


-----only 29 records given as per the assignmenment given
----no.15 is missing after no.14 from assigment.

 
 
 











