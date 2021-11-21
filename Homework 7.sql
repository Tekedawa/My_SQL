-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
-- Выведите список товаров products и разделов catalogs, который соответствует товару.
-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и 
-- таблица городов cities (label, name). Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

-- Намного больше времени занимает подготовить саму базу данных. Заполнить значениями. Сделать необходимые таблицы. Чем сделать задание
SELECT * FROM users;


SELECT * FROM orders;

INSERT INTO orders
VALUES 
(1, 2, DEFAULT, DEFAULT),
(2, 6, DEFAULT, DEFAULT),
(3, 1, DEFAULT, DEFAULT),
(4, 2, DEFAULT, DEFAULT),
(5, 3, DEFAULT, DEFAULT),
(6, 1, DEFAULT, DEFAULT),
(7, 3, DEFAULT, DEFAULT),
(8, 2, DEFAULT, DEFAULT);

SELECT * FROM orders_products;

INSERT INTO orders_products
VALUES 
(1, 5, 7, 2, DEFAULT, DEFAULT),
(2, 8, 1, 3, DEFAULT, DEFAULT),
(3, 6, 2, 1, DEFAULT, DEFAULT),
(4, 2, 5, 1, DEFAULT, DEFAULT),
(5, 3, 3, 2, DEFAULT, DEFAULT),
(6, 1, 4, 1, DEFAULT, DEFAULT),
(7, 4, 1, 1, DEFAULT, DEFAULT),
(8, 7, 2, 2, DEFAULT, DEFAULT);

SELECT * FROM products;

-- TASK 1


SELECT users.id, users.name, products.name, orders_products.total 
FROM users
JOIN orders ON  users.id = orders.user_id
JOIN orders_products ON  orders.id = orders_products.order_id 
JOIN products ON  orders_products.product_id = products.id
ORDER BY id ASC;

-- TASK 2
SELECT * FROM products;
SELECT * FROM catalogs;

SELECT products.id, products.name, products.description, products.price, catalogs.name 
FROM products
JOIN catalogs ON  products.catalog_id = catalogs.id
ORDER BY id ASC;


-- TASK 3

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  from_city varchar (50) AS "from",
  to_city   varchar (50) AS "to" 
  );

  CREATE TABLE flights
(id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
from_city Varchar (30),
to_city varchar (30)
);
DROP TABLE flights;

INSERT INTO flights
VALUES 
(1, 'moscow', 'omsk'),
(2, 'novgorod', 'kazan'),
(3, 'irkutsk', 'moscow'),
(4, 'omsk', 'irkutsk'),
(5, 'moscow', 'kazan');

  CREATE TABLE cities
(id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
label Varchar (30),
name varchar (30)
);

INSERT INTO cities
VALUES 
(1, 'moscow', 'Москва'),
(2, 'irkutsk', 'Иркутск'),
(3, 'novgorod', 'Новгород'),
(4, 'kazan', 'Казань'),
(5, 'omsk', 'Омск');

SELECT * FROM flights;
SELECT * FROM cities;

SELECT flights.id, c1.name, c2.name 
FROM flights 
JOIN cities c1 ON flights.from_city = c1.label
JOIN cities c2 ON flights.to_city = c2.label
ORDER BY id ASC;