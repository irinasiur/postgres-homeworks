-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date,
-- phone varchar
CREATE TABLE student
(
student_id SERIAL,
first_name VARCHAR (255),
last_name VARCHAR (255),
birthday DATE,
phone VARCHAR (255)
);

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student ADD COLUMN middle_name VARCHAR (255);

-- 3. Удалить колонку middle_name

ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME birthday TO birth_date;


-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);


-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date, phone) VALUES ('vasya', 'pupkin', '12.02.2000', '79261000000');
INSERT INTO student (first_name, last_name, birth_date, phone) VALUES ('petya', 'mepkin', '22.02.2000', '79261087000');
INSERT INTO student (first_name, last_name, birth_date, phone) VALUES ('katia', 'linkin', '31.07.2005', '79261052000');


-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student;
ALTER SEQUENCE student_student_id_seq RESTART WITH 1;

