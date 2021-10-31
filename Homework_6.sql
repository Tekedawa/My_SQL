
-- Homework 6
-- use English because russian show some hieroglyphs
USE vk;

-- task 1
-- choose table to see content
SELECT * FROM messages;

-- sorting all message using two conditions (GROUP BY from_user_id, to_user_id ).
-- Find users, who sent messages And users receive messages.
SELECT COUNT(*) AS cnt, from_user_id, to_user_id 
FROM messages 
GROUP BY from_user_id, to_user_id 
ORDER BY cnt desc; 

-- use last requset and find user who sent most count messages to onother user 
SELECT COUNT(*) AS cnt, from_user_id, to_user_id 
FROM messages 
GROUP BY from_user_id, to_user_id 
ORDER BY cnt desc
LIMIT 1;

-- Task 2


/*SELECT * FROM likes;

SELECT * FROM profiles;

SELECT * FROM users;

SELECT
	COUNT(*) AS cnt,
	(SELECT user_id FROM profiles WHERE users_id.profiles = user_id.likes AND birthday >= (current_date - INTERVAL 10 YEAR) ) AS id, 
	(SELECT firstname FROM users WHERE id = (SELECT user_id FROM profiles WHERE users_id.profiles = user_id.likes AND birthday >= (current_date - INTERVAL 10 YEAR) ) AS name
FROM likes;

SELECT
	COUNT(*) AS cnt,
	(SELECT user_id FROM profiles WHERE user_id.profiles = user_id.likes AND birthday >= (current_date - INTERVAL 10 YEAR) ) AS id 
FROM likes;

SELECT
	COUNT(*) AS cnt,
	user_id,
	(SELECT user_id FROM profiles WHERE birthday >= (current_date - INTERVAL 10 YEAR) ) AS id 
	FROM likes
	GROUP BY user_id;
	
SELECT user_id FROM profiles WHERE birthday >= (current_date - INTERVAL 10 YEAR);

SELECT
	COUNT(*) AS cnt,
	user_id
	FROM likes
	GROUP BY user_id;*/
	
-- attempt number 2
SELECT profiles.user_id,  profiles.birthday FROM likes
  INNER JOIN  profiles  ON profiles.user_id = likes.user_id
WHERE birthday >= (current_date - INTERVAL 10 YEAR);


	
SELECT profiles.user_id, profiles.birthday, likes.media_id 
FROM profiles, likes
WHERE profiles.user_id = likes.user_id
AND profiles.birthday >= (current_date - INTERVAL 10 YEAR);


SELECT COUNT(*)AS cnt
FROM profiles, likes
WHERE profiles.user_id = likes.user_id
AND profiles.birthday >= (current_date - INTERVAL 10 YEAR);

/*
-- attempt 3
SELECT
	COUNT(*)AS cnt,
	(SELECT city FROM profiles WHERE user_id = 1) AS city, 
	(SELECT file_name FROM media WHERE id = (SELECT photo_id FROM profiles WHERE user_id = 1)) AS profile_photo
FROM users
WHERE id = 1;

-- attempt 4
SELECT profiles.user_id FROM profiles WHERE id = (SELECT media.user_id FROM media WHERE id = (SELECT media.id FROM media WHERE id = (SELECT media.user_id FROM media WHERE user_id = 1)))


SELECT likes.id FROM likes WHERE id = (SELECT likes.media_id FROM likes WHERE id = (SELECT media.id FROM media WHERE id = (SELECT media.user_id FROM media WHERE user_id = (SELECT profiles.user_id FROM profiles WHERE profiles.birthday >= (current_date - INTERVAL 10 YEAR)))));

-- using nested request
SELECT likes.id FROM likes WHERE id in (SELECT likes.media_id FROM likes WHERE id IN (SELECT media.id FROM media WHERE id IN (SELECT media.user_id FROM media WHERE user_id IN (SELECT profiles.user_id FROM profiles WHERE profiles.birthday >= (current_date - INTERVAL 10 YEAR)))));


(SELECT media.user_id FROM media WHERE user_id IN (SELECT profiles.user_id FROM profiles WHERE profiles.birthday >= (current_date - INTERVAL 10 YEAR)));


SELECT profiles.user_id FROM profiles WHERE profiles.birthday >= (current_date - INTERVAL 10 YEAR);


-- attempt 5
SELECT media.user_id id FROM media WHERE id = (
SELECT profiles.user_id 
FROM profiles 
WHERE profiles.birthday >= (current_date - INTERVAL 10 YEAR));

SELECT profiles.user_id 
FROM profiles 
WHERE profiles.birthday >= (current_date - INTERVAL 10 YEAR);

SELECT media.user_id id FROM media WHERE id = ;


-- attempt 6
SELECT media.user_id FROM media WHERE id = likes.media_id;

SELECT  likes.media_id 
FROM likes;*/

