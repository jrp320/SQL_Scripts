/* Window Functions */

select * from employee;
select * from products;
select * from product_groups;
/* OVER */

-- not specifying range
-- averages are calculated row by row instead of a total
-- Difference between rows and range is that rang treats duplicate values as one

SELECT empname, deptid, salary,
  AVG(salary) OVER (ORDER BY salary ) AS average
FROM employee;

-- Secifying range
-- now aggregates are calculated out of all the rows
/* return employee salary info and compare it to the total avg, count, and max */
SELECT empname, deptid, salary,
  AVG(salary) OVER (ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS average,
  COUNT(salary) OVER (ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "count",
  SUM(salary) OVER (ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "sum"
FROM employee;



-- Adding a PARTITION BY clause

/* return employee salary info and compare it to the total avg, count, and max */
SELECT empname, deptid, salary,
  AVG(salary) OVER (PARTITION BY deptid ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS average,
  COUNT(salary) OVER (PARTITION BY deptid ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "count",
  SUM(salary) OVER (PARTITION BY deptid ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "sum"
FROM employee;

-- Adding a a specific range clause
SELECT empname, deptid, salary,
  AVG(salary) OVER (ORDER BY salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS average,
  COUNT(salary) OVER (ORDER BY salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS "count",
  SUM(salary) OVER (ORDER BY salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS "sum"
FROM employee;


/* LAST_VALUE  */

-- returns the lst value sort of like max or min would as a new column
SELECT product_name,group_id,price,
  LAST_VALUE(product_name) OVER (ORDER BY price ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_price
FROM products;


-- adding a PARTITION BY clause
SELECT product_name,group_id,price,
  LAST_VALUE(product_name) OVER (PARTITION BY group_id ORDER BY price ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_price
FROM products;


-- ------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------

/* RANK & DENSE_RANK */
--rank and dense rank handle duplicates differently
-- RANK example result (1,1,3,4,5,6)
-- DENSE_RANK example result (1,1,2,3,4,5)

/* show me what products prices are ranked at */
SELECT product_name, group_id, price,
  DENSE_RANK() OVER (ORDER BY price DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS price_ranking
FROM products;

-- ranking with a partition
/* show me the product prices ranked within the group IDs */
SELECT product_name, group_id, price,
  DENSE_RANK() OVER (PARTITION BY group_id ORDER BY price DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS price_ranking
FROM products;

/* What is the 2nd ranked highes price from the product group 'Smartphone' */
;WITH rankCTE AS
  (
    SELECT product_name, group_id, price,
      DENSE_RANK() OVER (PARTITION BY group_id ORDER BY price ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS price_ranking
    FROM products
  )
SELECT r.product_name, pg.group_name, r.price, r.price_ranking
FROM rankCTE as r
JOIN product_groups AS pg
ON r.group_id = pg.group_id
WHERE price_ranking = 2
AND pg.group_name LIKE 'Smartphone';
