INSERT INTO school (school_id, max_students, min_students, min_age, zip, street, city)
VALUES  (DEFAULT, 100, 10, 12, '42069', 'partajvägen 69', 'UMEÅ')
        ;

INSERT INTO person (person_id, person_number, first_name, last_name, zip, street, city)
VALUES  (DEFAULT, '200005254567', 'Johannes', 'Valck', '12345', 'Hejgränd 40', 'JÄRFÄLLA'),
        (DEFAULT, '200311264987', 'Calle', 'Callberg', '46064', 'Valldammsgatan 77', 'FRÄNDEFORS'),
        (DEFAULT, '196705212170', 'Alexander', 'Gustavsson', '27022', 'Anders Sadelmakares Gränd 71', 'KÖPINGEBRO'),
        (DEFAULT, '199903046969', 'Wille', 'Asp', '54573', 'Södra Kroksdal 20', 'TÖREBODA'),
        (DEFAULT, '200007084200', 'Victor', 'Pettersson', '17777', 'Snubbvägen 29', 'SNUBBSTAD'),
        (DEFAULT, '199211129999', 'Simpe', 'Pimpe', '65758', 'Sundbybrovägen 69', 'SUNDBYBERG'),
        (DEFAULT, '177012171234', 'Ludwig', 'van Beethoven', '67890', 'Zentralfriedhof Wien 100', 'WIEN'),
        (DEFAULT, '195311240007', 'James', 'Bond', '00707', 'Spystreet (00)7', 'SPYCITY')
        ;

INSERT INTO student (student_id, person_id)
VALUES  (DEFAULT, 1),
        (DEFAULT, 4),
        (DEFAULT, 5),
        (DEFAULT, 6)
        ;
    
INSERT INTO instructor (instructor_id, person_id)
VALUES  (DEFAULT, 2),
        (DEFAULT, 3),
        (DEFAULT, 7),
        (DEFAULT, 8)
        ;

INSERT INTO instrument (instrument_id, type, name)
VALUES  (DEFAULT, 'String', 'Guitar'),
        (DEFAULT, 'Keyboard', 'Piano'),
        (DEFAULT, 'Percussion', 'Drums'),
        (DEFAULT, 'String', 'Bass'),
        (DEFAULT, 'String', 'Electric guitar'),
        (DEFAULT, 'String', 'Violin'),
        (DEFAULT, 'String', 'Cello'),
        (DEFAULT, 'Woodwind', 'Flute'),
        (DEFAULT, 'Wind', 'Trumpet')
        ;

INSERT INTO rental_instrument (rental_instrument_id, instrument_id, fee_per_month, type, name, school_id)
VALUES  (DEFAULT, 1, 300, 'String', 'Guitar', 1),
        (DEFAULT, 2, 500, 'Keyboard', 'Piano', 1),
        (DEFAULT, 9, 150, 'Wind', 'Trumpet', 1),
        (DEFAULT, 6, 200, 'String', 'Violin', 1),
        (DEFAULT, 3, 500, 'Percussion', 'Drums', 1),
        (DEFAULT, 3, 500, 'Percussion', 'Drums', 1),
        (DEFAULT, 6, 200, 'String', 'Violin', 1),
        (DEFAULT, 1, 300, 'String', 'Guitar', 1),
        (DEFAULT, 9, 150, 'Wind', 'Trumpet', 1),
        (DEFAULT, 8, 100, 'Woodwind', 'Flute', 1),
        (DEFAULT, 1, 300, 'String', 'Guitar', 1),
        (DEFAULT, 3, 500, 'Percussion', 'Drums', 1),
        (DEFAULT, 1, 300, 'String', 'Guitar', 1)
        ;

INSERT INTO rental (rental_id, rental_date, return_date, rental_instrument_id, instrument_id, student_id, person_id, terminated)
VALUES  (DEFAULT, '2020-01-07', '2020-05-07', 1, 1, 1, 1, true),
        (DEFAULT, '2020-01-16', '2021-01-16', 2, 2, 2, 4, false),
        (DEFAULT, '2020-01-21', '2020-07-15', 3, 9, 3, 5, true),
        (DEFAULT, '2020-01-29', '2021-01-29', 4, 6, 4, 6, false),
        (DEFAULT, '2020-03-02', '2021-03-02', 5, 3, 1, 1, false),
        (DEFAULT, '2020-03-23', '2021-03-23', 6, 3, 4, 6, false),
        (DEFAULT, '2020-04-12', '2021-04-12', 7, 6, 3, 5, false),
        (DEFAULT, '2020-05-07', '2021-05-07', 8, 1, 1, 1, false),
        (DEFAULT, '2020-08-02', '2021-08-02', 9, 9, 3, 5, false)
        ;

