Select * from pizza_sales;

--Total Revenue--
SELECT SUM(total_price) as Total_Revenue
FROM pizza_sales;

--Average Order value--
SELECT SUM(total_price)/ COUNT(DISTINCT order_id) as Avg_Order_Value
FROM pizza_sales;

--Total Pizza Sold--
SELECT SUM(quantity) as Total_Pizza_Sold
FROM pizza_sales;

--Total Orders--
SELECT COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales;

--Average Pizzas Per Order--

SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/
CAST(COUNT(Distinct order_id)AS decimal (10,2)) as decimal (10,2))as avg_pizza_per_order
FROM pizza_sales;

--Daily trend for Total Orders--
SELECT DATENAME(dw, order_date) as order_day, COUNT(distinct order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(dw, order_date);

--Monthly trends for Total Orders--

SELECT DATENAME(MONTH, order_date) as order_day, COUNT(distinct order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC;

--Percentage of sales by Pizza Category--

SELECT pizza_category, CAST(sum(total_price) as decimal (10,2))as Total_revenue, 
CAST(sum(total_price)*100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as Percent_of_sales
FROM pizza_sales
GROUP BY pizza_category;

--Percentage of pizza sales by pizza size--

SELECT pizza_size, CAST(SUM(total_price) as decimal(10,2)) as Total_revenue, 
CAST(SUM(total_price)*100 / (SELECT SUM(total_price) from pizza_sales)as decimal (10,2)) as Percent_of_sales
FROM pizza_sales
GROUP BY pizza_size; 

--Total pizza sold by pizza category--

SELECT pizza_category, SUM(quantity) as total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category;

--TOP 5 best sellers Pizza by revenue--

SELECT top 5 pizza_name, SUM(total_price)as total_revenue, SUM(quantity) as total_qty
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;

--Bottom 5 by revenue--
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue;

--TOP 5 best sellers Pizza by total quantity--
SELECT top 5 pizza_name, SUM(quantity) as total_qty
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_qty DESC;

--Bottom 5 by qty--
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;

--TOP 5 best sellers Pizza by total orders--
SELECT top 5 pizza_name, COUNT(distinct order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC;

--Bottom 5 by total orders-- 
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;
