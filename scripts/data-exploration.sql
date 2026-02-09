-- DATA EXPLORATION
-- Data Preview
SELECT *
FROM teachers; -- Data Preview

TABLE teachers; -- Data Preview

-- Subsetting Data by Column
SELECT
	first_name, last_name
FROM teachers;

SELECT gender
FROM teachers;

-- Organize and Order our data
SELECT *
FROM teachers
ORDER BY last_name; -- Ascending order

SELECT *
FROM  teachers
ORDER BY gender; -- Asc

SELECT *
FROM teachers
ORDER BY gender DESC; -- Descending

SELECT *
FROM teachers
ORDER BY salary DESC;

SELECT 
	id, first_name, last_name,
	hire_date, salary
FROM teachers
ORDER BY hire_date;

-- MULTICOLUMN ORDERING
SELECT 
	last_name, first_name
FROM teachers
ORDER BY last_name, first_name DESC;


SELECT
	hire_date, first_name, 
	last_name
FROM teachers
ORDER BY hire_date, first_name DESC;

-- FINDING UNIQUE VALUES
SELECT
	DISTINCT first_name, last_name
FROM teachers;

SELECT
	DISTINCT first_name, last_name
FROM teachers
ORDER BY first_name; --clause

SELECT
	DISTINCT first_name, last_name
FROM teachers
ORDER BY first_name --clause
LIMIT 10;

-- FILTER VALUES
/*--
FILTER OPERATORS USED WITH WHERE
	- equal to =
	- greater than >
	- less than <
	- greater than and equal to >=
	- less than and equal to <=
	- IN
	- NOT
	- not equal to != <>
	- BETWEEN
	- LIKE
	- ILIKE
	
BOOLEAN OPERATORS
	- AND
	- OR

WILD_CARDS
	- Return all *
	- Fill one gap _(underscore)
	- % FIll previous or post	
--*/


SELECT 
	DISTINCT last_name,
	first_name
FROM teachers
WHERE last_name = 'Osaze'; -- equal to comparison

SELECT
	DISTINCT last_name,
	first_name, gender
FROM teachers
WHERE gender = 'Male';


SELECT
	first_name, last_name, hire_date
FROM teachers
WHERE hire_date > '2020-01-01'-- greater than comp
ORDER BY hire_date;


SELECT
	first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2011-01-01'-- greater than comp
ORDER BY hire_date;

SELECT
	first_name, last_name, hire_date
FROM teachers
WHERE hire_date <= '2010-05-15'-- greater than comp
ORDER BY hire_date;

SELECT 
	first_name, last_name, id
FROM teachers
WHERE first_name IN ('Olumide', 
	'Chiamaka', 'Abubakar', 'Ifeyinwa',
	'Babatunde', 'Zainab')
ORDER BY first_name; -- Using IN operator

SELECT 
	first_name, last_name, id
FROM teachers
WHERE first_name NOT IN ('Olumide', 
	'Chiamaka', 'Abubakar', 'Ifeyinwa',
	'Babatunde', 'Zainab')
ORDER BY first_name; -- Using IN operator

SELECT
	first_name, last_name, salary
FROM teachers
WHERE Salary < 60000 AND salary > 50000 AND 
	first_name NOT IN ('Olumide', 
	'Chiamaka', 'Abubakar', 
	'Ifeyinwa',	'Babatunde', 'Zainab');

SELECT 
	first_name, last_name, salary
FROM teachers
WHERE salary BETWEEN 50000 AND 60000; -- Between clause

SELECT
	gender, first_name
FROM teachers
WHERE gender <> 'Male';

SELECT
	gender, first_name
FROM teachers
WHERE gender != 'Male';

SELECT
	first_name, last_name, gender
FROM teachers
WHERE first_name LIKE 'Hadiza';

SELECT
	first_name, last_name, gender
FROM teachers
WHERE first_name ILIKE 'hadiza';

SELECT
	first_name, last_name
FROM teachers
WHERE last_name LIKE '__man';

SELECT
	first_name, last_name
FROM teachers
WHERE last_name LIKE '___yinka';

SELECT
	first_name, last_name
FROM teachers
WHERE last_name LIKE '%yin%';

SELECT
	last_name
FROM teachers
WHERE last_name ILIKE '%ay%';

TABLE teachers