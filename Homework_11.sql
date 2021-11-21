
-- —оздайте таблицу logs типа Archive. 
-- ѕусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещаетс€ врем€ 
-- и дата создани€ записи, название таблицы, идентификатор первичного ключа и содержимое пол€ name.
USE curs;

drop table if exists logs;
create table logs(
time_create_at datetime DEFAULT NOW(), 
table_name varchar(45) NOT NULL, 
table_id INT UNSIGNED NOT NULL, 
name_value varchar(45)) engine=ARCHIVE;


DROP TRIGGER IF EXISTS add_log_users;
delimiter //
CREATE TRIGGER add_log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (time_create_at, table_name, table_id, name_value)
	VALUES (NOW(), 'users', NEW.id, NEW.lastname);
END //
delimiter ;


DROP TRIGGER IF EXISTS add_log_catalogs;
delimiter //
CREATE TRIGGER add_log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (time_create_at, table_name, table_id, name_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS add_log_products;
delimiter //
CREATE TRIGGER add_log_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (time_create_at, table_name, table_id, name_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

-- TEST 
INSERT INTO users 
VALUES 
(11, 'Rustam', 'Lepatv', '89999999990', 'lep@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default),
(12, 'Vladislav', 'Baronenko', '89999999989', 'bar@example.org', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, default);

INSERT INTO products 
VALUES 
(11, 'Samsung A52', '6/128GB', 31990, 1, DEFAULT, DEFAULT),
(12, 'Xiaomi POCO F3', '6/128GB', 29990, 1, DEFAULT, DEFAULT);

INSERT INTO catalogs 
VALUES 
(11, 'fridge'),
(12, 'microvawe');

SELECT * FROM logs;