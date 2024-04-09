-- Objective 1 - Explore the items table

-- View the menu_items table and write a query to find the number of items on the menu
select count(*) 
from menu_items;

-- Ans: 32

-- What are the least and most expensive items on the menu?
select 
	min(price) as least_expensive,
    max(price) as most_expensive
from 
menu_items;
-- Least expensive: $5.00 & Most expensive: $19.95

-- How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?

select
	category,
    count(*),
	min(price) as least_expensive,
    max(price) as most_expensive
from menu_items
group by category;

-- Ans: 9 items, 14.50 least expensive and 19.95 most expensive

-- How many dishes are in each category? What is the average dish price within each category?
select
	category,
    count(*),
	avg(price) as avg_price
from menu_items
group by category;
