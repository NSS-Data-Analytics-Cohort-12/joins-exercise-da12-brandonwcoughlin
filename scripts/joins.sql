-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.

-- select specs.movie_id, specs.film_title, specs.release_year, revenue.worldwide_gross, revenue.movie_id
-- from specs
-- left join revenue
-- on specs.movie_id = revenue.movie_id
-- order by revenue.worldwide_gross asc;

-- Semi-Tough, 1977, 37187139


-- 2. What year has the highest average imdb rating?

-- select specs.release_year,
-- 	avg(rating.imdb_rating) as avg_rating
-- from specs
-- inner join rating
-- on specs.movie_id = rating.movie_id
-- group by specs.release_year
-- order by avg_rating desc;

-- 2008 had the highest imdb rating of 9.0

-- 3. What is the highest grossing G-rated movie? Which company distributed it?

-- select specs.domestic_distributor_id, 
-- 	specs.film_title, 
-- 	specs.mpaa_rating, 
-- 	revenue.worldwide_gross
-- from specs
-- inner join revenue
-- 	on specs.movie_id = revenue.movie_id
-- 	where specs.mpaa_rating = 'G'	
-- order by revenue.movie_id
-- limit 1;

-- Toy Story 4 was the highest grossing G rated movie. 

-- select specs.domestic_distributor_id, 
-- 	specs.film_title, 
-- 	specs.mpaa_rating, 
-- 	revenue.worldwide_gross,
-- 	distributors.company_name
-- from specs
-- inner join revenue
-- 	on specs.movie_id = revenue.movie_id
-- inner join distributors
-- 	on specs.domestic_distributor_id = distributors.distributor_id
-- 	where specs.mpaa_rating = 'G'	
-- order by revenue.movie_id

-- Walt Disney distributed Toy Story 4


-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
-- table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- select distributors.company_name, count(film_title) as count_film_title
-- from distributors
-- left join specs
-- on distributors.distributor_id = specs.domestic_distributor_id
-- group by distributors.company_name
-- order by count_film_title desc;

-- 5. Write a query that returns the five distributors with the highest average movie budget.

-- select distinct(distributors.company_name), 
-- 	avg(revenue.film_budget) as avg_budget
-- from distributors
-- inner join specs
-- on distributors.distributor_id = specs.domestic_distributor_id
-- inner join revenue
-- on specs.movie_id = revenue.movie_id
-- group by distributors.company_name
-- order by avg_budget desc
-- limit 5;

-- Walt Disney, Sony Pictures, Lionsgate, DreamWorks, Warner Bros.

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

-- select s.film_title,
-- 	r.imdb_rating
-- from specs as s
-- left join distributors as d
-- 	on s.domestic_distributor_id = d.distributor_id
-- left join rating as r
-- 	on s.movie_id = r.movie_id
-- where d.headquarters not like '%CA%'
-- order by 2 desc;

-- 2 movies are distributed by companies outide of CA. Dirty Dancing had the higher rating.

-- select distributors.headquarters, 
-- 	distributors.company_name,
-- 	count(specs.film_title), 
-- 	rating.imdb_rating,
-- 	specs.film_title
-- from distributors
-- left join specs
-- 	on distributors.distributor_id = specs.domestic_distributor_id
-- left join rating
-- 	on specs.movie_id = rating.movie_id
-- 	where distributors.headquarters not ilike '%CA'	
-- group by distributors.headquarters, distributors.company_name, rating.imdb_rating, specs.film_title

-- Dirty Dancing had the higher rating

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

-- select avg(rating.imdb_rating)
-- from rating
-- left join specs
-- on rating.movie_id = specs.movie_id
-- where specs.length_in_min >= 120

-- movies over 2 hours = 7.24975

-- select avg(rating.imdb_rating)
-- from rating
-- left join specs
-- on rating.movie_id = specs.movie_id
-- where specs.length_in_min <= 120

-- movies under 2 hours = 6.91541





