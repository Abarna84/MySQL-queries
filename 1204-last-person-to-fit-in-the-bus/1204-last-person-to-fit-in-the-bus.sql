# Write your MySQL query statement below
WITH CTE1 as
(
select person_name,turn, weight, sum(weight) over (order by turn) as totalweight 
  from queue
)
select person_name from cte1
where totalweight <= 1000
order by totalweight DESC
limit 1;

