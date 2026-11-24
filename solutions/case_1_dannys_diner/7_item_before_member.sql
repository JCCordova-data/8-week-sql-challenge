-- Which item was purchased just before the customer became a member?

WITH item_before_member AS (
    SELECT
        s.customer_id,
        m.product_name,
        DENSE_RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date DESC) AS rank
    FROM dannys_diner.sales AS s
    JOIN dannys_diner.menu AS m ON m.product_id = s.product_id
    JOIN dannys_diner.members AS mem ON mem.customer_id = s.customer_id
    WHERE s.order_date < mem.join_date
)

SELECT
    customer_id,
    product_name
FROM item_before_member
WHERE rank = 1
GROUP BY customer_id, product_name