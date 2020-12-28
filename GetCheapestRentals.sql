SELECT DISTINCT ri.name AS "Instrument",
    ri.fee_per_month AS "Fee per month",
    COUNT(ri.instrument_id) FILTER (WHERE r.terminated IS NOT false) AS "Available for rent",
    COALESCE((
            SELECT ml.start_time
            FROM music_lesson AS ml
            RIGHT JOIN group_lesson AS gl
            ON ml.music_lesson_id = gl.music_lesson_id
            WHERE gl.instrument_id = ri.instrument_id 
                AND ml.start_time > NOW()
            LIMIT 1
            )
        ) AS "Next group lesson"
FROM rental_instrument AS ri
NATURAL LEFT OUTER JOIN rental AS r
GROUP BY (ri.name, ri.fee_per_month, ri.instrument_id)
ORDER BY ri.fee_per_month
LIMIT 3;