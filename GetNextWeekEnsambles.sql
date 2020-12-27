SELECT TO_CHAR(m.start_time, 'Day') AS "Weekday",
    INITCAP(e.target_genre) AS "Genre",
    CASE
           WHEN COUNT(sm.student_id) >= e.max_atendees
                THEN 'FULL'
           WHEN COUNT(sm.student_id) >= e.max_atendees - 2 
                THEN '1-2 SEATS LEFT'
           WHEN e.max_atendees - 2 > COUNT(sm.student_id) THEN 'MORE THAN 2 SEATS LEFT'
       END "Seats"
FROM music_lesson AS m 
INNER JOIN ensamble AS e 
ON m.music_lesson_id = e.music_lesson_id 
INNER JOIN student_music_lesson AS sm 
ON sm.music_lesson_id = e.music_lesson_id
WHERE m.start_time BETWEEN NOW() AND NOW() + interval '1 week'
GROUP BY (m.start_time, e.target_genre, e.max_atendees)
ORDER BY (m.start_time, e.target_genre);
