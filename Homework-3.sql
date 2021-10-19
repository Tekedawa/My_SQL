USE vk;

SELECT * FROM users;

DROP TABLE music;

-- 1 Table

CREATE TABLE music(
	id SERIAL,
	media_id BIGINT UNSIGNED NOT NULL,
	music_id INT UNSIGNED NOT NULL,
	Duration TIME,
	file_name VARCHAR (255),
	author VARCHAR (255),
	genre VARCHAR (255),
	INDEX music_idx (file_name),
	FOREIGN KEY (media_id) REFERENCES media (id),
	FOREIGN KEY (music_id) REFERENCES media (media_types_id)
		);
	
	INSERT INTO music VALUES (DEFAULT, 1, 3, "00:05:20", 'music1', 'author', 'rock');
	INSERT INTO music VALUES (DEFAULT, 2, 3, "00:04:22", 'music2', 'author2', 'western');
SELECT * FROM music;

-- 2 Table

CREATE TABLE city_names(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (45) NOT NULL UNIQUE
);

INSERT INTO city_names VALUES (DEFAULT, 'Moscow');
INSERT INTO city_names VALUES (DEFAULT, 'St Petersburg');
INSERT INTO city_names VALUES (DEFAULT, 'Kazan');
INSERT INTO city_names VALUES (DEFAULT, 'Samara');
INSERT INTO city_names VALUES (DEFAULT, 'Saratov');
INSERT INTO city_names VALUES (DEFAULT, 'Volgograd');
INSERT INTO city_names VALUES (DEFAULT, 'Novosibirsk');
INSERT INTO city_names VALUES (DEFAULT, 'Sochi');

SELECT * FROM city_names;

ALTER TABLE profiles
ADD FOREIGN KEY (city) REFERENCES city_names (name);
SELECT * FROM city_names;


-- 3 Table

CREATE TABLE country_names(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (45) NOT NULL UNIQUE
);

INSERT INTO country_names VALUES (DEFAULT, 'Russia');
INSERT INTO country_names VALUES (DEFAULT, 'Ukraine');
INSERT INTO country_names VALUES (DEFAULT, 'Belarus');
INSERT INTO country_names VALUES (DEFAULT, 'Uzbekistan');
INSERT INTO country_names VALUES (DEFAULT, 'Turkmenistan');
INSERT INTO country_names VALUES (DEFAULT, 'Tajikistan');
INSERT INTO country_names VALUES (DEFAULT, 'Poland');
INSERT INTO country_names VALUES (DEFAULT, 'Serbia');

SELECT * FROM country_names;

ALTER TABLE profiles
ADD FOREIGN KEY (country) REFERENCES country_names (name);
SELECT * FROM country_names;
