USE vk;

INSERT INTO 
city_names (name)
VALUES 
('Yekaterinburg'),
('Kaliningrad'),
('Krasnodar'),
('Krasnoyarsk'),
('Kurgan'),
('Kursk'),
('Irkutsk'),
('Voronezh'),
('Vladivostok'),
('Vladikavkaz'),
('Magadan'),
('Norilsk'),
('Omsk'),
('Orenburg'),
('Ryazan'),
('Rostov-on-Don'),
('Ufa');

SELECT * FROM city_names;

INSERT INTO 
communities (name, admin_id)
VALUES 
('BA', 3),
('Films', 5),
('Art', 8),
('Sport', 10),
('Theatre', 4),
('Cinema', 9),
('School', 11),
('Games', 15),
('News', 24),
('Books', 21),
('university', 17),
('Halloween', 13);

SELECT * FROM communities;

INSERT INTO 
communities (name, admin_id)
VALUES 
('Space', 16);

INSERT INTO
communities_users (community_id, user_id)
VALUES
(1, 5),
(2, 4),
(3, 8),
(4, 50),
(5, 20),
(6, 15),
(7, 13),
(8, 7),
(9, 26),
(10, 15);

INSERT INTO 
country_names  (name)
VALUES 
('Slovenia'),
('Estonia'),
('Latvian'),
('Lithuania'),
('Romania'),
('Moldova'),
('Kazakhstan'),
('Armenia'),
('Afghanistan'),
('Bulgaria');

INSERT INTO
friend_requests  (from_user_id, to_user_id, accepted)
VALUES 
(2, 4, DEFAULT),
(8, 15, 1),
(7, 2, DEFAULT),
(3, 1, 1),
(5, 6, 1),
(2, 9, DEFAULT),
(2, 16, DEFAULT),
(3, 9, 1),
(6, 11, DEFAULT),
(1, 8, 1);

INSERT INTO
media  (user_id, media_types_id, file_name, file_size, created_at)
VALUES 
(8, 3, 'chanson.mp3', 1800, DEFAULT),
(11, 3, 'forest.mp3', 250, DEFAULT),
(13, 3, 'river.mp3', 1900, DEFAULT),
(2, 3, 'flame.mp3', 100, DEFAULT),
(14, 3, 'mountain.mp3', 180, DEFAULT),
(18, 3, 'classic.mp3', 1800, DEFAULT),
(9, 3, 'rock.mp3', 2920, DEFAULT),
(7, 3, 'ost.mp3', 2700, DEFAULT),
(5, 3, 'soundtrack.mp3', 3500, DEFAULT),
(10, 3, 'ost.mp3', 2250, DEFAULT);

INSERT INTO
media_types (name)
VALUES
('Gif'),
('link'),
('smile'),
('stickers'),
('location'),
('archive'),
('app'),
('files');

INSERT INTO messages (from_user_id, to_user_id, body)
VALUES 
(45, 55, 'Hi!!'),
(55, 55, 'Hello!!'),
(45, 55, 'How are you?'),
(55, 45, 'Nice!'),
(55, 45, 'And you?'),
(45, 55, 'Me too.'),
(45, 55, 'What do you do?'),
(55, 55, 'Watch movie'),
(55, 45, 'And you?'),
(45, 55, 'Do homework'),
(45, 55, 'Can you help with second task?'),
(55, 45, 'Not now, i do not finish my homework.'),
(55, 45, 'I want to do it later'),
(45, 55, 'ok. I write you later, ok?'),
(55, 45, 'ok');

INSERT INTO profiles (user_id, gender, birthday, photo_id, city, country)
VALUES (3, 'm', '1997-10-12', DEFAULT, 'Kazan', 'Russia');

INSERT INTO profiles (user_id, gender, birthday, photo_id, city, country)
VALUES 
(4, 'm', '2003-10-12', 17, 'Samara', 'Russia'),
(5, 'f', '2005-02-12', 18, 'Novosibirsk', 'Russia'),
(6, 'f', '2001-10-17', 19, 'Saratov', 'Russia'),
(7, 'f', '2006-05-29', 20, 'St Petersburg', 'Russia'),
(8, 'f', '1998-08-22', 21, 'Ufa', 'Russia'),
(9, 'f', '2002-01-29', 22, 'Omsk', 'Russia'),
(10, 'f', '2008-04-19', 23, 'Kursk', 'Russia'),
(11, 'm', '1999-04-05', 24, 'Sochi', 'Russia'),
(12, 'f', '1998-07-20', 25, 'Kaliningrad', 'Russia');

