# Write your MySQL query statement below
with cte_min
as
(
    select  customer_id, min(order_date) as OrderDate from Delivery
    group by customer_id
),
cte_dt
as
(   
    select distinct d.customer_id, 
    Case when d.order_date = d.customer_pref_delivery_Date Then 'Immediate' Else 'Scheduled' End as OrderType 
     from Delivery d inner join cte_min 
       on cte_min.customer_id = d.customer_id and cte_min.orderDate = d.order_date
),
cte_sum
as
(
Select sum(if(orderType = 'Immediate', 1, 0)) as SumImm, 
       count(distinct customer_id) as countCust from cte_dt
)
select Round((sumImm *100 /countCust), 2) as Immediate_percentage from cte_sum

