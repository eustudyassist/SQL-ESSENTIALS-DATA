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

INSERT INTO district_2020 VALUES
('Nigeria', 'Oak Street School'),
('Ghana', 'Roosevelt High School'),
('Togo', 'Dover Middle School'),
('USA', 'Webutuck High School');
INSERT INTO district_2035 VALUES
('Nigeria', 'Oak Street School'),
(2, 'Roosevelt High School'),
(3, 'Morrison Elementary'),
(4, 'Chase Magnet Academy'),
(6, 'Webutuck High School');


