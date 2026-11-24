-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, 
-- not just sushi - how many points do customer A and B have at the end of January?

SELECT
    mem.customer_id,
    SUM(
        CASE
            WHEN s.order_date >= mem.join_date AND s.order_date <= mem.join_date + INTERVAL '6 days' THEN m.price * 20
            WHEN m.product_name = 'sushi' THEN m.price * 20
            ELSE m.price * 10
        END
    ) AS total_points
FROM dannys_diner.sales AS s
JOIN dannys_diner.menu AS m ON m.product_id = s.product_id
JOIN dannys_diner.members AS mem ON mem.customer_id = s.customer_id
WHERE s.order_date <= '2021-01-31'
GROUP BY mem.customer_id
ORDER BY mem.customer_id 