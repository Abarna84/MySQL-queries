# Write your MySQL query statement below
with cte1 as
(
    select player_id, min(event_date) as first_login
      from activity
  group by player_id
)
select 
ROUND(SUM(If(a.event_date in (DATE_ADD(first_login, INTERVAL 1 DAY)), 1,0))/ (count(distinct a.player_id)),2) as fraction
  from cte1 c join activity a   
    on c.player_id = a.player_id