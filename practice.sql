select * from shashi where salary=
(select distinct salary from shashi order by salary desc limit 1,1);

select sum(salary) as total,name,group_concat(id)as id,count(name)as
 occurence from shashi s group by name having occurence>=2 and total>200;

select distinct tt from(
select count(name)as tt,name from shashi group by name order by tt desc) bb limit 1,1;

select * from shashi;

select * from shashi_1;

update shashi_1 set name='r_1' where Id=8;

create table shashi_1(select * from shashi);

delete from  shashi where id in(12,17);

insert into shashi(Id,name)values(17,'chandra');

select IFNULL(salary,1200) as salary from shashi where Id in(16,17);

select * from shashi
INTERSECT
select * from shashi_1;
