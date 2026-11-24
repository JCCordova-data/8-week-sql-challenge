-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT
    s.customer_id,
    SUM(
        CASE
            WHEN m.product_name = 'sushi' THEN m.price * 20
            ELSE m.price * 10
        END
    ) AS total_points
FROM dannys_diner.sales AS s
JOIN dannys_diner.menu AS m ON m.product_id = s.product_id
GROUP BY s.customer_id
ORDER BY customer_id