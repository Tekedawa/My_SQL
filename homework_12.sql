
-- This Database is dtabase for Internet shop of electronic. This DB has some sheets, such as users, profiles, cities, catalogs, orders, storehouses, produtcs and etc. 
-- I think These sheets have main important information for working Internet Shop. This information include data about client (users), their personal data (profiles)
-- , catalogs of products, products with their description.
drop DATABASE if exists Curs_DB;
CREATE DATABASE Curs_DB;

use Curs_DB;

-- table 1
drop table if exists users;
CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR (50) NOT NULL,
	lastname VARCHAR (50) NOT NULL,
	phone CHAR (11) NOT NULL,
	email VARCHAR (120) UNIQUE,
	password_hash CHAR (65),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX (email),
	INDEX (phone)
);

ALTER TABLE users
  ADD INDEX users_index (lastname, firstname);

INSERT INTO users 
VALUES 
(1, 'Vladislav', 'Fedorov', '89999999999', 'fed@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default), 
(2, 'Petr', 'Fomenko', '89999999998', 'fom@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default),
(3, 'Maksim', 'Ivanov', '89999999997', 'iva@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default),
(4, 'Ivan', 'Petrov', '89999999996', 'pet@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default),
(5, 'Pavel', 'Sergeev', '89999999995', 'serg@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default), 
(6, 'Alexey', 'Dobrin', '89999999994', 'dobg@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default), 
(7, 'Igor', 'Leontev', '89999999993', 'leo@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default), 
(8, 'Aslan', 'Romanov', '89999999992', 'romg@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default), 
(9, 'Ilya', 'Semenov', '89999999991', 'sem@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default),
(10, 'Dmitrii', 'Tarasov', '89999999990', 'targ@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default); 

-- table 2
drop table if exists profiles;
CREATE TABLE profiles (
  users_id bigint unsigned NOT NULL,
  gender char(1) DEFAULT NULL,
  birthday date DEFAULT NULL,
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  cities_id bigint unsigned NOT NULL,
  UNIQUE KEY users_id (users_id),
  CONSTRAINT profiles_ibfk_1 FOREIGN KEY (users_id) REFERENCES users (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT profiles_ibfk_2 FOREIGN KEY (cities_id) REFERENCES cities (id) ON UPDATE CASCADE);
 -- CONSTRAINT profiles_ibfk_2 FOREIGN KEY (cities_id) REFERENCES cities (id)


INSERT INTO profiles 
VALUES 
(1, 'm', '1997-12-01', DEFAULT, 1),
(2, 'm', '1998-07-10', DEFAULT, 4), 
(3, 'm', '2002-10-12', DEFAULT, 1), 
(4, 'm', '1997-05-01', DEFAULT, 3), 
(5, 'm', '1997-10-17', DEFAULT, 2), 
(6, 'm', '1998-04-01', DEFAULT, 5),
(7, 'm', '1999-11-08', DEFAULT, 8),
(8, 'm', '2000-07-01', DEFAULT, 2),
(9, 'm', '1998-01-19', DEFAULT, 3),
(10, 'm', '1997-04-05', DEFAULT, 1); 


-- table 3
drop table if exists cities;
CREATE TABLE cities (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY unique_name (name(50))
);

DROP TABLE IF EXISTS cities; 

CREATE TABLE cities (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY unique_name (name(50))
);

INSERT INTO cities 
VALUES 
(1, 'Moscow'),
(2, 'Saint Petersburg'),
(3, 'Kazan'),
(4, 'Samara'),
(5, 'Saratov'),
(6, 'Sochi'),
(7, 'Ulyanovsk'),
(8, 'Ekaterinburg'),
(9, 'Omsk'),
(10, 'Ufa');

ALTER TABLE cities ADD (Country Varchar(50));
ALTER TABLE cities DROP Country;

-- table 4
drop table if exists catalogs;
CREATE TABLE catalogs (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  UNIQUE KEY unique_name (name(50))
);

INSERT INTO catalogs 
VALUES 
(1, 'phone'),
(2, 'tablet'),
(3, 'laptop'),
(4, 'graphics_card'),
(5, 'HDD'),
(6, 'monitor'),
(7, 'processor'),
(8, 'TV'),
(9, 'Consoles'),
(10, 'E-Readers');

-- table 5
drop table if exists products;
CREATE TABLE products (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  description text,
  price decimal(11,2) DEFAULT NULL,
  catalogs_id bigint unsigned DEFAULT NULL,
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY index_of_catalogs_idx (catalogs_id),
  CONSTRAINT products_ibfk_1 FOREIGN KEY (catalogs_id) REFERENCES catalogs (id)
 );

INSERT INTO products 
VALUES 
(1, 'Samsung A32', '4/128GB', 21990, 1, DEFAULT, DEFAULT),
(2, 'POCO X3 Pro', '8/256GB', 21000, 1, DEFAULT, DEFAULT),
(3, 'Iphone SE 2020', '64GB', 36250, 1, DEFAULT, DEFAULT),
(4, 'Nintendo Switch', '32GB', 23499, 9, DEFAULT, DEFAULT),
(5, 'Xbox Series X', '1024GB', 49990, 9, DEFAULT, DEFAULT),
(6, 'Xiaomi Mi Pad 4 Plus Wi-Fi + LTE', '4/64GB', 24290, 2, DEFAULT, DEFAULT),
(7, 'Xiaomi Mi Pad 5', '6/256GB', 22450, 2, DEFAULT, DEFAULT),
(8, 'LG 24LN510S-PZ', '24"/1366x768', 16990, 8, DEFAULT, DEFAULT),
(9, 'Samsung UE24N4500AU', '24"/1366x768', 16999, 8, DEFAULT, DEFAULT),
(10, 'Samsung QE50Q67AAU', '50"/3840x2160', 64990, 8, DEFAULT, DEFAULT);

-- table 6
drop table if exists orders;
CREATE TABLE orders (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  users_id bigint unsigned DEFAULT NULL,
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  KEY index_of_users_id (users_id),
  CONSTRAINT orders_ibfk_1 FOREIGN KEY (users_id) REFERENCES users (id)
);

INSERT INTO orders
VALUES 
(1, 2, DEFAULT, DEFAULT),
(2, 1, DEFAULT, DEFAULT),
(3, 3, DEFAULT, DEFAULT),
(4, 4, DEFAULT, DEFAULT),
(5, 2, DEFAULT, DEFAULT),
(6, 1, DEFAULT, DEFAULT),
(7, 9, DEFAULT, DEFAULT),
(8, 1, DEFAULT, DEFAULT),
(9, 3, DEFAULT, DEFAULT),
(10, 5, DEFAULT, DEFAULT);

-- table 7
drop table if exists orders_products;
CREATE TABLE orders_products (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  orders_id bigint unsigned DEFAULT NULL,
  products_id bigint unsigned DEFAULT NULL,
  total int unsigned DEFAULT '1' COMMENT 'Количество заказанных товарных позиций',
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  CONSTRAINT orders_produsts_ibfk_1 FOREIGN KEY (orders_id) REFERENCES orders (id),
  CONSTRAINT orders_produsts_ibfk_2 FOREIGN KEY (products_id) REFERENCES products (id)
);

INSERT INTO orders_products
VALUES 
(1, 1, 3, 8, DEFAULT, DEFAULT),
(2, 2, 8, 1, DEFAULT, DEFAULT),
(3, 3, 4, 5, DEFAULT, DEFAULT),
(4, 4, 2, 2, DEFAULT, DEFAULT),
(5, 5, 3, 1, DEFAULT, DEFAULT),
(6, 6, 1, 9, DEFAULT, DEFAULT),
(7, 7, 7, 7, DEFAULT, DEFAULT),
(8, 8, 2, 1, DEFAULT, DEFAULT),
(9, 9, 5, 2, DEFAULT, DEFAULT),
(10, 10, 4, 3, DEFAULT, DEFAULT);


-- table 8
drop table if exists storehouses;
CREATE TABLE storehouses (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  products_id bigint unsigned DEFAULT NULL,
  value int unsigned DEFAULT NULL,
  created_at datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  CONSTRAINT storehouses_ibfk_1 FOREIGN KEY (products_id) REFERENCES products (id)
);

INSERT INTO storehouses
VALUES 
(1, 1, 20, DEFAULT, DEFAULT),
(2, 2, 80, DEFAULT, DEFAULT),
(3, 3, 40, DEFAULT, DEFAULT),
(4, 4, 24, DEFAULT, DEFAULT),
(5, 5, 35, DEFAULT, DEFAULT),
(6, 6, 19, DEFAULT, DEFAULT),
(7, 7, 34, DEFAULT, DEFAULT),
(8, 8, 27, DEFAULT, DEFAULT),
(9, 9, 43, DEFAULT, DEFAULT),
(10, 10, 36, DEFAULT, DEFAULT);

-- table 9
drop table if exists status;
CREATE TABLE status (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id)
  );
  
 INSERT INTO status
VALUES 
(1, 'Saved'),
(2, 'Formed'),
(3, 'Prepared'),
(4, 'Deliverd'),
(5, 'Completed'),
(6, 'Canceled'),
(7, 'Refund');

-- table 10
drop table if exists orders_status;
CREATE TABLE orders_status (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  orders_id bigint unsigned DEFAULT NULL,
  status_id bigint unsigned NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id (id),
  CONSTRAINT orders_status_ibfk_1 FOREIGN KEY (orders_id) REFERENCES orders (id),
  CONSTRAINT orders_status_ibfk_2 FOREIGN KEY (status_id) REFERENCES status (id)
);

 INSERT INTO orders_status
VALUES 
(1, 1, 2),
(2, 2, 4),
(3, 3, 6),
(4, 4, 5),
(5, 5, 5),
(6, 6, 4),
(7, 7, 2),
(8, 8, 4),
(9, 9, 3),
(10, 10, 3);

-- Представления и Join'ы
SELECT * FROM catalogs;
SELECT * FROM products;

SELECT 
	products.name ,
	catalogs.name AS category
FROM products 
JOIN catalogs ON products.catalogs_id = catalogs.id;

drop view if exists cat;
CREATE VIEW cat AS 
SELECT 
	products.name ,
	catalogs.name AS category
FROM products 
JOIN catalogs ON products.catalogs_id = catalogs.id;

SELECT * FROM cat;

-- Второе представление

SELECT * FROM status;
SELECT * FROM orders_status;
SELECT * FROM orders;
SELECT * FROM orders_products;
SELECT * FROM products;
SELECT * FROM users;


SELECT 
	users.lastname AS Lastname,
	users.firstname AS firstname, 
	products.name AS product,
	orders_products.total AS quantity,
	status.name AS status
FROM orders
JOIN users ON orders.users_id = users.id
JOIN orders_products ON orders_products.orders_id = orders.id
JOIN products ON orders_products.products_id = products.id
JOIN orders_status ON orders.id = orders_status.orders_id
JOIN status ON orders_status.status_id = status.id;

drop view if exists shopping_cart;
CREATE VIEW shopping_cart AS
SELECT 
	users.lastname AS Lastname,
	users.firstname AS firstname, 
	products.name AS product,
	orders_products.total AS quantity,
	status.name AS status
FROM orders
JOIN users ON orders.users_id = users.id
JOIN orders_products ON orders_products.orders_id = orders.id
JOIN products ON orders_products.products_id = products.id
JOIN orders_status ON orders.id = orders_status.orders_id
JOIN status ON orders_status.status_id = status.id;

SELECT * FROM shopping_cart;

-- Вложенные запросы

SELECT * FROM orders_status
WHERE status_id in (SELECT id FROM status WHERE id <> 6)
ORDER BY orders_id desc;

-- Сортировка и группировка
SELECT 
	catalogs.name AS category
FROM products 
JOIN catalogs ON products.catalogs_id = catalogs.id
GROUP BY catalogs.name
ORDER BY catalogs.name desc;

-- Процедуры
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

-- trigger
DROP TRIGGER IF EXISTS nullTrigger;
delimiter //
CREATE TRIGGER nullTrigger BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.name) OR ISNULL(NEW.description) OR ISNULL(NEW.price) OR ISNULL(NEW.catalogs_id)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Canceling the operation is an attempt to assign Null values.';
	END IF;
END //
delimiter ;

INSERT INTO products (name, description, price, catalogs_id)
VALUES (NULL, NULL, 16980, 3); -- FAIL ! Trigger Warning

INSERT INTO products (name, description, price, catalogs_id)
VALUES 
('Acer nitro', NULL, 16980, 3);-- FAIL ! Trigger Warning

INSERT INTO products (name, description, price, catalogs_id)
VALUES
(NULL, NULL, NULL, NULL);-- FAIL ! Trigger Warning

INSERT INTO products (name, description, price, catalogs_id)
VALUES
(NULL, '2GB, 32GB', 16980, 3);-- FAIL ! Trigger Warning

-- Dbeaver don't understand trigger and procedure, it show me updated rows = -1. I had to think about this problem. I decided to use Alt + x, procedure and trigger started working after that.

DELETE FROM Products
WHERE Id > 11;

SELECT * FROM profiles 
WHERE birthday >= (current_date - INTERVAL 18 YEAR);

DROP TRIGGER IF EXISTS ageTrigger;
delimiter //
CREATE TRIGGER ageTrigger BEFORE INSERT ON profiles
FOR EACH ROW
BEGIN
	IF (NEW.birthday >= (current_date - INTERVAL 18 YEAR)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age cannot be less 18-years old';
	END IF;
END //
delimiter ;

SELECT * FROM profiles; 

INSERT INTO profiles
VALUES
(11, 'm', '2005-10-12', DEFAULT, 4); -- Age cannot be less 18-years old

