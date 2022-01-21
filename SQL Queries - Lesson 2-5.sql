-- 1) Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor WHERE first_name = 'Scarlett';

-- 2) How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT inventory_id) AS amount_of_available_movies, COUNT(DISTINCT rental_id) AS rented_movies 
FROM sakila.rental;

-- 3) What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length), MAX(length) 
FROM sakila.film;

-- 4) What's the average movie duration expressed in format (hours, minutes)?
SELECT FLOOR(AVG(length)/60) AS hours  , AVG(length)%60 AS minutes
FROM sakila.film;

-- 5) How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) 
FROM sakila.actor;

-- 6) Since how many days has the company been operating (check DATEDIFF() function)?
-- If the company started the day of the first payment and ended the day of the last update, this would be the answer:
SELECT DATEDIFF(MAX(last_update), MIN(payment_date)) FROM sakila.payment;

-- 7) Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(rental_date, '%M') AS 'rental_month', date_format(rental_date, '%W') AS 'rental_day'
FROM sakila.rental LIMIT 20;

-- 8) Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
-- https://www.w3resource.com/mysql/date-and-time-functions/mysql-date_format-function.php
SELECT *, date_format(rental_date, '%M') AS 'rental_month', date_format(rental_date, '%W') AS 'rental_day',
     CASE
     WHEN (date_format(rental_date, '%w') BETWEEN 1 AND 5 ) THEN 'Weekday'
     ELSE 'Weekend'
     END AS 'day_type'
FROM sakila.rental LIMIT 20;

-- 9) Get release years.
SELECT title, release_year FROM sakila.film;

-- 10) Get all films with ARMAGEDDON in the title.
SELECT * 
FROM sakila.film_text 
WHERE title LIKE '%ARMAGEDDON%';

-- 11) Get all films which title ends with APOLLO.
SELECT * 
FROM sakila.film_text 
WHERE title LIKE '%APOLLO';

-- 12) Get 10 the longest films.
SELECT * 
FROM sakila.film 
ORDER BY length 
DESC LIMIT 10;

-- 13) How many films include Behind the Scenes content?
SELECT COUNT(title)
FROM sakila.film 
WHERE special_features LIKE '%Behind the Scenes%';
