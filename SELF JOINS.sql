/* SELF JOINs */

/* A self join is when you join one table to itself. 
You must use table Alias to differentiate the tables */ 

SELECT * FROM customer;

/* Select all employeees that have a last name the same as anothers first name */
SELECT a.first_name, a.last_name, b.first_name, b.last_name
FROM customer AS a, customer AS b
WHERE a.first_name = b.last_name;

/* method #2 for self joins */
SELECT a.first_name, a.last_name, b.first_name, b.last_name
FROM customer AS a
JOIN customer AS b
ON a.first_name = b.last_name;