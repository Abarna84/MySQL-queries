# Write your MySQL query statement below
select IFNULL(eu.unique_id,null) as unique_id ,e.name name
from employees e left outer join employeeuni eu
on e.id=eu.id
