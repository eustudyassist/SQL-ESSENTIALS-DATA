CREATE TABLE poultry_est (
	establishment_id INT,
	establishment_number TEXT CONSTRAINT est_number_key PRIMARY KEY,
	establishment_name TEXT,
	duns_number TEXT,
	street TEXT,
	city TEXT,
	st TEXT,
	zip TEXT,
 	phone TEXT,
	grant_date DATE,
	activities TEXT,
	dbas TEXT,
	district TEXT,
	circuit TEXT,
	size TEXT,
	latitude NUMERIC,           
	longitude NUMERIC,
	county TEXT,
	fips_code TEXT
);


COPY poultry_est
FROM 'C:\Users\eustudyassist\Documents\SQL-ESSENTIALS-DATA\data\mpi_data\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER);

CREATE INDEX est_idx ON poultry_est (establishment_name);

ALTER TABLE poultry_est RENAME COLUMN establishment_name TO company;

-- Preview data
SELECT *
FROM poultry_est;

-- Check the data dimension
-- Rows
SELECT 
	COUNT(*)
FROM poultry_est;

-- Columns
SELECT 
	COUNT(*)
FROM information_schema.columns
WHERE table_name = 'poultry_est';

-- Check for duplicates
SELECT
	establishment_id,
	count(*) AS establishment_count
FROM poultry_est
GROUP BY establishment_id
HAVING count(*) > 1
ORDER BY establishment_count; -- no duplicates

SELECT 
	company,
	street,
	city,
	st,
	COUNT(*) AS address_count
FROM poultry_est
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY address_count; -- Some companies appears more than once on a street

-- Checking for missing values
SELECT 
	st,
	COUNT(*) AS st_count
FROM poultry_est
GROUP BY st
ORDER BY st;

SELECT
	duns_number,
	COUNT(*) AS duns_count
FROM poultry_est
GROUP BY duns_number
ORDER BY duns_number NULLS FIRST;

SELECT 
	establishment_number,
	company,
	duns_number,
	city,
	st,
	zip
FROM poultry_est
WHERE duns_number IS NULL

-- Check for inconsistent data
SELECT 
	company,
	count(*) AS company_count
FROM poultry_est
GROUP BY company
ORDER BY company ASC; -- Example: 3 Little Pigs, A La Carte Foods, A.N. Deringer

-- Checking for malformed values
SELECT
	length(zip),
	COUNT (*) AS zip_length_count
FROM poultry_est
GROUP BY length(zip);

SELECT
	st,
	zip,
	count(st) as malformed_zip
FROM poultry_est
WHERE length(zip) > 5 -- See those with more than 5
GROUP BY st, zip
ORDER BY malformed_zip DESC;

-- Backup table

CREATE TABLE poultry_est_backup AS
SELECT * FROM poultry_est;

ALTER TABLE poultry_est ADD COLUMN st_copy TEXT;

UPDATE poultry_est
	SET st_copy = st;

SELECT 
	st,
	st_copy
FROM poultry_est
WHERE st IS DISTINCT FROM st_copy;


SELECT 'a' <> NULL;
SELECT 'a' IS DISTINCT FROM NULL;

