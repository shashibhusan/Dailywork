#Write a query to get nth highest salary from table.

SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT n-1,1;

#Use the following generic method to find nth highest salary without using TOP or limit.

SELECT Salary
FROM Worker W1
WHERE n-1 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
#Write an SQL query to fetch the list of employees with the same salary.

Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

#Write an SQL query to show the second highest salary from a table

Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

#Delete duplicate record from database 

#Method 1:-

DELETE t1 FROM contacts t1
INNER JOIN contacts t2 
WHERE 
    t1.id < t2.id AND 
    t1.email = t2.email;

#Method 2:-

DELETE s1 FROM students s1
INNER JOIN students s2 
WHERE s1.id < s2.id AND 
s1.first_name = s2.first_name;

#How to get 2nd highest department name

select distinct total  from 
(SELECT  count(*) as 'total',d.dname FROM emp e left join dept d on e.eid=d.eid group by d.dname order by total asc)
as abc limit 1,1;

#Getting all the department with 2nd highest department count 

SELECT d.dname , count(*) as 't' FROM emp e left join dept d on e.eid=d.eid group by d.dname having t=(
select distinct total  from (
SELECT  count(*) as 'total',d.dname FROM emp e left join dept d on e.eid=d.eid group by d.dname order by total asc)
as abc limit 1,1
);



