select * from payment limit 10;

/* Show customer ids that payed the most money */
SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
limit 10;

/* CHALLENGE */

/* We have 2 staff members with with staff IDs 1 and 2. We want to give a bonus to a staff member who handled the most payments 
How many payments did each handle and what was the total amount */
SELECT staff_id, SUM(amount) AS total_amount, COUNT(*) AS total_count
FROM payment
GROUP BY staff_id
ORDER BY total_count DESC;

/* find Average replacement cost of movies by rating */ 
SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating
ORDER BY AVG(replacement_cost) DESC; 

/* Find the 5 cusomer_id who have spent the most money */
SELECT customer_id, SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

/* Having */

/* CHALLENGE */

/* Find customers who have atleast 40 transactions */
SELECT customer_id, COUNT(*) AS total_trans
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 40;

/* What movie ratings have an average rental duration more than 5 days */
SELECT rating, ROUND(AVG(rental_duration),2)
FROM film
GROUP BY rating
HAVING AVG(rental_duration)> 5;
