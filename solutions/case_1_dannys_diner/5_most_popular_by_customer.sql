-- Which item was the most popular for each customer?

WITH most_popular AS (
    SELECT
        s.customer_id,
        m.product_name,
        DENSE_RANK() OVER (PARTITION BY s.customer_id ORDER BY COUNT(m.product_id) DESC) AS rank
    FROM dannys_diner.menu AS m
    JOIN dannys_diner.sales AS s ON s.product_id = m.product_id
    GROUP BY s.customer_id, m.product_name
)
SELECT customer_id, product_name FROM most_popular
WHERE rank = 1
GROUP BY customer_id, product_name