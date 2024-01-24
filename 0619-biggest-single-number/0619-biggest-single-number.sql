# Write your MySQL query statement below
with cte1 as
(
select num, count(*) as num_count 
  from MyNumbers 
group by num
)
select max(num) as num from cte1
where num_count = 1