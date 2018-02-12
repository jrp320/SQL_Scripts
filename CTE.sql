/*  Common Table Expressions  */


/* SELECT ALL MANAGER NAME WITH THEIR TOTAL SUBORDINATES EMPLOYEES. */
SELECT m.manager_name, COUNT(e.empid) as EmployeeCount
FROM employees as e, (SELECT DISTINCT e.empid as managerid, e.empname as manager_name
					  FROM employees as e, employees as m
					  WHERE e.empid = m.managerid) as m
WHERE e.managerid = m.managerid
GROUP BY m.manager_name;


/* Find all employees who are also managers Using Common Table Expressions */
;WITH mngrCTE (manager_id, manager_name) AS
  (
  SELECT DISTINCT e.empid , e.empname
  FROM employees as e, employees as m
  WHERE e.empid = m.managerid
  )
SELECT * FROM mngrCTE;


/* SELECT ALL MANAGER NAME WITH THEIR TOTAL SUBORDINATES EMPLOYEES. */
;WITH mngrCTE (managerid,manager_name) AS
  (
    SELECT DISTINCT e.empid as managerid, e.empname as manager_name
    FROM employees AS e, employees as m
    WHERE e.empid = m.managerid
  )
SELECT m.manager_name, COUNT(e.empid) as Total_emp
FROM mngrCTE as m
JOIN employees as e
ON e.managerid = m.managerid
GROUP BY m.manager_name;


/* SELECT ALL MANAGER NAME WHOSE TOTAL SUBORDINATES EMPLOYEES ARE GREATER THAN 2 .*/
;WITH mngrCTE (managerid,manager_name) AS
  (
    SELECT DISTINCT e.empid as managerid, e.empname as manager_name
    FROM employees AS e, employees as m
    WHERE e.empid = m.managerid
  )
SELECT m.manager_name, COUNT(e.empid) as Total_emp
FROM mngrCTE as m
JOIN employees as e
ON e.managerid = m.managerid
GROUP BY m.manager_name
HAVING COUNT(e.empid) >= 2;


/*  example -- no data  */
WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)
AS
-- Define the CTE query.
(
    SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear
    FROM Sales.SalesOrderHeader
    WHERE SalesPersonID IS NOT NULL
)
-- Define the outer query referencing the CTE name.
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear
FROM Sales_CTE
GROUP BY SalesYear, SalesPersonID
ORDER BY SalesPersonID, SalesYear;
GO