INSERT INTO
media  (user_id, media_types_id, file_name, file_size, created_at)
VALUES 
(28, 4, 'ResidentEvil.jpg', 800, DEFAULT),
(31, 4, 'Witcher.jpg', 221, DEFAULT),
(33, 4, 'GoT.jpg', 1918, DEFAULT),
(22, 4, 'pirate.jpg', 1601, DEFAULT),
(24, 4, 'AllMight.jpg', 680, DEFAULT),
(28, 4, 'Naruto.jpg', 800, DEFAULT),
(19, 4, 'Persona.jpg', 920, DEFAULT),
(17, 4, 'ShieldHero.jpg', 270, DEFAULT),
(15, 4, 'RDR2.jpg', 350, DEFAULT),
(30, 4, 'AC_DC.jpg', 250, DEFAULT);

UPDATE profiles 
SET photo_id = '16'
WHERE photo_id = '3'; 

INSERT INTO
music  (media_id, music_id, Duration , file_name, author, genre)
VALUES 
(6, 3, '00:01:25', 'chanson.mp3', 'Anonim', 'blues'),
(7, 3, '00:02:15', 'forest.mp3', 'Anonim', 'easy listening'),
(8, 3, '00:03:35', 'river.mp3', 'Anonim', 'easy listening'),
(9, 3, '00:01:32', 'flame.mp3', 'Anonim', 'easy listening'),
(10, 3, '00:02:54', 'mountain.mp3', 'Anonim', 'blues'),
(11, 3, '00:03:20', 'classic.mp3', 'Anonim', 'classical'),
(12, 3, '00:01:41', 'rock.mp3', 'Anonim', 'rock'),
(13, 3, '00:01:58', 'ost.mp3.mp3', 'Anonim', 'electronic'),
(14, 3, '00:01:14', 'soundtrack.mp3', 'Anonim', 'electronic'),
(15, 3, '00:02:25', 'opening.mp3', 'Anonim', 'blues');

-- Task 4.2
-- Это просто.
USE vk;

SELECT DISTINCT firstname FROM users
ORDER BY firstname  DESC; 

-- Task 4.3

ALTER TABLE profiles 
  ADD is_active tinyint(1) DEFAULT '1';
 
 SELECT * FROM profiles;

-- Костыльный вариант. Не придумал как корректно отнимать от текущей даты 18 лет.
UPDATE profiles 
 SET is_active = '0' WHERE birthday >= '2003-10-22' ;

UPDATE profiles 
 SET is_active = '1';



-- Task 4.4
DELETE FROM messages WHERE created_at > CURRENT_TIMESTAMP OR updated_at > CURRENT_TIMESTAMP ;

-- Example of using code
CREATE TABLE THING (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `TO_user_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delivered` tinyint(1) DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `TO_user_id` (`TO_user_id`)
);

-- Для этого быыла создана таблица с данными, загружены данные раньше текушей даты
INSERT INTO THING (from_user_id, to_user_id, body, created_at, updated_at)
VALUES
(45, 55, 'Hi!!', '2023-10-22 13:18:55', DEFAULT),
(55, 45, 'Hello!!', DEFAULT, '2023-10-22 13:18:55'),
(45, 55, 'How are you?', DEFAULT, DEFAULT),
(55, 45, 'Nice!', '2023-10-21 13:18:55', '2023-10-22 13:18:55'),
(55, 45, 'And you?', DEFAULT, DEFAULT),
(45, 55, 'Me too.', '2023-10-22 13:18:55', '2023-10-22 13:18:55'),
(45, 55, 'What do you do?', DEFAULT, DEFAULT),
(55, 55, 'Watch movie', '2023-10-22 13:18:55', DEFAULT),
(55, 45, 'And you?', '2023-10-22 13:18:55', '2023-10-22 13:18:55'),
(45, 55, 'Do homework', DEFAULT, DEFAULT),
(45, 55, 'Can you help with second task?', DEFAULT, '2023-10-22 13:18:55'),
(55, 45, 'Not now, i do not finish my homework.', DEFAULT, DEFAULT),
(55, 45, 'I want to do it later', DEFAULT, DEFAULT),
(45, 55, 'ok. I write you later, ok?', DEFAULT, DEFAULT),
(55, 45, 'ok', DEFAULT, DEFAULT);

SELECT * FROM thing; 

DELETE FROM thing WHERE created_at > CURRENT_TIMESTAMP OR updated_at > CURRENT_TIMESTAMP ;

-- Task 4.5
-- "Описание модели хранения данных интернет-магазина на примере сети "Мвидео"."

