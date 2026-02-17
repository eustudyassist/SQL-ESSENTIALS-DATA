-- CREATE DATABASE data_types_db
DROP TABLE data_type

CREATE TABLE data_types(
	char_dt CHAR(10),
	varchar_dt VARCHAR(10),
	text_dt TEXT
);

INSERT INTO data_types
VALUES
	('abc', 'abc', 'abc'),
	('qwertyuiop', 'qwertyuiop', 'qwertyuiop'),
	('1234', 1234, 1234),
	('-*', '--', '**');

/*--
NUMERIC DATA TYPES
+ INTEGERS
	- Integers (small, int, big)
	- Serial (small, int, big)

+ DECIMAL
	- Fixed
	- Float
		* Real
		* Double Precision
--*/

CREATE TABLE numeric_types (
	small_integer_column SMALLINT, -- max 32k
	integer_column INTEGER, -- max 2.1 billion
	big_int_column BIGINT -- max quantilion
);

INSERT INTO numeric_types
VALUES
	(-3, 3, 5),
	(30000, 300000000, 300000000),
	(0819, 902386233, 081902386235623);

SELECT *
FROM numeric_types;

-- Decimal
CREATE TABLE decimal_types(
	numeric_type DECIMAL(20, 5),
	real_type REAL, -- 6 digits
	double_precision_type DOUBLE PRECISION --15 digits
);

INSERT INTO decimal_types 
VALUES
	(.9, .9, .9),
	(1237435.8986352352, 1237435.8986352352, 1237435.8986352352),
	(2.9837456534557346, 2.9837456534557346, 2.9837456534557346);


SELECT *
FROM decimal_types;

SELECT
	numeric_type,
	numeric_type * 1000000 AS numeric_mult,
	real_type,
	real_type * 1000000 AS real_mult,
	double_precision_type,
	double_precision_type * 1000000 AS double_mult
FROM decimal_types;
	
	
-- Date and Time
/*--
	- timestamp
	- date
	- time
	- intervals
--*/

CREATE TABLE date_data_type (
	tz_type TIMESTAMP WITH TIME ZONE,
	interval_type INTERVAL
);

-- YYYY-MM-DD ISO Format

INSERT INTO date_data_type 
VALUES
	('2026-02-17 19:24:30 GMT+1', '1 day'),
	('2025-02-17 19:24:30 Australia/Melbourne', '1 decade'),
	('2025-02-17 19:24:30 UTC+1', '15 weeks'),
	(now(), '3 centuries');

SELECT *
FROM date_data_type;

SELECT 
	tz_type,
	interval_type,
	tz_type + interval_type AS future
FROM date_data_type;


SELECT
	tz_type,
	CAST(tz_type AS varchar(10)) AS char_date,
	CAST(tz_type AS DATE) AS date_type,
	CAST(tz_type AS TIME) AS time_type
FROM date_data_type;