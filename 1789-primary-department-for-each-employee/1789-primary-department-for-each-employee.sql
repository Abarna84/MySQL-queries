# Write your MySQL query statement below
SELECT employee_id,department_id FROM employee
 WHERE primary_flag = 'Y'
GROUP BY employee_id
UNION
SELECT employee_id, department_id FROM Employee 
GROUP BY employee_id
HAVING COUNT(employee_id) = 1
ORDER BY employee_id