CREATE TABLE district_2020 (
	id integer,
	school_2020 TEXT
);
CREATE TABLE district_2035 (
 id integer,
 school_2035 text
);

 INSERT INTO district_2020 VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(5, 'Dover Middle School'),
(6, 'Webutuck High School');
INSERT INTO district_2035 VALUES
(1, 'Oak Street School'),
(2, 'Roosevelt High School'),
(3, 'Morrison Elementary'),
(4, 'Chase Magnet Academy'),
(6, 'Webutuck High School');

SELECT *
FROM district_2020;

SELECT *
FROM district_2035;

SELECT *
FROM district_2020 JOIN district_2035
ON district_2020.id = district_2035.id;

SELECT *
FROM district_2020 JOIN district_2035
USING (id);

SELECT *
FROM district_2020 LEFT JOIN district_2035
ON district_2020.id = district_2035.id;

CREATE TABLE waptrick_2010 (
	country TEXT,
	users INT
);

CREATE TABLE waptrick_2025 (
 	country TEXT,
	users INT
);

INSERT INTO waptrick_2010 VALUES
('Nigeria', 5000000),
('Ghana', 2000000),
('Togo', 1500000),
('USA', 40000000);

INSERT INTO waptrick_2025 VALUES
('Nigeria', 400000),
('Ghana', 2000),
('Togo', 2000000),
('South Africa', 4000000),
('Benin', 1600000);

SELECT *
FROM waptrick_2010;

SELECT *
FROM waptrick_2025;

-- Left Join

SELECT 
	w_2025.country,
	w_2025.users - w_2010.users AS active_users
FROM waptrick_2010 AS w_2010 LEFT JOIN waptrick_2025 AS w_2025
ON w_2010.country = w_2025.country;

SELECT 
	country,
	w_2025.users - w_2010.users AS active_users
FROM waptrick_2010 AS w_2010 LEFT JOIN waptrick_2025 AS w_2025
USING(country);

-- Right Join

SELECT *
FROM waptrick_2010 AS w_2010 RIGHT JOIN waptrick_2025 AS w_2025
ON w_2010.country = w_2025.country;

SELECT 
	country,
	w_2010.users AS users_2010,
	w_2025.users AS users_2025
FROM waptrick_2010 AS w_2010 RIGHT JOIN waptrick_2025 AS w_2025
USING (country);

-- Full Outer Join
SELECT 
	w_2010.country AS w_2010_country,
	w_2025.country AS w_2025_country,
	w_2010.users AS users_2010,
	w_2025.users AS users_2025
FROM waptrick_2010 AS w_2010 FULL OUTER JOIN  waptrick_2025 AS w_2025
ON w_2010.country = w_2025.country;


-- Cross join
SELECT *
FROM waptrick_2010 CROSS JOIN waptrick_2025; -- Do not use.













