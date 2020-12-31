SELECT q.year AS "Year",
    COALESCE(q.instrument, 'ALL') AS "Instrument",
    q.rentals AS "Average rentals per month"
FROM (
    SELECT rental_instrument.name AS instrument,
    ROUND(COUNT(*) / 12.0, 2) AS rentals,
    TO_CHAR(r.rental_date, 'YYYY') AS year
    FROM rental AS r 
    INNER JOIN rental_instrument ON r.rental_instrument_id = rental_instrument.rental_instrument_id
    GROUP BY
        year,
        ROLLUP (instrument)
) AS q
ORDER BY q.year, q.rentals DESC;
