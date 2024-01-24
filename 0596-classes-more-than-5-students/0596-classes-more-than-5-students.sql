# Write your MySQL query statement below
with cte1 as
(
select class, count(distinct student) as studcount
from courses
group by class
having studcount >= 5
)
select class from cte1