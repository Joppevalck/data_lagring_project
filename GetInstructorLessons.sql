SELECT p.first_name AS instructor,
    TO_CHAR(m.start_time, 'Month') AS month,
    COUNT(*) AS count
FROM music_lesson AS m
INNER JOIN person AS p 
ON m.person_id = p.person_id
GROUP BY instructor,
    month
HAVING COUNT(*) > 1 
ORDER BY instructor;
