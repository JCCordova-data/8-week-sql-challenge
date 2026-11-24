-- Which item was purchased first by the customer after they became a member?

WITH first_item AS (
    SELECT
        s.customer_id,
        m.product_name,
        DENSE_RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS rank
    FROM dannys_diner.sales AS s
    JOIN dannys_diner.menu AS m ON m.product_id = s.product_id
    JOIN dannys_diner.members AS mem ON mem.customer_id = s.customer_id
    WHERE s.order_date >= mem.join_date
)

SELECT
    customer_id,
    product_name
FROM first_item
WHERE rank = 1
GROUP BY customer_id, product_name