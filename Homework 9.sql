-- Task 1

USE sample; 
USE shop;

-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
-- Используйте транзакции.

START TRANSACTION;
INSERT INTO sample.users (name) 
SELECT shop.users.name
FROM shop.users 
WHERE (id = 1);
SELECT * FROM sample.users;
COMMIT;

-- Task 2

-- Создайте представление, которое выводит название name товарной позиции 
-- из таблицы products и соответствующее название каталога name из таблицы catalogs.
USE market;
SELECT * FROM catalogs;
SELECT * FROM products;

SELECT 
	products.name ,
	catalogs.name AS category
FROM products 
JOIN catalogs ON products.catalog_id = catalogs.id;

CREATE VIEW cat AS 
SELECT 
	products.name ,
	catalogs.name AS category
FROM products 
JOIN catalogs ON products.catalog_id = catalogs.id;

SELECT * FROM cat;

-- Task 3
-- russian 
DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT 'Доброе утро';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT 'Добрый день';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT 'Добрый вечер';
	ELSE
		SELECT 'Доброй ночи';
	END IF;
END //
delimiter ;

CALL hello();

-- english 
DROP PROCEDURE IF EXISTS hello;
delimiter //
CREATE PROCEDURE hello()
BEGIN
	IF(CURTIME() BETWEEN '06:00:00' AND '12:00:00') THEN
		SELECT 'Good morning';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT 'Good day';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT 'Good evening';
	ELSE
		SELECT 'Good night';
	END IF;
END //
delimiter ;

CALL hello();

-- Task 4

DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Canceling the operation is an attempt to assign Null values.';
	END IF;
END //
delimiter ;

INSERT INTO products (name, description, price, catalog_id)
VALUES (NULL, NULL, 6980, 3); -- FAIL ! Trigger Warning

INSERT INTO products (name, description, price, catalog_id)
VALUES ("GeForce rtx 2060", NULL, 70000, 3);

SELECT * FROM products;