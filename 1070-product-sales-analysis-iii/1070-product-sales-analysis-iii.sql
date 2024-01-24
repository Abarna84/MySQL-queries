# Write your MySQL query statement below
with cte1 as
(
    select s.product_id as product_id,min(s.year) as first_year
      from sales s join product p
        on s.product_id = p.product_id
  group by s.product_id
)
select cte1.product_id ,first_year, ss.quantity,ss.price
  from cte1 join sales ss
    on cte1.product_id = ss.product_id
 where ss.year = first_year