SELECT TO_CHAR(r.rental_date, 'Month') AS "Month", 
COUNT(*) AS "Count of rentals"
FROM rental AS r 
WHERE EXTRACT(YEAR FROM rental_date) = 2020 
GROUP BY "Month"
ORDER BY "Count of rentals" DESC;