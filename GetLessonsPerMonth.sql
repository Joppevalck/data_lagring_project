CREATE VIEW LessonsPerMonth AS 
SELECT COALESCE(q.month, 'ALL') AS "Month",
    COALESCE(q.type, 'ALL') AS "Type of Lesson",
    q.count AS "Number of Lessons"
FROM (
    SELECT TO_CHAR(m.start_time, 'Month') AS month, 
        m.type AS type,
        COUNT(*) AS count,
        MIN(m.start_time) AS time
    FROM music_lesson AS m
    GROUP BY 
        ROLLUP (month),
        ROLLUP (m.type)
    ) AS q
ORDER BY q.time;