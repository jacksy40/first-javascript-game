-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.
select movies.title, movies.rating from movies
order by rating > 0 limit 10;


-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

select movies.title from movies
where movies.rating is null
order by movies.title limit 10;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

select movies.title from movies where movies.synopsis like '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

select movies.title, movies.year, movies.rating from movies
join genres on movies.genre_id = genres.id
where genres.name= 'Science Fiction & Fantasy' and movies.year
between 1980 and 1990
order by movies.rating desc;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

select actors.name, movies.title, movies.year from movies
join cast_members on movies.id = cast_members.movie_id
join actors on actors.id = cast_members.actor_id
where cast_members.character like '%James Bond%' order by year;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

select movies.title, movies.year, genres.name from movies
join genres on movies.genre_id = genres.id
join cast_members on movies.id = cast_members.movie_id
join actors on cast_members.actor_id = actors.id
where actors.name='Julianne Moore'
order by genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

select movies.title, movies.year, studios.name from movies
join studios on movies.studio_id = studios.id
join genres on movies.genre_id = genres.id
where genres.name= 'Horror'
order by movies.year asc limit 5;
