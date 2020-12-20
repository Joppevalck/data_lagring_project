BEGIN;

INSERT INTO person (person_id, person_number, first_name, last_name, zip, street, city)
VALUES  (DEFAULT, '200005254567', 'Johannes', 'Valck', '12345', 'Hejgränd 40', 'JÄRFÄLLA'),
        (DEFAULT, '200311264987', 'Calle', 'Callberg', '46064', 'Valldammsgatan 77', 'FRÄNDEFORS'),
        (DEFAULT, '196705212170', 'Alexander', 'Gustavsson', '27022', 'Anders Sadelmakares Gränd 71', 'KÖPINGEBRO'),
        (DEFAULT, '199903046969', 'Wille', 'Asp', '54573', 'Södra Kroksdal 20', 'TÖREBODA'),
        (DEFAULT, '200007084200', 'Victor', 'Pettersson', '17777', 'Snubbvägen 29', 'SNUBBSTAD'),
        (DEFAULT, '199211129999', 'Simpe', 'Pimpe', '65758', 'Sundbybrovägen 69', 'SUNDBYBERG')
        ;

INSERT INTO student (student_id, person_id)
VALUES  (DEFAULT, 1),
        (DEFAULT, 4),
        (DEFAULT, 5),
        (DEFAULT, 6)
        ;
    
INSERT INTO instructor (instructor_id, person_id)
VALUES  (DEFAULT, 2),
        (DEFAULT, 3)
        ;

INSERT INTO music_lesson (music_lesson_id, price, type, level, start_time, end_time, instructor_id, person_id)
VALUES  (DEFAULT, 150, 'individual', 'intermediate', 2020-01-08 12:00:00 , 2020-01-08 13:00:00, 1, 2),
        (DEFAULT, 100, 'group', 'beginner', 2020-01-10 12:00:00, 2020-01-10 14:00:00, 1, 2),
        (DEFAULT, 100, 'group', 'advanced', 2020-02-01 10:00:00, 2020-02-01 12:00:00, 2, 3),
        (DEFAULT, 75, 'ensamble', 'advanced', 2020-02-03 16:00:00, 2020-02-03 18:00:00, 2, 3),
        (DEFAULT, 150, 'individual', 'beginner', 2020-02-13 16:00:00, 2020-02-13 17:00:00, 1, 2),
        (DEFAULT, 100, 'group', 'beginner', 2020-02-14 17:00:00, 2020-02-14 19:00:00, 2, 3),
        (DEFAULT, 150, 'individual', 'beginner', 2020-02-18 18:00:00, 2020-02-18 19:00:00, 1, 2),
        (DEFAULT, 100, 'group', 'beginner', 2020-03-03 16:00:00, 2020-03-03 18:00:00)
        ;

INSERT INTO ensamble (ensamble_id, music_lesson_id, max_atendees, min_atendees, target_genre)
VALUES  (DEFAULT, 4, 30, 10, 'punk')
        ;

COMMIT;