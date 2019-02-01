CREATE TABLE course (course_id INT, course_name VARCHAR(50), course_description VARCHAR(100));

ALTER TABLE course
   ADD course_day VARCHAR(50);

INSERT INTO course (course_id, course_name, course_description) VALUES (1, 'CED-1250', 'Big Data Storage')
