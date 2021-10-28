USE vk;

-- ADD column with number of passport
ALTER TABLE users ADD COLUMN passport_number VARCHAR (10);

-- change her type
ALTER TABLE users MODIFY COLUMN passport_number VARCHAR (20);

-- rename column
ALTER TABLE users RENAME COLUMN passport_number TO passport;

-- ADD unique index on COLUMN 
ALTER TABLE users ADD INDEX passport_idx (passport);

-- DROP index
ALTER TABLE users DROP INDEX passport_idx;

-- DROP column
ALTER TABLE users DROP COLUMN passport;

-- CHECK CONSTRAITS

ALTER TABLE friend_requests ADD CONSTRAINT CHECK (from_user_id != to_user_id);

-- ADD CONSTRAINT what phone number must include 11 symbl
-- using only numeral
-- https://regex101.com

ALTER TABLE users ADD CONSTRAINT CHECK (REGEXP_LIKE (phone, '^[0-9]{11}$'));

-- do id photo of users unique 
ALTER TABLE profiles MODIFY COLUMN photo_id BIGINT UNSIGNED DEFAULT NULL UNIQUE;

-- do foreign key to media;
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_media FOREIGN KEY (photo_id) REFERENCES media (id); 

/*
 * C - Create = INSERT
 * R - Read = SELECT
 * U - Update = UPDATE
 * D - Delete = DELETE
*/

/*
* INSERT
* https://dev.mysql.com/doc/refman/8.0/INSERT.html
*/

-- do users

DESCRIBE users;

INSERT IGNORE users
VALUES (DEFAULT, 'Alex', 'Stepanov', '89213546566', 'alex@mail.com', 'asdsdaasd', DEFAULT, DEFAULT );

SELECT * FROM users;

INSERT users (firstname, lastname, phone, email, password_hash)
VALUES ('Lena', 'Stepanova', '89213546568', 'lena!mail.com', 'hjhkjh');



SELECT * FROM users;

INSERT IGNORE users
VALUES (DEFAULT, 'Chris', 'Ivanov', '89213546560', 'chris@mail.com', 'kdfhgkasd', DEFAULT, DEFAULT );

INSERT users
VALUES (5, 'Jane', 'Kvanov', '89293546560', 'jane@mail.com', 'asdsdaasdsxz', DEFAULT, DEFAULT);

INSERT users
VALUES (4, 'Igor', 'Petrov', '89293546563', 'igor@mail.com', 'sdaasdsxzdsb', DEFAULT, DEFAULT);

-- ADD few users
INSERT users
VALUES (DEFAULT, 'Olga', 'Petrova', '89293546568', 'olga@mail.com', 'sdfdasdsxzdsb', DEFAULT, DEFAULT),
		(DEFAULT, 'Oksana', 'Fedotova', '89293546567', 'oksana@mail.com', 'svcdaasdsxzdsb', DEFAULT, DEFAULT);
		
-- ADD through SET
INSERT users 
SET firstname = 'Iren',
	lastname = 'Sidorova',
	email = 'iren@mail.com',
	phone = '89213541560';

	
-- Add users using SELECT 
INSERT users (firstname, lastname, email, phone) 
SELECT name, surname, email, phone FROM test1.users;

/* 
*SELECT 
*https://dev.mysql.com/doc/refman/8.0/en/select.html
*/

-- Choose const
SELECT 'Hello World';

-- Select unique users
SELECT DISTINCT firstname FROM users;

-- choose users what haven't hash password
SELECT * FROM users WHERE password_hash  IS NULL;

-- choose users what have hash password
SELECT * FROM users WHERE password_hash  IS NOT NULL;

SELECT * FROM users WHERE firstname = 'Аноним';

SELECT * FROM users WHERE id >= 85;

SELECT * FROM users WHERE id >=85 AND ID <=100;

SELECT * FROM users WHERE id BETWEEN 85 AND 100;

SELECT lastname, firstname, phone FROM users;

SELECT lastname, substr(firstname, 1, 1), phone FROM users;

SELECT CONCAT (lastname, ' ', substr(firstname, 1, 1), '.') AS username, phone FROM users;

SELECT * FROM users WHERE firstname = 'Екатерина' AND id BETWEEN 70 AND 100; 

SELECT * FROM users WHERE firstname = 'Екатериан' OR firstname = 'Аноним';

SELECT * FROM users LIMIT 4;

SELECT * FROM users LIMIT 5 OFFSET 10;

SELECT * FROM users LIMIT 10,5;

/*
 * UPDATE
* https://dev.mysql.com/doc/refman/8.0/en/update.html
*/

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES (45, 55, 'Hi!!');

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES (45, 55, 'You are good!!');

SELECT * FROM messages;

-- change text messages
UPDATE messages
SET body = 'You are really good)'
WHERE id =5;

-- change status messages
UPDATE messages
SET is_delivered = 1
WHERE body IS NOT NULL; 

/* 
* DELETE 
* https://dev.mysql.com/doc/refman/8.0/en/delete.html
* TRUNCATE 
* https://dev.mysql.com/doc/refman/8.0/en/truncate-table.html
*/

-- delete users lastname Stepanov
SELECT * FROM users WHERE lastname = 'Stepanov';

DELETE FROM users WHERE lastname = 'Stepanov';

DELETE FROM messages;

SELECT * FROM messages;

SELECT * FROM users WHERE lastname = 'Иванов' OR lastname = 'Ivanov';

DELETE FROM users WHERE lastname = 'Иванов' OR lastname = 'Ivanov';

DELETE FROM users WHERE id = 1;

SELECT * FROM communities_users;

TRUNCATE TABLE communities_users;



