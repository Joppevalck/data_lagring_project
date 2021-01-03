SELECT COALESCE(q.terminated, true)
FROM (
    SELECT ri.rental_instrument_id, r.terminated
    FROM rental_instrument AS ri 
    NATURAL LEFT OUTER JOIN rental AS r
    ORDER BY r.rental_date DESC
) AS q
WHERE q.rental_instrument_id = 9
LIMIT 1;