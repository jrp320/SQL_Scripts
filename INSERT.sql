/* INSERTING DATA */ 

/* creating table first */
CREATE TABLE IF NOT EXISTS link(
	id serial PRIMARY KEY,
    url varchar(200) NOT NULL, 
    name varchar(100) NOT NULL,
    description VARCHAR(200),
    rel VARCHAR(50)
	);
    
select * from link;

/* Inserting data rows into table */
INSERT INTO link (url,name)
VALUES ('www.bing.com','Bing'),
	   ('www.amazon.com','Amazoon');

/* Creating a table that has the excact same structure as another */
CREATE TABLE link_copy (LIKE link);

/* Inserting with a select statement */
INSERT INTO link_copy 
(SELECT * FROM link 
WHERE name LIKE 'Bing');

select * from link_copy;
