SELECT 
    credits.name AS director,
    COUNT(*) AS appearence,
    ROUND(AVG(imdb_score), 2) AS avg_rating
FROM
    credits
        JOIN
    titles ON credits.id = titles.id
WHERE
    titles.imdb_score > 8
        AND credits.role = 'DIRECTOR'
GROUP BY credits.name
ORDER BY appearence DESC
LIMIT 10;