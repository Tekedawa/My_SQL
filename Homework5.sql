-- I did Dump of database vk. Name of this base vk3.
-- And so I decided use database vk3

-- Theme 1 
--
--Task1

SHOW DATABASES;
USE vk3;

SELECT * FROM users;

UPDATE users SET created_at = DEFAULT;
UPDATE users SET updated_at = DEFAULT;

-- Task2


ALTER TABLE users add COLUMN DateTime_at varchar (50) DEFAULT '20.10.2017 08:10';

ALTER TABLE users drop COLUMN DateTime_at;

ALTER TABLE users ADD COLUMN New_DateTime_at DateTime;

UPDATE users SET New_DateTime_at = STR_TO_DATE(DateTime_at, '%d.%m.%Y %l:%i'); 


-- Task 3

CREATE TABLE STOREHOUSE_Product (
	id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Value bigint unsigned NOT NULL DEFAULT 0
	);
	
INSERT INTO STOREHOUSE_Product
VALUES 
(1, 0),
(2, 2500),
(3, 0),
(4, 30),
(5, 500),
(6, 1);


SELECT * FROM STOREHOUSE_Product;

SELECT * FROM STOREHOUSE_Product
ORDER BY value < 1, value ASC;

--Task4


CREATE TABLE people (id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
name Varchar (30),
month_en varchar (30)
);


INSERT INTO people 
(name, month_en)
VALUES
('Ann','December'),
('Alice','November',
('Alla','October'),
('Vika', 'November'),
('Irina','February'),
('Marina','October'),
('Katya','May'),
('Alyona','August'),
('Nadya','January'),
('Lera','April'),
('Sveta','April'),
('Agela','July');

SELECT * FROM people;

SELECT * FROM people 
WHERE month_en = 'May' OR month_en = 'August';

-- Task 5

CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');
  
 SELECT * FROM catalogs WHERE id IN (5, 1, 2)
 ORDER BY id < 5, id ASC;
 

-- Theme 2
-- Task 1

SELECT * FROM users1;

CREATE TABLE users1 (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users1 (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

SELECT
  Avg((YEAR(CURRENT_DATE)-YEAR(`birthday_at`))-(RIGHT(CURRENT_DATE,5)<RIGHT(`birthday_at`,5)
  )) AS `age`
FROM `users1`;

-- Task 2
SELECT
  `name`, 
  `birthday_at`,
  WEEKDAY (birthday_at) AS `weekday`,
  Dayname (birthday_at),
 weekday(date_format(birthday_at, '2021-%m-%d')) as 'day_number',
 Dayname ((date_format(birthday_at, '2021-%m-%d'))) AS DaysOfWeek1
FROM `users1`;

-- Task 3
-- It's a factorial.
-- I don't know how to do a functions and cycles in sql. and so i don't use these functions

SELECT id FROM users1;

SELECT max(id), min(id) FROM users1;

SELECT ((((max(id)*(max(id)-min(id)))*(max(id)-(min(id)+min(id)))*(max(id)-(min(id)+min(id)+min(id))))*(min(id)+min(id)))*min(id)) AS reult FROM users1;
