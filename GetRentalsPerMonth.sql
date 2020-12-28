CREATE VIEW InstrumentsRentedPerMonth AS 
SELECT COALESCE(q.month, 'TOTAL') AS "Month", 
COALESCE(q.instrument, 'ALL') AS "Instrument",
q.count AS "Count of rentals"
FROM (
    SELECT TO_CHAR(r.rental_date, 'Month') AS month,
    rental_instrument.name AS instrument,
    COUNT(*) AS count
    FROM rental AS r 
    INNER JOIN rental_instrument ON r.rental_instrument_id = rental_instrument.rental_instrument_id
    WHERE EXTRACT(YEAR FROM rental_date) = 2020 
    GROUP BY
    ROLLUP (month),
    ROLLUP (rental_instrument.name)
) AS q
ORDER BY q.count DESC;