-- How many days has each customer visited the restaurant?

SELECT s.customer_id, COUNT(DISTINCT s.order_date) AS days_visited
FROM dannys_diner.sales AS s
GROUP BY s.customer_id
ORDER BY s.customer_id