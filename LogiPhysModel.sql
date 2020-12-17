BEGIN;

CREATE TABLE instrument (
 instrument_id  serial PRIMARY KEY,
 type VARCHAR(500),
 name VARCHAR(500)
);

CREATE TABLE parent_email (
 parent_email_id serial PRIMARY KEY,
 email VARCHAR(100)
);

CREATE TABLE parent_phone (
 parent_phone_id serial PRIMARY KEY,
 phone_number VARCHAR(20)
);

CREATE TABLE person (
 person_id serial PRIMARY KEY,
 person_number UNIQUE VARCHAR(12) NOT NULL,
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 zip VARCHAR(5),
 street VARCHAR(500),
 city VARCHAR(500)
);

CREATE TABLE person_instrument (
 instrument_id INT NOT NULL REFERENCES instrument(instrument_id) ON DELETE CASCADE,
 person_id INT NOT NULL REFERENCES person(person_id) ON DELETE CASCADE,
 skill_level VARCHAR(20),

 CONSTRAINT PK_person_instrument PRIMARY KEY (instrument_id,person_id)
);

CREATE TABLE phone (
 person_id INT NOT NULL REFERENCES person(person_id) ON DELETE CASCADE,
 phone_id serial,
 phone_number VARCHAR(30),

 CONSTRAINT PK_person_phone PRIMARY KEY (phone_id,person_id)
);

CREATE TABLE school (
 school_id serial PRIMARY KEY,
 max_students INT,
 min_students INT,
 min_age INT,
 zip VARCHAR(5),
 street VARCHAR(500),
 city VARCHAR(500)
);

CREATE TABLE student (
 student_id serial,
 person_id INT NOT NULL REFERENCES person(person_id),
  
 CONSTRAINT PK_student PRIMARY KEY (student_id,person_id)

);

CREATE TABLE student_application (
 student_aplication_id serial PRIMARY KEY,
 date DATE,
 person_number VARCHAR(12),
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 zip VARCHAR(5),
 city VARCHAR(500),
 street VARCHAR(500),
 ensamble_genre VARCHAR(500),
 instrument VARCHAR(500),
 skill VARCHAR(20),
 sibling_person_number VARCHAR(12),
 email VARCHAR(100),
 phone_number VARCHAR(20),
 accepted BOOLEAN,
 student_id INT REFERENCES student(student_id) ON DELETE SET NULL,
 person_id INT REFERENCES person(person_id) ON DELETE SET NULL
);

CREATE TABLE student_parent_email (
 parent_email_id INT NOT NULL REFERENCES parent_email(parent_email_id) ON DELETE CASCADE,
 student_id INT NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
 person_id INT NOT NULL REFERENCES person(person_id) ON DELETE CASCADE,

 CONSTRAINT PK_student PRIMARY KEY (student_id,person_id,parent_email_id)
);

CREATE TABLE student_parent_phone (
 parent_phone_id INT NOT NULL REFERENCES parent_phone(parent_phone_id) ON DELETE CASCADE,
 student_id INT NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
 person_id INT NOT NULL REFERENCES person(person_id) ON DELETE CASCADE,

 CONSTRAINT PK_student PRIMARY KEY (student_id,person_id, parent_phone_id)
);

CREATE TABLE adress (
 person_id INT NOT NULL PRIMARY REFERENCES person(person_id) ON DELETE CASCADE, 
 zip VARCHAR(5),
 street VARCHAR(500),
 city VARCHAR(500)

);

CREATE TABLE audition (
 audition_id serial,
 student_aplication_id INT REFERENCES student_application(student_aplication_id) ON DELETE CASCADE
 time TIMESTAMP(0),
 result BIT(1),

 CONSTRAINT PK_application_audition PRIMARY KEY (audition_id, student_aplication_id)
);

CREATE TABLE email (
 person_id INT NOT NULL REFERENCES person(person_id) ON DELETE CASCADE,
 email_id serial,
 email VARCHAR(100),

 CONSTRAINT PK_student_email PRIMARY KEY (person_id, email_id)
);

