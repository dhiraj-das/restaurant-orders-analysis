-- Objective 3 - Analyze customer behavior

-- Combine the menu_items and order_details tables into a single table
select *
from order_details a
left join menu_items b
on a.item_id = b.menu_item_id;

-- What were the least and most ordered items? What categories were they in?
select 
	item_name,
    category,
    count(menu_item_id) as item_count
from order_details a
inner join menu_items b
on a.item_id = b.menu_item_id
group by item_name, category
order by item_count;


-- What were the top 5 orders that spent the most money?
select
	order_id,
    sum(price)
from order_details a
left join menu_items b
on a.item_id = b.menu_item_id
group by 1
order by 2 desc
limit 5;

-- View the details of the highest spend order. Which specific items were purchased?
-- BONUS: View the details of the top 5 highest spend orders

with top_5_orders as (
	select
		order_id,
		sum(price)
	from order_details a
	left join menu_items b
	on a.item_id = b.menu_item_id
	group by 1
	order by 2 desc
	limit 5
)

select 
* 
from order_details a
inner join menu_items b
on a.item_id = b.menu_item_id
where order_id in (select order_id from top_5_orders);