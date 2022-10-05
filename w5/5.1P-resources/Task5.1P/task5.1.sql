use SIT103;
/* Query 1 Write a SQL query to retrieve names (displayed as “Employee Name”) and salary of employees. 
[Relevant table: Works] */
select employeeName, salary
from works
order by employeename;

/* Query 2 Write a SQL query to list name, street, and city of employees in descending order by their names. 
[Relevant table: Employee] */
select concat(employeename, 'address: ' ,street, ', ', city) as employee_address
from employee
order by employeeName;

/* Query 3 Write a SQL query to get a list of unique streets from the Employee table. 
[Relevant table: Employee]*/
select distinct street
from employee
order by street;

/* Query 4 Write a SQL query to list all records in the works table in descending order of company names and within a company in ascending order by employee name.
 [Relevant table: Works] */
 select companyName, employeeName
 from works
 order by companyName desc, employeeName desc;
 
 /* Query 5 Write a SQL query to list name and salary of all employees who work in Meyer and sort the records in
ascending order by their incomes. [Relevant table: Works] */
select employeeName, salary
from works
where companyName ='Meyer'
order by salary asc;

/* Query 6 Assuming that the salary in the Works table is annual salary, write a SQL query to retrieve names (displayed as “Employee Name”) 
and monthly salary as “Monthly Salary” of employees. [Relevant table: Works] */
select employeeName,(salary/12) as monthly_salary
from works
order by monthly_salary;

/* Query 7 Write a SQL query to list names and salaries of all employees who work in Meyer and earn more than 20000.
 [Relevant table: Works] */
 select employeeName, salary
 from works
 where companyName ='Meyer' and salary>20000
 order by salary;
 
 /* Query 8 Write a SQL query to list names and companies of the employees who earn in the range of 20000 to 25000 (inclusive). 
 [Relevant table: Works]*/
 select employeeName, salary
 from works
 where salary between 20000 and 25000;
 
 /* Query 9 Write a SQL query to list names of employees whose managers have “ll” (double ls) in their names.
 [Relevant table: Manages]*/
 select employeeName, managerName
 from manages
 where managerName like '%ll%';
 
 /* Query 10 Write a SQL query to list company names and the average salary of their employees. 
 [Relevant table: Works] */
 select companyName, avg(salary)
 from works
 group by companyName
 order by companyName;
 
 /* Query 11 Write a SQL query to list the name of the companies with average salary of employees more than or equal to 20000. 
 [Relevant table: Works] */
 select companyName, avg(salary) as avg_salary
 from works
 group by companyName
 having avg_salary >= 20000
 order by companyName;
 
 /* Query 12 Write a SQL query to select details of the employees who works in companies located in Rye.
 [Relevant tables: Works and Company; Hint: use a subquery] */
 select employeeName, companyName
 from works
 where companyName in (select companyName
                       from company
					   where city = 'Rye');
 
 /* Query 13 Write a SQL query find the number of rows in the Manages table. 
 [Relevant tables: Manages; Hint: use COUNT()] */
 select count(*) as number_of_rows
 from manages;
 
 /* Query 14 Write a SQL query to find the name and company of the employee earning the highest salary. [Relevant tables: Works; Hint: use a subquery using max()
 to find the highest salary. Please do not use ‘WHERE salary=25000’
 as it is the highest salary in this case.
 Hope you can understand that it is not possible if there are millions of records.
 We want you to learn how to find it with a query.] */
select max(salary)
from works;

select
      companyName,employeeName, salary
from
      works
where
      salary =(select
               max(salary)
               from
                   works);




