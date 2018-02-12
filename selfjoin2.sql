
CREATE TABLE IF NOT EXISTS Employees (
EmpId INT NOT NULL PRIMARY KEY,
EmpName VARCHAR(50) DEFAULT NULL,
ManagerId INT DEFAULT NULL
);

INSERT INTO employees (EmpId,EmpName,ManagerId) VALUES (1,'Deepak','2');
INSERT INTO employees (EmpId,EmpName,ManagerId) VALUES (2,'Annu',NULL);
INSERT INTO employees (EmpId,EmpName,ManagerId) VALUES (3,'Jai','2');
INSERT INTO employees (EmpId,EmpName,ManagerId) VALUES (4,'Jitendra','1');
INSERT INTO employees (EmpId,EmpName,ManagerId) VALUES (5,'Vaishali','1');
INSERT INTO employees (EmpId,EmpName,ManagerId) VALUES (6,'Philip','4');


CREATE TABLE IF NOT EXISTS Department (
dep_id INT PRIMARY KEY,
name VARCHAR(50) UNIQUE
);


select * from employees;

/* Viewing the self join */
SELECT *
FROM employees as e, employees as m;

/* Find all the employees who are managers */
SELECT DISTINCT e.empid as managerid, e.empname as manager_name
FROM employees as e, employees as m
WHERE e.empid = m.managerid;

/* SELECT ALL MANAGER NAME WITH THEIR TOTAL SUBORDINATES EMPLOYEES. */
SELECT COUNT(e.empid) as EmployeeCount, m.manager_name
FROM employees as e, (SELECT DISTINCT e.empid as managerid, e.empname as manager_name
					  FROM employees as e, employees as m
					  WHERE e.empid = m.managerid) as m
WHERE e.managerid = m.managerid
GROUP BY m.manager_name;

/* SECOND METHOD  */
with empCTE as

(
select e.empid, e.empname, e.managerid,
      CAST('' as varchar(50)) as Mname from employee e
where managerid = 0

union all

select e1.empid, e1.empname, e1.managerid,
       CAST(c.empname as varchar(50)) as Mname from employee e1
inner join empCTE as C on e1.managerid=c.empid
where e1.managerid>0
) select * from empCTE


/* SELECT ALL MANAGER NAME WHOSE TOTAL SUBORDINATES EMPLOYEES ARE GREATER THAN 1.*/
SELECT mng.manager_name, COUNT(emp.empid) as EmployeeCount
FROM (SELECT DISTINCT e.empid as managerid, e.empname as manager_name
     FROM employees as e, employees as m
     WHERE e.empid = m.managerid)
     as mng , employees as emp
WHERE emp.managerid = mng.managerid
GROUP BY mng.manager_name
HAVING COUNT(emp.empid) > 1;
