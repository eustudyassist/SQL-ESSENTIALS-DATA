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

SELECT *
FROM poultry_est;