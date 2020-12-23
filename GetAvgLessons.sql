SELECT q.year AS "Year",
    COALESCE(q.type, 'ALL') AS "Type of Lesson",
    ROUND(q.avg, 2) AS "Number of Lessons"
FROM (
    SELECT TO_CHAR(m.start_time, 'YYYY') AS year, 
        m.type AS type,
        COUNT(*) /12.0 AS avg,
        MIN(m.start_time) AS time
    FROM music_lesson AS m
    GROUP BY 
        year,
        ROLLUP (m.type)
    ) AS q
ORDER BY q.time;