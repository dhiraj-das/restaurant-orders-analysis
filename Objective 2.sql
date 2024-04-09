-- Objective 2 - Explore the orders table

-- View the order_details table. What is the date range of the table?
select * from order_details;
select 
	min(order_date) as min_date,
    max(order_date) as max_date
from order_details;

-- How many orders were made within this date range? How many items were ordered within this date range?
select 
    count(distinct order_id) as order_count, 
    count(item_id) as item_count
from order_details;


-- Which orders had the most number of items?
select
	order_id,
    count(item_id) as item_count
from order_details
group by 1
order by count(item_id) desc;


-- How many orders had more than 12 items?
select
	order_id,
    count(item_id) as item_count
from order_details
group by 1
having count(item_id) > 12