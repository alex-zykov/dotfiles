SELECT accounts.id, last_seen_at, avatar_photo_id as photo, nick_name, first_name, middle_name, last_name, friends.count as friends, likes, average, position FROM accounts
LEFT JOIN (
    SELECT accounts.id as id, row_number() over (ORDER BY likes DESC NULLS LAST, accounts.created_at ASC) as position, likes.count as likes, likes.avg as average FROM accounts
    LEFT JOIN (
        SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author FROM likes
        JOIN articles ON articles.id = likes.target_id AND likes.target_type = 'Article' AND articles.status = 'Active' AND articles.created_at >= to_timestamp(1595797200) AND articles.created_at <= to_timestamp(1595883600)
        WHERE likes.status = 'Active'
        GROUP BY author
    ) AS likes ON accounts.id = likes.author
    WHERE accounts.in_rating AND NOT accounts.deleted
) AS raiting ON accounts.id = raiting.id