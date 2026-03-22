/*
PROJECT NAME: New York Flight Analysis (2023)
PROJECT DESCRIPTION: 
The analysis of flight data in 3 different airports of origin ...
TABLES:
- airports
- airlines
- flights
- planes
- weather
*/

CREATE DATABASE flight_db;

/*
CONSTRAINTS
- column
- table
CONSTRAINTS

Primary key
	- Not Null
	- Unique
*/

CREATE TABLE airlines(
	carrier TEXT PRIMARY KEY, -- Column no constraint name
	name TEXT 
);


CREATE TABLE airlines(
	carrier TEXT CONSTRAINT carrier_key PRIMARY KEY, -- Column constraint name specified
	name TEXT 
);

DROP TABLE airlines;

CREATE TABLE airlines(
	carrier TEXT,
	name TEXT,
	PRIMARY KEY (carrier) -- table 
);

CREATE TABLE airlines(
	carrier TEXT,
	name TEXT,
	CONSTRAINT carrier_key PRIMARY KEY (carrier)
);

INSERT INTO airlines
VALUES
	('9E','Endeavor Air Inc.'),
	('AA','American Airlines Inc.'),
	('AS','Alaska Airlines Inc.'),
	('B6','JetBlue Airways')


CREATE TABLE my_num (
	my_int INT,
	my_int_2 INT
);

CREATE TABLE my_num2 (
	my_int_3 INT,
	my_int_4 INT
);

INSERT INTO my_num
VALUES
	(1, 2),
	(3, 4),
	(4, 5);


INSERT INTO my_num2
VALUES
	(1, 2),
	(3, 4),
	(4, 5);

SELECT *
FROM my_num;

SELECT 
	my_num.my_int,
	my_num2.my_int_3,
	my_num.my_int_2,
	my_num2.my_int_4
FROM my_num CROSS JOIN my_num2

SELECT *
FROM my_num CROSS JOIN my_num2





