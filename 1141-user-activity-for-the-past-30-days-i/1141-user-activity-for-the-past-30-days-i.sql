# Write your MySQL query statement below
select activity_date as day, 
       count(distinct user_id) as active_users
  from activity
 where activity_date <= '2019-07-27' and 
       activity_date  > DATE_ADD('2019-07-27', INTERVAL -30 DAY) 
group by activity_date
