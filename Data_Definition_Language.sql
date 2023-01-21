--Задание_1.
CREATE TABLE student
(
    student_id serial,
    first_name varchar,
    last_name varchar,
    birthday date,
    phone varchar
);
--1.1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar

ALTER TABLE student ADD COLUMN middle_name varchar;
--1.2. Добавить в таблицу после создания колонку middle_name varchar

ALTER TABLE student DROP COLUMN middle_name;
--1.3. Удалить колонку middle_name

ALTER TABLE student RENAME birthday TO birth_date;
--1.4. Переименовать колонку birthday в birth_date

ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);
--1.5. Изменить тип данных колонки phone на varchar(32)

ALTER TABLE student ADD PRIMARY KEY(student_id),
INSERT INTO student(first_name, last_name, birth_date, phone) VALUES ('Adelya', 'Nikolaeva', '06.08.1995', '123456789'), ('Mikhail', 'Latipov', '23.03.1996', '987654321'), ('Viktor', 'Terentiev', '19.07.1994', '321456987');
--1.6. Вставить три любых записи с автогенерацией идентификатора

TRUNCATE TABLE student RESTART IDENTITY;
--1.7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние

--Задание_2.
ALTER TABLE products ADD CHECK(unit_price > 0);
--2.1. добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)

ALTER TABLE products ADD CHECK(discontinued IN (0, 1));
--2.2. добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1

CREATE TABLE discontinued_products AS SELECT * FROM products WHERE discontinued = 1;
--2.3.  Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)

ALTER TABLE products DROP CONSTRAINT fk_products_categories;
ALTER TABLE order_details DROP CONSTRAINT fk_order_details_products;
DELETE FROM products WHERE discontinued = 1
ALTER TABLE products ADD CONSTRAINT fk_products FOREIGN KEY(product_id) REFERENCES order_details(product_id);
--2.4. Удалить из products товары, снятые с продажи (discontinued = 1); удаление ограничения, связанного с foreign_key.; Подумайте, как это можно решить, чтобы связь с таблицей order_details все же осталась.