INSERT INTO music_lesson (music_lesson_id, price, type, level, start_time, end_time, instructor_id, person_id)
VALUES  (DEFAULT, 150, 'individual', 'intermediate', '2020-01-08 12:00:00' , '2020-01-08 13:00:00', 1, 2),
        (DEFAULT, 100, 'group', 'beginner', '2020-01-10 12:00:00', '2020-01-10 14:00:00', 1, 2),
        (DEFAULT, 100, 'group', 'advanced', '2020-02-01 10:00:00', '2020-02-01 12:00:00', 2, 3),
        (DEFAULT, 75, 'ensamble', 'advanced', '2020-02-03 16:00:00', '2020-02-03 18:00:00', 2, 3),
        (DEFAULT, 150, 'individual', 'beginner', '2020-02-13 16:00:00', '2020-02-13 17:00:00', 1, 2),
        (DEFAULT, 100, 'group', 'beginner', '2020-02-14 17:00:00', '2020-02-14 19:00:00', 2, 3),
        (DEFAULT, 150, 'individual', 'beginner', '2020-02-18 18:00:00', '2020-02-18 19:00:00', 1, 2),
        (DEFAULT, 100, 'group', 'beginner', '2020-03-03 16:00:00', '2020-03-03 18:00:00', 2, 3),
        (DEFAULT, 200, 'individual', 'advanced', '2020-03-16 17:00:00', '2020-03-16 19:00:00', 3, 7),
        (DEFAULT, 250, 'individual', 'advanced', '2020-03-17 13:00:00', '2020-03-17 15:00:00', 3, 7),
        (DEFAULT, 100, 'ensamble', 'beginner', '2020-04-16 17:00:00', '2020-04-16 19:00:00', 4, 8),
        (DEFAULT, 100, 'group', 'beginner', '2020-11-03 16:00:00', '2020-11-03 18:00:00', 2, 3),
        (DEFAULT, 200, 'individual', 'advanced', '2020-11-16 17:00:00', '2020-11-16 19:00:00', 3, 7),
        (DEFAULT, 150, 'individual', 'beginner', '2020-11-18 18:00:00', '2020-11-18 19:00:00', 1, 2),
        (DEFAULT, 200, 'individual', 'advanced', '2020-12-16 17:00:00', '2020-12-16 19:00:00', 3, 7),
        (DEFAULT, 200, 'individual', 'advanced', '2020-12-17 17:00:00', '2020-12-17 19:00:00', 3, 7),
        (DEFAULT, 100, 'ensamble', 'beginner', '2020-12-20 17:00:00', '2020-12-20 19:00:00', 4, 8),
        (DEFAULT, 120, 'ensamble', 'intermediate', '2020-12-24 16:00:00', '2020-12-24 19:00:00', 2, 3),
        (DEFAULT, 80, 'ensamble', 'beginner', '2020-12-26 14:00:00', '2020-12-26 16:00:00', 4, 8),
        (DEFAULT, 160, 'ensamble', 'intermediate', '2020-12-28 12:00:00', '2020-12-28 14:00:00', 3, 7),
        (DEFAULT, 160, 'ensamble', 'intermediate', '2020-12-29 12:00:00', '2020-12-29 15:00:00', 3, 7),
        (DEFAULT, 100, 'ensamble', 'intermediate', '2020-12-31 15:00:00', '2020-12-31 17:00:00', 4, 8),
        (DEFAULT, 150, 'ensamble', 'intermediate', '2021-01-1 12:00:00', '2020-01-1 14:00:00', 3, 7),
        (DEFAULT, 120, 'ensamble', 'intermediate', '2021-01-2 13:00:00', '2021-01-2 15:00:00', 4, 8),
        (DEFAULT, 120, 'ensamble', 'intermediate', '2021-01-2 15:00:00', '2021-01-2 17:00:00', 3, 7),
        (DEFAULT, 60, 'group', 'intermediate', '2021-01-2 15:00:00', '2021-01-2 17:00:00', 4, 8),
        (DEFAULT, 60, 'group', 'beginner', '2021-01-2 17:00:00', '2021-01-2 19:00:00', 4, 8)
        ;

INSERT INTO student_music_lesson(music_lesson_id, student_id, person_id)
VALUES  (20, 1, 1),
        (20, 2, 4),
        (20, 3, 5),
        (20, 4, 6),
        (21, 1, 1),
        (21, 3, 5),
        (22, 1, 1),
        (22, 2, 4),
        (23, 1, 1),
        (23, 2, 4),
        (23, 3, 5),
        (23, 4, 6),
        (24, 1, 1),
        (24, 4, 6)
        ;        

INSERT INTO ensamble (ensamble_id, music_lesson_id, max_atendees, min_atendees, target_genre)
VALUES  (DEFAULT, 4, 30, 10, 'punk'),
        (DEFAULT, 11, 25, 15, 'soul'),
        (DEFAULT, 17, 20, 10, 'rock'),
        (DEFAULT, 18, 10, 5, 'classic'),
        (DEFAULT, 19, 15, 10, 'pop'),
        (DEFAULT, 20, 4, 2, 'rock'),
        (DEFAULT, 21, 5, 3, 'rock'),
        (DEFAULT, 22, 10, 5, 'classic'),
        (DEFAULT, 23, 5, 3, 'pop'),
        (DEFAULT, 24, 10, 5, 'classic'),
        (DEFAULT, 25, 6, 4, 'black-metal')
        ;

INSERT INTO individual_lesson (individual_lesson_id, music_lesson_id, instrument_id)
VALUES  (DEFAULT, 1, 1),
        (DEFAULT, 5, 4),
        (DEFAULT, 7, 2),
        (DEFAULT, 9, 5),
        (DEFAULT, 10, 3),
        (DEFAULT, 13, 3),
        (DEFAULT, 14, 5),
        (DEFAULT, 15, 1),
        (DEFAULT, 16, 1)
        ;

INSERT INTO group_lesson (group_lesson_id, music_lesson_id, number_of_places, min_enrolled_students, instrument_id)
VALUES  (DEFAULT, 2, 30, 20, 4),
        (DEFAULT, 3, 25, 15, 1),
        (DEFAULT, 6, 30, 20, 2),
        (DEFAULT, 8, 20, 10, 9),
        (DEFAULT, 12, 10, 5, 4),
        (DEFAULT, 26, 10, 5, 9),
        (DEFAULT, 27, 10, 5, 9)
        ;

