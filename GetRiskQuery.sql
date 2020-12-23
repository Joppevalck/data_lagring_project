SELECT m.instructor_id AS "Instructor ID",
    p.first_name AS "First name of Instructor",
    p.last_name AS "Last name",
    COUNT(*) AS "Count"
FROM music_lesson AS m
INNER JOIN person AS p 
ON m.person_id = p.person_id
 WHERE EXTRACT(MONTH FROM m.start_time) >= EXTRACT(MONTH FROM NOW()) - 1
GROUP BY ("Instructor ID", "First name of Instructor", "Last name")
HAVING COUNT(*) > 1

UNION
(
    SELECT m.instructor_id AS "Instructor ID",
        p.first_name AS "First name of Instructor",
        p.last_name AS "Last name",
        COUNT(*) AS "Count"
    FROM music_lesson AS m
    INNER JOIN person AS p 
    ON m.person_id = p.person_id
     WHERE EXTRACT(MONTH FROM m.start_time) >= EXTRACT(MONTH FROM NOW()) - 1
    GROUP BY ("Instructor ID", "First name of Instructor", "Last name")
    ORDER BY "Count" DESC
    LIMIT 3
)
ORDER BY "Count" DESC 
;
