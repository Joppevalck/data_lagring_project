SELECT
CASE 
    WHEN q.t = true THEN false
    WHEN q.t = false THEN true
END as available
FROM (
    SELECT r.terminated AS t
    FROM rental as r
    WHERE r.rental_instrument_id = 13
    GROUP BY r.terminated, r.rental_date
    ORDER BY r.rental_date DESC
    LIMIT 1
) AS q
GROUP BY q.t;