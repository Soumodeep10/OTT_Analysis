
-- Total content
SELECT 
    type, COUNT(*) AS total_content
FROM
    titles
GROUP BY type;

-- Avg Rating
SELECT 
    ROUND(AVG(imdb_score)) AS avg_rating
FROM
    titles;

-- Release Year Distribution
select release_year, count(*) as total_content from titles
group by release_year
order by release_year;

-- Genre Distribution
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


-- Missing Value Check
SELECT
COUNT(CASE WHEN imdb_score IS NULL THEN 1 END) AS missing_imdb,
COUNT(CASE WHEN runtime IS NULL THEN 1 END) AS missing_runtime
FROM titles;


-- Role Distribution
SELECT role,
       COUNT(*) AS total_people
FROM credits
GROUP BY role;