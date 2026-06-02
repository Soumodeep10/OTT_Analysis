-- Content Distribution
SELECT 
    title, release_year, imdb_score
FROM
    titles
ORDER BY imdb_score DESC
LIMIT 10;

SELECT 
    title, release_year, imdb_score
FROM
    titles
ORDER BY imdb_score asc
LIMIT 10;

-- Genres analysis with rating
SELECT 
    genres, ROUND(AVG(imdb_score), 2) AS avg_rating
FROM
    titles
GROUP BY genres
ORDER BY avg_rating DESC
LIMIT 10;

SELECT 
    genres, ROUND(AVG(imdb_score), 2) AS avg_rating
FROM
    titles
GROUP BY genres
ORDER BY avg_rating ASC
LIMIT 10;

-- Most active actor
select name, count(*) as appearence
from credits
where role = 'ACTOR'
group by name
order by appearence desc
limit 10;

-- Top director
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

-- Ranking movies with decade
SELECT title,
       release_year,
       imdb_score,
       RANK() OVER(
           PARTITION BY FLOOR(release_year/10)*10
           ORDER BY imdb_score DESC
       ) AS decade_rank
FROM titles;

-- Top 3 Movies per Decade
WITH ranked_movies AS (
    SELECT title,
           release_year,
           imdb_score,
           ROW_NUMBER() OVER(
               PARTITION BY FLOOR(release_year/10)*10
               ORDER BY imdb_score DESC
           ) AS rn
    FROM titles
)

SELECT *
FROM ranked_movies
WHERE rn <= 3;