-- What is the total amount each customer spent at the restaurant?

SELECT 
    s.customer_id, 
    SUM(m.price) as total_amount 
FROM dannys_diner.sales AS s
JOIN 
    dannys_diner.menu AS m ON m.product_id = s.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id