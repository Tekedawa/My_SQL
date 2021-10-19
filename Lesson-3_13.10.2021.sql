create database IF NOT EXISTS vk;

USE vk;

SHOW tables

DROP TABLE IF EXISTS users;

CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR (50) NOT NULL,
	lastname VARCHAR (50) NOT NULL,
	phone CHAR (11) NOT NULL,
	email VARCHAR (120) UNIQUE,
	password_hash CHAR (65),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX (lastname),
	INDEX (phone)
);

-- Fill table, add Petr and Vasily

INSERT INTO users VALUES (1, 'Petya', 'Petukhov', '89999999999', 'petya@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT);

SELECT * FROM users;

INSERT INTO users VALUES (2, 'Vasya', 'Vasiliev', '89999999998', 'vasya@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', DEFAULT, DEFAULT);

CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL UNIQUE,
	gender ENUM('f', 'm', 'x') NOT NULL,
	birthday DATE NOT NULL,
	photo_id BIGINT UNSIGNED NOT NULL,
	city VARCHAR (130),
	country VARCHAR (130),
	FOREIGN KEY (user_id) REFERENCES users (id)
	);
	
INSERT INTO profiles VALUES (1, 'm', '1997-12-01', 1, 'Moscow', 'Russia');
INSERT INTO profiles VALUES (2, 'm', '1998-11-02', 2, 'Moscow', 'Russia');
SELECT * FROM profiles;

CREATE TABLE messages(
	id SERIAL,
	from_user_id BIGINT UNSIGNED NOT NULL,
	TO_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	is_delivered BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id)
);

INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Hi', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 1, 2, 'Vasya', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO messages VALUES (DEFAULT, 2, 1, 'Hi', DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM messages;

CREATE TABLE friend_requests(
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	accepted BOOl DEFAULT FALSE,
	PRIMARY KEY (from_user_id, to_user_id),
	FOREIGN KEY (from_user_id) REFERENCES users (id),
	FOREIGN KEY (to_user_id) REFERENCES users (id)
	);

INSERT INTO friend_requests VALUES (1, 2, 1);

DROP TABLE communities;

CREATE TABLE communities(
	id SERIAL,
	name VARCHAR (145) NOT NULL,
	description VARCHAR (255),
	admin_id BIGINT UNSIGNED NOT NULL,
	INDEX communities_name_idx (name),
	CONSTRAINT fk_communities_admin_id FOREIGN KEY (admin_id) REFERENCES users (id)
	); 
	
INSERT INTO communities VALUES (DEFAULT, 'Number1', 'I am number one', 1);

DROP TABLE communities_users;

CREATE TABLE communities_users (
	community_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (community_id, user_id),
	FOREIGN KEY (community_id) REFERENCES communities (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
	);
	
INSERT INTO communities_users VALUES (1, 2);

SELECT * FROM communities_users;

CREATE TABLE media_types(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (45) NOT NULL UNIQUE
);

INSERT INTO media_types VALUES (DEFAULT, 'изображение');
INSERT INTO media_types VALUES (DEFAULT, 'музыка');
INSERT INTO media_types VALUES (DEFAULT, 'документ');
INSERT INTO media_types VALUES (DEFAULT, 'видео');
SELECT * FROM media_types;

CREATE TABLE media(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_types_id INT UNSIGNED NOT NULL,
	file_name VARCHAR (255),
	file_size BIGINT UNSIGNED,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	INDEX media_users_idx (user_id),
	FOREIGN KEY (media_types_id) REFERENCES media_types (id),
	FOREIGN KEY (user_id) REFERENCES users (id)
	);

INSERT INTO media VALUES (DEFAULT, 1, 4, 'im.jpg', 100,  DEFAULT);
INSERT INTO media VALUES (DEFAULT, 1, 4, 'im1.jpg', 78, DEFAULT);
INSERT INTO media VALUES (DEFAULT, 2, 2, 'word.docx', 87, DEFAULT);

SELECT * FROM media;

