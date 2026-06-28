SELECT name
FROM Customer
WHERE COALESCE(referee_id,0) != 2;

-- coalesce will convert null values to 0
-- leetcode 584. Find Customer Referee


SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
-- CHAR_LENGTH will return the number of characters in a string
-- leetcode 1683. Invalid Tweets