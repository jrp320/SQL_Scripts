/* */
/* Selecting values between a condition */
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 8 AND 9;

/* NOT BETWEEN  */
SELECT customer_id, amount
FROM payment
WHERE amount NOT BETWEEN 4 AND 9;

/* Between dates */
SELECT amount, payment_date
FROM payment
WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';

/* IN SPECIFIC VALUES */
SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id
IN (1,2)
ORDER BY return_date DESC
LIMIT 10;

/* NOT IN SPECIFIC VALUES */
SELECT customer_id, rental_id, return_date
FROM rental
WHERE customer_id
NOT IN (1,2)
ORDER BY return_date DESC
LIMIT 10;

/* Like Statements */ 

/* finding all names that begin with Jen */
SELECT first_name, last_name 
FROM customer
WHERE first_name
LIKE 'Jen%';

/* finding all names that end with y */
SELECT first_name, last_name 
FROM customer
WHERE first_name
LIKE '%y';

/* finding all names that include an 'er' */
SELECT first_name, last_name 
FROM customer
WHERE first_name
LIKE '%er%';

/* NOTE: Like is case sensetive! ILIKE is not case sensetive */
SELECT first_name, last_name 
FROM customer
WHERE first_name
ILIKE 'jEn%';

/* Challenge */

/* How many payment transactions were greater than $5 */
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;

/* How many actors have a first name with a letter P?*/
SELECT COUNT(*) 
FROM actor
WHERE first_name
LIKE 'P%';

/* How many unique districts are our customers from? */
SELECT COUNT(DISTINCT(district))
FROM address;

/* retreive the list of names of those districts*/
SELECT DISTINCT(district)
FROM address;

/* How many films have a ratingof R 
and a replacement cost between 5 and 15 dollars */
SELECT COUNT(*) AS repl_cost_5and15
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

/* How many films have "truman" in the Tile? */
SELECT COUNT(*)
FROM film
WHERE title
LIKE '%Truman%';






