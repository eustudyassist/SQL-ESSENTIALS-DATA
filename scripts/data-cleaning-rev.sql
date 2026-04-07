SELECT *
FROM poultry_est_dirty;

CREATE TEMPORARY TABLE poultry_est_temp (
	LIKE poultry_est_dirty INCLUDING ALL
); -- table skeleton

SELECT *
FROM poultry_est_temp;

CREATE TEMPORARY TABLE poutlry_est_temp_2
AS SELECT * FROM poultry_est_dirty;

SELECT *
FROM poutlry_est_temp_2;


/* DATA CLEANING 
- Ensure you create a backup table
- Check data dimension
	- num of rows
	- num of columns
- Preview the data
- Find missing values
	- wrong represented values
	handling missing
	- delete the missing data
	- Data imputation
		- correct value
		- average /numbers
		- nearest neighbor 
		- group average /numbers
- Inconsistent values
*/

-- Create backup table
CREATE TABLE poultry_est_dirty_backup
AS SELECT * FROM poultry_est_dirty;

-- Count num of rows
SELECT
	COUNT(*)
FROM poultry_est_dirty;

-- Count num of columns

SELECT COUNT(*)
FROM information_schema.columns
WHERE table_name = 'poultry_est_dirty'

-- Preview data
SELECT *
FROM poultry_est_dirty;

-- Find missing values
SELECT
	city,
	COUNT (city) AS city_counts
FROM poultry_est_dirty
GROUP BY city
ORDER BY city DESC;

SELECT
	st,
	COUNT (st) AS state_counts
FROM poultry_est_dirty
GROUP BY st
ORDER BY st;

SELECT
	
	city,
	st,
	COUNT(*) AS unique_values
FROM poultry_est_dirty
GROUP BY city, st
HAVING st = ' '
ORDER BY st;

/* To clean the missing states value
- Get complete us-city/state table
- Import table
- Join with poultry_table
*/

SELECT 
	COUNT(city) AS city_count
FROM poultry_est_dirty
GROUP BY city;

SELECT 
	city, st
FROM poultry_est_dirty
WHERE city = 'Lincoln'

SELECT 
	st,
	city,
	zip
FROM poultry_est_dirty
WHERE st = ' '
GROUP BY st, city, zip

SELECT *
FROM poultry_est_dirty

SELECT 
	st,
	zip,
	count(*)
FROM poultry_est_dirty
GROUP BY st, zip
HAVING zip = '999';

-- Data imputation 
UPDATE poultry_est_dirty
SET st = 'CA'
WHERE zip = '92121';

-- US City + Zip Data
CREATE TABLE us_zip(
	zip TEXT,
	lat TEXT,
	lng TEXT,
	city TEXT,
	state_id TEXT,
	state_name TEXT,
	zcta TEXT,
	parent_zcta TEXT,
	population TEXT,
	density TEXT,
	county_fips TEXT,
	county_name TEXT,
	all_county_weights TEXT,
	imprecise TEXT,
	military TEXT,
	timezone TEXT
);

SELECT *
FROM us_zip
ORDER BY city;


SELECT
	st,
	state_id,
	pe.zip AS original_zip,
	uz.zip AS complete_zip	
FROM poultry_est_dirty AS pe LEFT JOIN us_zip AS uz
ON pe.st = uz.state_id
WHERE st = ' ' OR pe.zip = '999'

-- Wrongly represented values
SELECT
	*
FROM poultry_est_dirty;

SELECT 
	duns_number,
	count(*) AS duns_count
FROM poultry_est_dirty
WHERE duns_number = 'NA'
GROUP BY duns_number;

SELECT
	duns_number,
	COUNT (*) A
FROM poultry_est_dirty
WHERE duns_number IS NULL;

UPDATE poultry_est_dirty
SET duns_number = NULL
WHERE duns_number = 'NA'


ALTER TABLE table_name DROP COLUMN
ALTER TABLE  table_name ALTER COLUMN .... SET DATA TYPE
ALTER TABLE table_name ADD COLUMN
ALTER TABLE table_name RENAME old_column_name new_column_name










-- Inconsistent Values




	