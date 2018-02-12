/* Common Interview Questions */

-- CREATING SAMPLE TABLE AND DATA
CREATE TABLE IF NOT EXISTS employee
  (
    empid INT PRIMARY KEY,
    empname VARCHAR(100),
    managerid INT,
    deptid  INT ,
    salary INT
  );

INSERT INTO employee (empid,empname,managerid,deptid,salary)
VALUES
    (1, 'emp 1', 0, 1, 6000),
    (2, 'emp 2', 0, 5, 6000),
    (3, 'emp 3',  1, 1, 2000),
    (13, 'emp 13', 2, 5, 2000),
    (11, 'emp 11',  2, 1 , 2000),
    (9, 'emp 9', 1, 5, 3000),
    (8, 'emp 8', 3, 1, 3500),
    (7, 'emp 7', 2, 5 , NULL);

-- inserting a duplicate
INSERT INTO employee (empid,empname,managerid,deptid,salary)
VALUES
    (14, 'emp 1', 0, 1, 6000);

-- creatign department table
CREATE TABLE IF NOT EXISTS department
  (
    deptid INT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
  );

INSERT INTO department
VALUES
    (1,'IT'),
    (2,'Marketing');

-- Verifying data
SELECT * FROM newemployees;
select * from department;

/* Q2. Can you get employee details whose department id is not valid or department id not present in department table? */
SELECT e.empid, e.empname, d.deptid
FROM employee as e
LEFT JOIN department as d
ON e.deptid = d.deptid
WHERE d.deptid IS NULL;

/* Q3. Can you get the list of employees with same salary? */
SELECT DISTINCT e1.empid, e1.empname, e1.salary
FROM employee as e1,employee as e2
WHERE e1.salary = e2.salary
AND e1.empid != e2.empid;

/* Q4 How can you find duplicate records in Employee table? */
SELECT empname, managerid, deptid, salary, COUNT(*) AS duplicates
from employee
GROUP BY empname, managerid, deptid, salary
HAVING COUNT(*) > 1;

/* Q6 Find the second highest salary */
SELECT DISTINCT salary AS "2nd Highest Salary"
FROM employee
WHERE salary IS NOT NULL
ORDER BY salary DESC
OFFSET 1
LIMIT 1;

/* Q10  Please write a query to get the maximum salary from each department */
SELECT e.deptid, d.name, MAX(salary)
FROM department as d
RIGHT JOIN employee as e
ON d.deptid = e.deptid
GROUP BY e.deptid, d.name;
-- or
SELECT deptid, MAX(salary)
FROM employee
GROUP BY deptid;

/* Q12. Can you show one row twice in results from a table? */
select name from department d where d.name='IT'
UNION ALL
select name from department d1 where d1.name='IT' ;

/* Q19  Write a query to get employees whos ID is even. */
SELECT empid
FROM employee
WHERE empid % 2 =  0;

/* Q19  Write a query to get employees whos ID is even. */
SELECT empid
FROM employee
WHERE empid % 2 != 0;

/* 22(Tricky) Below is the table data which has 1 columns and 7 rows */
;WITH tempCTE AS
  (
    select '10/12' as column1
    union select '1a/09'
    union select '20/14'
    union select '20/1c'
    union select '3112'
    union select '11/16'
    union select 'mm/pp'
  )

-- Give data in a table is of format 'NN/NN', verify that the first and last two characters are numbers and that the middle character is '/'.
SELECT column1,
  CASE
  WHEN column1 REGEXP_MATCHES '[0-9][^A-Z]/[^A-Z][0-9]' then 'NUMBER'
  else 'NOT NUM'
  end
from tempCTE;
-- For some reason query is not running properly ???
