/* CREATING TABLES */

CREATE TABLE IF NOT EXISTS accounts (
	userid serial PRIMARY KEY,
	username VARCHAR(30) UNIQUE,
	password varchar(30) NOT NULL,
	email varchar(50) NOT NULL,
    created_on TIMESTAMP NOT NULL,
    last_login TIMESTAMP NOT NULL);
    
CREATE TABLE IF NOT EXISTS role (
	roleid SERIAL PRIMARY KEY,
	role_name varchar(100) UNIQUE NOT NULL);

CREATE TABLE IF NOT EXISTS account_role (
	userid int NOT NULL,
    roleid int NOT NULL,
    grantid TIMESTAMP WITHOUT TIME ZONE,
    PRIMARY KEY (userid, roleid)
	);

/* A customer's first name, last name,email,sign-up date, and number of minutes spent on the dvd rental site. You should also have some sort of id tracker for them. You have free reign on how you want to create this table, the next lecture will show one possible implementation of this. */
CREATE TABLE IF NOT EXISTS leads (
    lead_id SERIAL PRIMARY KEY,
	firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    signup_date TIMESTAMP NOT NULL,
    time_spent INT NOT NULL
	);


	