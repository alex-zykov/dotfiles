SELECT accounts.id, last_seen_at, avatar_photo_id as photo, nick_name, first_name, middle_name, last_name, friends.count as friends, likes, average, position FROM accounts
    SELECT accounts.id as id, row_number() over (ORDER BY likes DESC NULLS LAST, accounts.created_at ASC) as position, likes.count as likes, likes.avg as average FROM accounts
        SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author FROM likes
        WHERE likes.status = 'Active'
        GROUP BY author
    ) AS likes ON accounts.id = likes.author
    WHERE accounts.in_rating AND NOT accounts.deleted
) AS raiting ON accounts.id = raiting.id