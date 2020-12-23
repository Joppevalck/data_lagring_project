SELECT q.first AS "First name of Instructor",
    q.last AS "Last name",
    TO_CHAR(q.time, 'Month') AS "Month",
    COUNT(*) AS "Count"
FROM (
    SELECT p.first_name AS first,
        p.last_name AS last,
        m.start_time AS time,
        COUNT(*) AS count
    FROM music_lesson AS m
    INNER JOIN person AS p 
    ON m.person_id = p.person_id
    GROUP BY (first, last),
        time
    HAVING EXTRACT(MONTH FROM m.start_time) >= EXTRACT(MONTH FROM NOW()) - 1
    ) AS q
GROUP BY ("First name of Instructor", "Last name"),
        "Month"
ORDER BY "Count" DESC
LIMIT 3;
