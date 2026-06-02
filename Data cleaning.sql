SELECT * FROM titles LIMIT 10;
select * from titles
where imdb_score is null; ## No Null

select * from titles
where imdb_score is not null;


select title, count(*) as duplicates from titles
group by title
having count(*) > 1;  ## No duplicates

select distinct role from credits; ## no inconsistent
update credits
set role = UPPER(role);
select role from credits;

