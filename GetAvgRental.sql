SELECT TO_CHAR(r.rental_date, 'YYYY') AS "Year", 
    ROUND(COUNT(*) / 12.0, 2) AS "Average rentals per month"
FROM rental AS r 
GROUP BY "Year";