-- attempt 7
SELECT DISTINCT media.user_id, profiles.birthday
FROM media, likes, profiles, users
WHERE media.user_id = likes.media_id
AND media.user_id = profiles.user_id
AND profiles.birthday >= (current_date - INTERVAL 10 YEAR);

SELECT DISTINCT media.user_id, profiles.birthday
FROM media, likes, profiles, users
WHERE media.user_id = likes.media_id
AND media.user_id = profiles.user_id
AND profiles.birthday >= (current_date - INTERVAL 10 YEAR);



-- attempt number 8
-- I used inner join but the result wasn't such i expected
-- I used nested request - but the mistake 1242 apperaed - after i knew about "in"
-- And so i dexided use such request 

-- it's test 1 in attempt 8
SELECT DISTINCT count(*) AS cnt, media.user_id
FROM media, likes
WHERE media.user_id = likes.media_id;

-- it's test 2 in attempt 8
SELECT count(media.user_id) AS cnt, media.user_id
FROM media, likes
WHERE media.user_id = likes.media_id
AND media.id = likes.media_id 
GROUP BY user_id;

-- it's test 3 in attempt 8
SELECT count(media.user_id) AS cnt, media.user_id
FROM media, likes
WHERE media.id = likes.media_id
GROUP BY user_id;

-- it's test 4 in attempt 8
SELECT count(media.user_id) AS cnt, media.user_id, profiles.birthday
FROM media, likes, profiles
WHERE media.id = likes.media_id
AND media.user_id = profiles.user_id
AND profiles.birthday > (current_date - INTERVAL 10 YEAR)
GROUP BY user_id;

-- It's finnally result.
-- I think it more understandable and short code than using nested requests. Using nested requests the code became difficult to understanding.
-- And i cheated and decided to use this structure.
-- And in the task doesn't have any word about which structure we must to use to do homework. 
-- Firstly, do homework. 
-- Secondly, do homework using less code
-- Thirdly, everything else
SELECT count(*) AS cnt
FROM media, likes, profiles
WHERE media.id = likes.media_id
AND media.user_id = profiles.user_id
AND profiles.birthday > (current_date - INTERVAL 10 YEAR);



-- Task 3
-- it was easy after task 2
-- It's more shortly than using nested request.  Example.
SELECT  profiles.gender, COUNT(*)AS cnt
FROM profiles, likes
WHERE profiles.user_id = likes.user_id
GROUP BY profiles.gender
LIMIT 1; 

-- example 2
SELECT 'Женщины' AS gender, count(*) AS cnt FROM likes 
WHERE user_id IN (SELECT id FROM users WHERE id IN (SELECT user_id FROM profiles WHERE gender = 'f'))
UNION 
 SELECT 'Мужчины' AS gender, count(*) AS cnt  FROM likes 
WHERE user_id IN ( SELECT id FROM users WHERE id IN (SELECT user_id FROM profiles WHERE gender = 'm'))
ORDER BY cnt DESC LIMIT 1;


