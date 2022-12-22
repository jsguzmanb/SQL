/*
Here you´ll find various queries using, among others:
SELECT...FROM
SELECT DISTINCT
WHERE
Operators inside our WHERE, such as AND, OR, IN, LIKE
GROUP BY
	AGGREGATE FUNCTIONS: SUM, AVG, MIN, MAX, COUNT
HAVING
ORDER BY
*/

-- Choose the database
USE mavenmovies;

-- Select all
SELECT *
FROM film;

-- Select specific columns
SELECT
	first_name,
	last_name,
    email
FROM customer;

-- Bring unique values
SELECT DISTINCT
	rating
FROM film;

-- Filter
SELECT *
FROM payment
WHERE customer_id<=100;

-- Filter by more than 1 condition, with AND operator
SELECT *
FROM payment
WHERE customer_id < 101 
      AND amount>=5
	  AND payment_date > '2006-01-01';
      
-- Filter by more than 1 condition, with OR operator
SELECT *
FROM payment
WHERE customer_id = 42
      OR customer_id = 53
      OR customer_id = 60
      OR customer_id = 75
      OR amount>5;

-- Filter by more than 1 condition, with IN
SELECT *
FROM payment
WHERE customer_id IN (53,60,75);

-- Find partial results, using wildcards
SELECT *
FROM film
WHERE special_features LIKE '%Behind the Scenes%';

-- Group by a column, aggregating with count
SELECT
	rental_duration,
    COUNT(film_id)
FROM film
GROUP BY rental_duration;

-- Using alias, with AS
SELECT
	rental_duration,
    COUNT(film_id) AS films_with_this_rental_duration
FROM film
GROUP BY rental_duration;

-- Using several aggregate functions with GROUP BY
SELECT
	replacement_cost,
    COUNT(film_id) AS No_of_films,
    AVG(rental_rate) AS average_cost,
    MIN(rental_rate) AS minimum_cost,
    MAX(rental_rate) AS maximum_cost
FROM film
GROUP BY replacement_cost;

-- Filtering groups with HAVING
SELECT
	customer_id,
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
HAVING total_rentals <15;

-- Sort with ORDER BY
SELECT
	title,
    length,
    rental_rate
FROM film
ORDER BY 
    length DESC