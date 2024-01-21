# Write your MySQL query statement below
with cte1 as
(
  SELECT a.user_id,
           CASE WHEN b.action = 'confirmed' THEN 1 ELSE 0 END AS confirmed_user,
           CASE WHEN b.action = 'timeout' THEN 1 ELSE 0 END AS timeout_user
    FROM Signups a LEFT JOIN Confirmations b 
      ON a.user_id = b.user_id  
),
cte2 AS (
    SELECT user_id, 
           SUM(confirmed_user) AS total_confirmed,
           SUM(timeout_user) AS total_timeout,
           SUM(confirmed_user + timeout_user) AS total_request
    FROM cte1
    GROUP BY user_id
)
SELECT user_id, 
       ROUND(SUM(IFNULL(total_confirmed / total_request, 0)), 2) AS CONFIRMATION_RATE
FROM cte2
GROUP BY user_id;
