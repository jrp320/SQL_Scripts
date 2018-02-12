/* Advanced SQL Commands */ 
/* Google postgresSQK datetime for the syntaxes of the dates */
SELECT payment_date FROM payment;

/* The EXTRACT function lets you pull out parts of a datetime  */ 


/* EXTRACT the day from the timestamp */
SELECT EXTRACT(DAY from payment_date) AS day
FROM payment;

/* What month has had the most payment amount? */ 
SELECT EXTRACT(MONTH from payment_date) AS month, SUM(amount)
FROM payment
GROUP BY month
ORDER BY SUM(amount) DESC;


/* MATHEMATIC FUNCTIONS */


SELECT * FROM payment;
/* ADDING */
SELECT customer_id + rental_id AS new_id
FROM payment;

/* DIVISION rounds to the nearest interger by default */
SELECT customer_id / rental_id AS new_id
FROM payment;

SELECT rental_id / customer_id AS new_id
FROM payment;

/* String Functions */ 
SELECT * FROM customer;

/* CONCATENATE */ 
SELECT first_name || ' ' || last_name AS full_name
FROM customer;

/* CHAR_LENGTH */
SELECT first_name, CHAR_LENGTH(first_name) 
FROM customer;

/* UPPER/LOWER */
SELECT UPPER(first_name) 
FROM customer;