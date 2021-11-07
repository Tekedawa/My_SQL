

-- task 1
-- choose table to see content
SELECT * FROM messages;

SELECT 
COUNT(*) AS cnt,
	from_user.lastname AS from_lastname, 
	from_user.firstname AS from_firstname,
	to_user.lastname AS to_lastname,
	to_user.firstname AS to_firstname
FROM messages 
JOIN users AS from_user ON messages.from_user_id = from_user.id
JOIN users AS to_user ON messages.to_user_id = to_user.id
GROUP BY from_user_id, to_user_id 
ORDER BY cnt DESC
LIMIT 1;

-- Task 2

-- Old version with full description
SELECT count(media.user_id) AS cnt, media.user_id, profiles.birthday
FROM media, likes, profiles
WHERE media.id = likes.media_id
AND media.user_id = profiles.user_id
AND profiles.birthday > (current_date - INTERVAL 10 YEAR)
GROUP BY user_id;

-- New version with full description
SELECT count(media.user_id) AS cnt, media.user_id, profiles.birthday
FROM media
JOIN likes ON  media.id = likes.media_id
JOIN profiles ON  media.user_id = profiles.user_id
WHERE profiles.birthday > (current_date - INTERVAL 10 YEAR)
GROUP BY user_id;

-- Old version for count 
SELECT count(*) AS cnt
FROM media, likes, profiles
WHERE media.id = likes.media_id
AND media.user_id = profiles.user_id
AND profiles.birthday > (current_date - INTERVAL 10 YEAR);


SELECT count(*) AS cnt
FROM media
JOIN likes ON  media.id = likes.media_id
JOIN profiles ON  media.user_id = profiles.user_id
WHERE profiles.birthday > (current_date - INTERVAL 10 YEAR);

-- Task 3

-- Old version
SELECT  	
	CASE profiles.gender
	WHEN 'f' THEN 'female'
	WHEN 'm' THEN 'male'
	WHEN 'x' THEN 'not defined'
	END AS gender,
	COUNT(*)AS Cnt
FROM profiles, likes
WHERE profiles.user_id = likes.user_id
GROUP BY profiles.gender
LIMIT 1; 

-- New version
SELECT  
	CASE profiles.gender
	WHEN 'f' THEN 'female'
	WHEN 'm' THEN 'male'
	WHEN 'x' THEN 'not defined'
	END AS gender,
	COUNT(*)AS Cnt
FROM profiles
JOIN likes ON  profiles.user_id = likes.user_id
GROUP BY profiles.gender
LIMIT 1; 