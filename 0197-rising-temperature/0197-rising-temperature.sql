# Write your MySQL query statement below
select id from weather w
where w.temperature > (select temperature from weather w1
where w1.recorddate = DATE_ADD(w.recorddate, INTERVAL -1 DAY)); 