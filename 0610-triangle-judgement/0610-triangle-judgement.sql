# Write your MySQL query statement below
SELECT *, 
  CASE WHEN x<y+z and y<x+z and z<x+y then "Yes" else "No" END as triangle
  FROM Triangle