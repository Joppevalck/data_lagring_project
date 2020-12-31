CREATE OR REPLACE VIEW InstructorAmontOfLessons AS 
SELECT m.instructor_id AS "Instructor ID",
    p.first_name AS "First name of Instructor",
    p.last_name AS "Last name",
    'CURRENT MONTH' AS "Month",
    COUNT(*) AS "Count"
FROM music_lesson AS m
INNER JOIN person AS p 
ON m.person_id = p.person_id 
WHERE EXTRACT(MONTH FROM m.start_time) = EXTRACT(MONTH FROM NOW())
GROUP BY ("Instructor ID", "First name of Instructor", "Last name", "Month")
HAVING COUNT(*) > 0

UNION
(
    SELECT m.instructor_id AS "Instructor ID",
        p.first_name AS "First name of Instructor",
        p.last_name AS "Last name",
        'LAST MONTH' AS "Month",
        COUNT(*) AS "Count"
    FROM music_lesson AS m
    INNER JOIN person AS p 
    ON m.person_id = p.person_id
     WHERE EXTRACT(MONTH FROM m.start_time) = EXTRACT(MONTH FROM NOW() - interval '1 month')
    GROUP BY ("Instructor ID", "First name of Instructor", "Last name", "Month")
    ORDER BY "Count" DESC
    LIMIT 3
)
ORDER BY "Count" DESC 
;
