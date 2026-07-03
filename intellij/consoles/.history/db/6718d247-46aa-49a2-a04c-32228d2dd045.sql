SELECT * FROM vehicle_models WHERE slug = 'ftr-112';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM vehicle_models WHERE slug == 'ftr-1200';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM vehicle_models WHERE slug = 'ftr-1200';
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM vehicle_models WHERE slug = 'indian-ftr-1200';
;-- -. . -..- - / . -. - .-. -.--
Select * from vehicle_types;
;-- -. . -..- - / . -. - .-. -.--
SELECT version();
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN (#$set) AND status = 'Active' AND to_user_id = 19
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN ('comments') AND status = 'Active' AND to_user_id = 19
    GROUP BY thread;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN ('comments') AND status = 'Active' AND to_user_id = 19
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at AND t1.to_user_id = t2.to_user_id
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN ('comments') AND status = 'Active' AND to_user_id = 19
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
WHERE to_user_id = 19
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1

ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed
FROM notifications t1

ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN ('comments') AND status = 'Active' AND to_user_id = 19
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN ('comments','claims') AND status = 'Active' AND to_user_id = 19
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN ('comments','claims','b-reminders') AND status = 'Active' AND to_user_id = 19
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE thread IN ('comments','claims','b-reminders') AND to_user_id = 19
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE status = 'Active' AND (thread IN ('comments') AND to_user_id = 19) OR (thread IN ('b-reminders','claims'))
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE status = 'Active' AND (public AND to_user_id = 19)
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE status = 'Active' AND (public OR to_user_id = 19)
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE status = 'Active'
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
WHERE public OR to_user_id = 19
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE status = 'Active' AND (public OR to_user_id = 19)
    GROUP BY thread;
;-- -. . -..- - / . -. - .-. -.--
SELECT t1.id, t1.created_at, t1.updated_at, t1.status, t1.thread, t1.from_user_id, t1.to_user_id, t1.to_user_name, t1.to_user_id, t1.public, t1.administrative, t1.subject, t1.text, t1.viewed, t2.unviewed
FROM notifications t1
JOIN (
    SELECT thread, max(created_at) max_created_at, count(CASE WHEN NOT viewed THEN 1 END) unviewed
    FROM notifications
    WHERE status = 'Active' AND (public OR to_user_id = 19)
    GROUP BY thread
) t2 ON t1.thread = t2.thread AND t1.created_at = t2.max_created_at
WHERE public OR to_user_id = 19
ORDER BY t1.created_at DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM articles
WHERE created_at >= to_timestamp(1595797) AND created_at <= to_timestamp(1595883);
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM articles
WHERE created_at >= to_timestamp(1595797200) AND created_at <= to_timestamp(1595883600);
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author FROM likes
JOIN articles ON articles.id = likes.target_id AND likes.target_type = 'Article' AND articles.status = 'Active'
WHERE created_at >= to_timestamp(1595797200) AND created_at <= to_timestamp(1595883600);
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author FROM likes
JOIN articles ON articles.id = likes.target_id AND likes.target_type = 'Article' AND articles.status = 'Active'
WHERE articles.created_at >= to_timestamp(1595797200) AND articles.created_at <= to_timestamp(1595883600);
;-- -. . -..- - / . -. - .-. -.--
SELECT COUNT(*) AS count, AVG(stars) AS avg, articles.author_id AS author FROM likes
JOIN articles ON articles.id = likes.target_id AND likes.target_type = 'Article' AND articles.status = 'Active' AND articles.created_at >= to_timestamp(1595797200) AND articles.created_at <= to_timestamp(1595883600)
WHERE likes.status = 'Active'
GROUP BY author;