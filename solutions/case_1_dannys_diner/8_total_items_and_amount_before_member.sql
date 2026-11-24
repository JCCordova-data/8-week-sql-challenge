-- What is the total items and amount spent for each member before they became a member?

SELECT mem.customer_id, COUNT(*) AS total_items, SUM(m.price) AS total_spent FROM dannys_diner.menu AS m
JOIN dannys_diner.sales AS s ON s.product_id = m.product_id
JOIN dannys_diner.members AS mem ON mem.customer_id = s.customer_id
WHERE s.order_date < mem.join_date
GROUP BY mem.customer_id
ORDER BY mem.customer_id