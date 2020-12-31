SELECT COALESCE(q.type, 'ALL') AS "Type of Lesson",
    ROUND(q.avg, 2) AS "Number of Lessons"
FROM (
    SELECT m.type AS type,
        COUNT(*) /12.0 AS avg,
        MIN(m.start_time) AS time
    FROM music_lesson AS m
    GROUP BY 
        ROLLUP (m.type)
    ) AS q
ORDER BY q.time;