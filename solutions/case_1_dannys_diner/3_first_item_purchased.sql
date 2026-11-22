-- What was the first item from the menu purchased by each customer?

WITH ranked_sales AS (
    SELECT
        s.customer_id,
        s.order_date,
        m.product_name,
        DENSE_RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS rank
    FROM dannys_diner.sales AS s
    JOIN dannys_diner.menu AS m ON m.product_id = s.product_id
)
SELECT customer_id, product_name FROM ranked_sales
WHERE rank = 1
GROUP BY customer_id, product_name
ORDER BY customer_id, product_name