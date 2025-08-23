use 1stdb;
select * from pizza_sales;
-- Total Revenue
select cast(sum(total_price) as decimal(10,2)) as Total_Revenue from pizza_sales; 
-- Total Orders
select count(distinct order_id) as Total_orders from pizza_sales ;
-- Average Order Value
select cast(sum(total_price)  / count(distinct order_id)as decimal(10,2)) as Average_order_val from pizza_sales ;
-- Total Pizza sold
select sum(quantity) as Total_pizza_sold from pizza_sales ;
-- Total Revenue by Pizza size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Pizzasales_bysize from pizza_sales group by pizza_size;
-- Revenue from most selling pizza
select cast(sum(total_price) as decimal(10,2)) as Total_revenue ,max(pizza_category) as Most_Selling_pizza from pizza_sales group by pizza_category;
-- maximum quantity of pizza sold
select max(quantity) from pizza_sales;
-- Minimum selling pizza
select min(pizza_category) as Worst_Selling_pizza from pizza_sales;
-- average pizza per order 
select cast(cast(sum(quantity) as decimal (10,2))/ cast(count(distinct order_id)as decimal(10,2)) as decimal(10,2))as Average_order_perpizza from pizza_sales;
-- daily trend for total orders
select date_format(order_date,'%W') as Order_day , count(distinct order_id) as Total_orders from pizza_sales group by date_format(order_date,'%W') order by Total_orders;
-- monthly trend for orders
select date_format(order_date,'%M') as Order_month , count(distinct order_id) as Total_orders from pizza_sales group by date_format(order_date,'%M') ;
-- % sales by pizza category 
select pizza_category , cast(sum(total_price) as decimal(10,2)) as Total_revenue , cast(sum(total_price) * 100 / (select(sum(total_price)) from pizza_sales) as decimal(10,2)) as Percentage from pizza_sales group by pizza_category;
--  % sales by pizza size
select pizza_size , cast(sum(total_price) as decimal(10,2)) as Total_revenue , cast(sum(total_price) * 100 / (select(sum(total_price)) from pizza_sales) as decimal(10,2)) as Percentage from pizza_sales group by pizza_size order by pizza_size;
-- Total pizza sold by pizza category in specific month
select pizza_category, sum(quantity) as Total_pizza_sold from pizza_sales where month(order_date)= 2  group by pizza_category;
-- Top 5 pizza by Revenue 
select pizza_name, sum(total_price) as Total_revenue from pizza_sales group by pizza_name order by Total_revenue desc limit 5;
-- Bottom 5 pizza by Revenue
select pizza_name, sum(total_price) as Total_revenue from pizza_sales group by pizza_name order by Total_revenue asc limit 5;
-- Top 5 pizza by Orders
select pizza_name, count(distinct order_id) as Total_orders from pizza_sales group by pizza_name order by Total_orders desc limit 5;
-- Bottom 5 pizza by orders
select pizza_name, count(distinct order_id) as Total_orders from pizza_sales group by pizza_name order by Total_orders asc limit 5;
-- Top 5 pizza by Quantity
select pizza_name, sum(quantity) as Total_pizzas from pizza_sales group by pizza_name order by Total_pizzas desc limit 5;
-- Bottom 5 pizza by Quantity
select pizza_name, sum(quantity) as Total_pizzas from pizza_sales group by pizza_name order by Total_pizzas asc limit 5;
select max(pizza_category) as Most_Selling_pizza from pizza_sales;