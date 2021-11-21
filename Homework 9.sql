-- Task 1

USE sample; 
USE shop;

-- � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users.
-- ����������� ����������.

START TRANSACTION;
INSERT INTO sample.users (name) 
SELECT shop.users.name
FROM shop.users 
WHERE (id = 1);
SELECT * FROM sample.users;
COMMIT;

-- Task 2

-- �������� �������������, ������� ������� �������� name �������� ������� 
-- �� ������� products � ��������������� �������� �������� name �� ������� catalogs.
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
		SELECT '������ ����';
	ELSEIF(CURTIME() BETWEEN '12:00:00' AND '18:00:00') THEN
		SELECT '������ ����';
	ELSEIF(CURTIME() BETWEEN '18:00:00' AND '00:00:00') THEN
		SELECT '������ �����';
	ELSE
		SELECT '������ ����';
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