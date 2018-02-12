/* SUBQUERY */

/* a SUBQUERY is a nested query */ 

/* Use a subquery to find: films whos rental rate is higher than the average rental rate */ 
/* Long way */ 
SELECT ROUND(AVG(rental_rate),2) 
FROM film;

SELECT title, rental_rate
FROM film
WHERE rental_rate > 2.98;

/* Short way (subquery) */
SELECT title, rental_rate 
FROM film
WHERE rental_rate > (SELECT ROUND(AVG(rental_rate),2) 
                    FROM film);
                    
/* Show all the films returned between 05/29/2005 and 05/30/2005*/
SELECT title
FROM film
WHERE film_id IN (SELECT inventory.film_id 
				 FROM rental
				 JOIN inventory
                 ON inventory.inventory_id = rental.inventory_id
                 WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');

