select *
from payment
limit 10;

/* Learning COUNT 
NOTE: COUNT(column) doesn not count nulls */

SELECT COUNT(*)
FROM payment;

SELECT COUNT(DISTINCT (amount))
FROM payment;

/* ORDER BY */

/* SORT BY LAST NAME IN DESC ORDER */
SELECT first_name, last_name
FROM CUSTOMER
ORDER BY last_name DESC;

/* SORT BY LAST NAME IN ASC ORDER */
SELECT first_name, last_name
FROM CUSTOMER
ORDER BY last_name ASC;

SELECT customer_id, payment
FROM payment
ORDER BY amount DESC
LIMIT 10;