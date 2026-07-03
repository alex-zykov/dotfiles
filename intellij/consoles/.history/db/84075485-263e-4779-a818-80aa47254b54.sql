SELECT accounts.id, last_seen_at, avatar_photo_id as photo, nick_name, first_name, middle_name, last_name, friends.count as friends, likes, average, position FROM accounts;
;-- -. . -..- - / . -. - .-. -.--
SELECT accounts.id, last_seen_at, avatar_photo_id as photo, nick_name, first_name, middle_name, last_name
FROM accounts;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM accounts
LEFT JOIN (
    SELECT accounts.id as id, row_number() over (
        ORDER BY likes
        DESC NULLS LAST, accounts.created_at ASC
        ) as position, likes.count as likes, likes.avg as average FROM accounts
    LEFT JOIN (
        SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author
        FROM likes
        JOIN articles
        ON articles.id = likes.target_id AND likes.target_type = 'Article' AND articles.status = 'Active'
        WHERE likes.status = 'Active'
        GROUP BY author
    ) AS likes ON accounts.id = likes.author
    WHERE accounts.in_rating AND NOT accounts.deleted
) AS raiting ON accounts.id = raiting.id
LEFT JOIN (
    SELECT COUNT(*) AS count, subscriber_id
    FROM account_friendship
    WHERE account_friendship.status = 'Active'
    GROUP BY subscriber_id
) AS friends ON friends.subscriber_id = accounts.id
WHERE accounts.in_rating AND NOT accounts.deleted
ORDER BY position ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT nick_name, position, likes
FROM accounts
LEFT JOIN (
    SELECT accounts.id as id, row_number() over (
        ORDER BY likes
        DESC NULLS LAST, accounts.created_at ASC
    ) as position, likes.count as likes, likes.avg as average FROM accounts
    LEFT JOIN (
        SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author
        FROM likes
        JOIN articles
        ON articles.id = likes.target_id AND likes.target_type = 'Article' AND articles.status = 'Active'
        WHERE likes.status = 'Active'
        GROUP BY author
    ) AS likes ON accounts.id = likes.author
    WHERE accounts.in_rating AND NOT accounts.deleted
) AS raiting ON accounts.id = raiting.id
LEFT JOIN (
    SELECT COUNT(*) AS count, subscriber_id
    FROM account_friendship
    WHERE account_friendship.status = 'Active'
    GROUP BY subscriber_id
) AS friends ON friends.subscriber_id = accounts.id
WHERE accounts.in_rating AND NOT accounts.deleted
ORDER BY position ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT nick_name, position, likes
FROM accounts
LEFT JOIN (
    SELECT accounts.id as id, row_number() over (
        ORDER BY likes
        DESC NULLS LAST, accounts.created_at ASC
    ) as position, likes.count as likes, likes.avg as average FROM accounts
    LEFT JOIN (
        SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author
        FROM likes
        JOIN articles
        ON articles.id = likes.target_id AND
           likes.target_type = 'Article' AND
           articles.status = 'Active' AND
           articles.created_at >= '2020-02-16'::date AND
           articles.created_at < '2020-02-28'::date
        WHERE likes.status = 'Active'
        GROUP BY author
    ) AS likes ON accounts.id = likes.author
    WHERE accounts.in_rating AND NOT accounts.deleted
) AS raiting ON accounts.id = raiting.id
LEFT JOIN (
    SELECT COUNT(*) AS count, subscriber_id
    FROM account_friendship
    WHERE account_friendship.status = 'Active'
    GROUP BY subscriber_id
) AS friends ON friends.subscriber_id = accounts.id
WHERE accounts.in_rating AND NOT accounts.deleted
ORDER BY position ASC;
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author
        FROM likes
        JOIN articles
        ON articles.id = likes.target_id AND
           likes.target_type = 'Article' AND
           articles.status = 'Active' AND
           articles.created_at >= '2020-02-16'::date AND
           articles.created_at < '2020-02-28'::date
        WHERE likes.status = 'Active'
        GROUP BY author;
;-- -. . -..- - / . -. - .-. -.--
SELECT articles.id, COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author
        FROM likes
        JOIN articles
        ON articles.id = likes.target_id AND
           likes.target_type = 'Article' AND
           articles.status = 'Active' AND
           articles.created_at >= '2020-02-16'::date AND
           articles.created_at < '2020-02-28'::date
        WHERE likes.status = 'Active'
        GROUP BY author;
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author
FROM likes
         JOIN articles
              ON articles.id = likes.target_id AND
                 likes.target_type = 'Article' AND
                 articles.status = 'Active' AND
                 articles.created_at >= '2020-02-16'::date AND
                 articles.created_at < '2020-02-28'::date
WHERE likes.status = 'Active'
GROUP BY author;
;-- -. . -..- - / . -. - .-. -.--
SELECT accounts.id as id, row_number() over (
        ORDER BY likes
        DESC NULLS LAST, accounts.created_at ASC
    ) as position, likes.count as likes, likes.avg as average FROM accounts
    LEFT JOIN (
        SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author
        FROM likes
        JOIN articles
        ON articles.id = likes.target_id AND
           likes.target_type = 'Article' AND
           articles.status = 'Active' AND
           articles.created_at >= '2020-02-16'::date AND
           articles.created_at < '2020-02-28'::date
        WHERE likes.status = 'Active'
        GROUP BY author
    ) AS likes ON accounts.id = likes.author
    WHERE accounts.in_rating AND NOT accounts.deleted;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM likes
         JOIN articles
              ON articles.id = likes.target_id AND
                 likes.target_type = 'Article' AND
                 articles.status = 'Active' AND
                 articles.created_at >= '2020-02-16'::date AND
                 articles.created_at < '2020-02-28'::date
WHERE likes.status = 'Active';
;-- -. . -..- - / . -. - .-. -.--
articles.id, articles.author_id AS author;
;-- -. . -..- - / . -. - .-. -.--
SELECT articles.id, articles.author_id AS author
FROM likes
         JOIN articles
              ON articles.id = likes.target_id AND
                 likes.target_type = 'Article' AND
                 articles.status = 'Active' AND
                 articles.created_at >= '2020-02-16'::date AND
                 articles.created_at < '2020-02-28'::date
WHERE likes.status = 'Active';
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM likes
WHERE likes.status = 'Active', articles.id = 1991;
;-- -. . -..- - / . -. - .-. -.--
SELECT *
FROM likes
WHERE likes.status = 'Active' AND likes.target_id = 1991;
;-- -. . -..- - / . -. - .-. -.--
select to_timestamp(0);