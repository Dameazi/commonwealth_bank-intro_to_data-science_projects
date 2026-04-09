-- TABLE 1 USERS
CREATE TABLE Users(
	user_id BIGINT NOT NULL PRIMARY KEY,
	display_name VARCHAR(50) NOT NULL, 
	username VARCHAR(50) UNIQUE NOT NULL,
	verification BOOLEAN DEFAULT FALSE,
	followers_count INT,
	created_at TIMESTAMP NOT NULL
);


-- TABLE 2 TWEETS

CREATE TABLE Tweets(
	tweet_id BIGINT NOT NULL PRIMARY KEY,
	tweet_time TIMESTAMP NOT NULL,
	tweet_type VARCHAR(20) NOT NULL CHECK(tweet_type IN ('Original', 'Reply', 'Quote')),
	commbank_mentioned BOOLEAN DEFAULT FALSE,
	--OWNER
	user_id BIGINT,
	-- ENGAGEMENTS 
	reposts_count BIGINT DEFAULT 0,
    comment_count BIGINT DEFAULT 0,
    likes BIGINT DEFAULT 0,
    impressions_count BIGINT DEFAULT 0,
	comment_section_on BOOLEAN DEFAULT TRUE,
	-- LANGUAGE

	tweet_language VARCHAR(20) DEFAULT 'en',
	----- CONTENT
	tweet_content VARCHAR(200) NOT NULL,
	CONSTRAINT fk_tweets_user 
        FOREIGN KEY (user_id) 
        REFERENCES Users(user_id)
);

CREATE TABLE Tweet_Mentions(
	mention_id BIGINT NOT NULL PRIMARY KEY,
	tweet_id BIGINT NOT NULL,
	mentioned_user_id BIGINT NOT NULL,
	mention_content VARCHAR(200) NOT NULL,
	mention_time TIMESTAMP NOT NULL,
 
	CONSTRAINT fk_replied_tweet 
        FOREIGN KEY (tweet_id) 
        REFERENCES Tweets(tweet_id),
		
	CONSTRAINT mentioned_user
		FOREIGN KEY (mentioned_user_id)
		REFERENCES Users(user_id)
);

CREATE TABLE Tweet_Media(
	media_id BIGINT NOT NULL PRIMARY KEY,
	tweet_id BIGINT NOT NULL,
	media_url VARCHAR(200) NOT NULL,
	media_type VARCHAR(20) CHECK (media_type IN ('photo', 'video', 'gif')),
	CONSTRAINT fk_tweet_media
        FOREIGN KEY (tweet_id) 
        REFERENCES Tweets(tweet_id)
);

-- TESTING DATA 

INSERT INTO Users (user_id, display_name, username, verification, followers_count, created_at) VALUES
(1001, 'John Doe', 'johndoe', TRUE, 12500, '2023-01-15 10:30:00'),
(1002, 'Jane Smith', 'janesmith', FALSE, 3200, '2023-02-10 14:20:00'),
(1003, 'Tech World', 'techworld', TRUE, 55000, '2022-11-05 09:00:00'),
(1004, 'Crypto Guru', 'cryptoguru', FALSE, 8700, '2023-03-01 18:45:00'),
(1005, 'Finance Daily', 'financedaily', TRUE, 42000, '2022-12-20 07:15:00');

INSERT INTO Tweets (
tweet_id, tweet_time, tweet_type, commbank_mentioned, user_id,
reposts_count, comment_count, likes, impressions_count,
comment_section_on, tweet_language, tweet_content
) VALUES
(2001, '2024-04-01 08:00:00', 'Original', TRUE, 1001, 50, 10, 200, 5000, TRUE, 'en', 'Commbank services are improving!'),
(2002, '2024-04-01 09:15:00', 'Reply', FALSE, 1002, 5, 2, 20, 800, TRUE, 'en', 'I agree with you!'),
(2003, '2024-04-01 10:30:00', 'Quote', TRUE, 1003, 120, 40, 600, 15000, TRUE, 'en', 'Interesting take on Commbank trends'),
(2004, '2024-04-02 11:45:00', 'Original', FALSE, 1004, 30, 5, 150, 4000, TRUE, 'en', 'Crypto market is volatile today'),
(2005, '2024-04-02 13:00:00', 'Original', TRUE, 1005, 200, 80, 1000, 25000, TRUE, 'en', 'Finance insights on Commbank performance');



INSERT INTO Tweet_Mentions (
mention_id, tweet_id, mentioned_user_id, mention_content, mention_time
) VALUES
(3001, 2001, 1003, '@techworld check this out!', '2024-04-01 08:05:00'),
(3002, 2003, 1001, '@johndoe great point!', '2024-04-01 10:35:00'),
(3003, 2005, 1004, '@cryptoguru thoughts?', '2024-04-02 13:10:00');

INSERT INTO Tweet_Media (
media_id, tweet_id, media_url, media_type
) VALUES
(4001, 2001, 'https://example.com/image1.jpg', 'photo'),
(4002, 2003, 'https://example.com/video1.mp4', 'video'),
(4003, 2004, 'https://example.com/gif1.gif', 'gif'),
(4004, 2005, 'https://example.com/image2.jpg', 'photo');



-- USERS THAT MENTIONED COMMBANK --

SELECT 
	u.display_name AS "Who mentioned CommBank", 
	t.tweet_type AS "Type of Tweet", 
	t.tweet_content AS "Content"
FROM Users u
JOIN Tweets t
	ON u.user_id = t.user_id	
WHERE t.commbank_mentioned IS TRUE;