CREATE TABLE instructor (
 instructor_id serial,
 person_id INT NOT NULL REFERENCES person(person_id),
 pay_amount INT,

 CONSTRAINT PK_instructor_person PRIMARY KEY (instructor_id, person_id)
);

CREATE TABLE instructor_avaliablity (
 instructor_id INT NOT NULL REFERENCES instructor(instructor_id) ON DELETE CASCADE,
 person_id INT NOT NULL REFERENCES person(person_id),
 start_time TIME(0),
 end_time TIME(0),
 date DATE,

 CONSTRAINT PK_instructor_person PRIMARY KEY (instructor_id, person_id)
);

CREATE TABLE lesson_pricing (
 lesson_type VARCHAR(50) NOT NULL,
 lesson_level VARCHAR(20) NOT NULL,
 standard_charge DECIMAL(3),
 certain_day_extra_charge DECIMAL(3),
 school_id INT REFERENCES school(school_id) ON DELETE SET NULL,

 CONSTRAINT PK_lesson_pricing PRIMARY KEY (lesson_type, lesson_level)
);

CREATE TABLE music_lesson (
 music_lesson_id serial PRIMARY KEY,
 price DECIMAL(3),
 type VARCHAR(50),
 level VARCHAR(20),
 local VARCHAR(500),
 start_time TIMESTAMP(0),
 end_time TIMESTAMP(0),
 instructor_id INT REFERENCES instructor(instructor_id),
 person_id INT REFERENCES person(person_id)
);

CREATE TABLE rental_instrument (
 rental_instrument_id serial PRIMARY KEY,
 fee_per_mounth INT,
 name VARCHAR(50),
 type VARCHAR(50),
 school_id INT REFERENCES school(school_id)
);

CREATE TABLE student_music_lesson (
 music_lesson_id INT NOT NULL REFERENCES music_lesson(music_lesson_id) ON DELETE CASCADE,
 student_id INT NOT NULL REFERENCES student(student_id) ON DELETE CASCADE,
 person_id INT NOT NULL REFERENCES person(person_id) ON DELETE CASCADE,

 CONSTRAINT PK_student_lesson PRIMARY KEY (music_lesson_id, student_id, person_id)
);

CREATE TABLE ensamble (
 ensamble_id serial,
 music_lesson_id INT NOT NULL REFERENCES music_lesson(music_lesson_id),
 max_atendees INT,
 min_atendees INT,
 target_genre VARCHAR(500) NOT NULL,

 CONSTRAINT PK_ensamble_lesson PRIMARY KEY (music_lesson_id, ensamble_id)
);

CREATE TABLE group_lesson (
 group_lesson_id serial,
 music_lesson_id INT NOT NULL REFERENCES music_lesson(music_lesson_id),
 number_of_places INT,
 min_enrolled_students INT,
 instrument_id INT REFERENCES instrument(instrument_id) ON DELETE SET NULL,

 CONSTRAINT PK_group_lesson PRIMARY KEY (music_lesson_id, group_lesson_id)
);

CREATE TABLE individual_lesson (
 individual_lesson_id  serial,
 music_lesson_id INT NOT NULL REFERENCES music_lesson(music_lesson_id),
 instrument_id INT REFERENCES instrument(instrument_id) ON DELETE SET NULL,

 CONSTRAINT PK_individual_lesson PRIMARY KEY (individual_lesson_id, music_lesson_id)
);

CREATE TABLE instructor_ensamble_genre (
 ensamble_genre CHAR(10) NOT NULL,
 instructor_id INT NOT NULL REFERENCES instructor(instructor_id) ON DELETE CASCADE,
 person_id INT NOT NULL REFERENCES person(person_id),

 CONSTRAINT PK_instrucror_ensamble_genre PRIMARY KEY (ensamble_genre,instructor_id,person_id)
);


CREATE TABLE rental (
 rental_id serial PRIMARY KEY,
 rental_date VARCHAR(8),
 return_date VARCHAR(8) NOT NULL,
 fee INT,
 rental_instrument_id INT REFERENCES rental_instrument(rental_instrument_id),
 student_id INT,
 person_id INT
);

COMMIT; 
