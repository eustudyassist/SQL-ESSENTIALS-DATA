CREATE TABLE laptop_info (
	Company TEXT,
	TypeName TEXT,
	Inches NUMERIC(5, 2),
	ScreenResolution TEXT,
	Cpu TEXT,
	Gpu TEXT,
	OpSys TEXT,
	TouchScreen BOOLEAN,
	Ips BOOLEAN,
	X_res INT,
	Y_res INT,
	ppi NUMERIC(5, 2),
	Dedicated_Gpu BOOLEAN,
	Ram_GB SMALLINT,
	Weight_kg NUMERIC(5, 2),
	SSD INT,
	HHD INT,
	Storage_Type TEXT,
	Total_Storage_GB INT,
	Storage_Category TEXT,
	Price NUMERIC(10, 2)
);

SELECT *
FROM laptop_info;

SELECT 
	COUNT(*)
FROM laptop_info;

-- DATA EXPLORATION
SELECT 
	DISTINCT company
FROM laptop_info;

-- Show missing rows
SELECT *
FROM laptop_info
WHERE company IS NULL;

-- Create view
CREATE VIEW laptop_info_clean AS
SELECT *
FROM laptop_info
WHERE company IS NOT NULL;

-- ANALYSIS
SELECT *
FROM laptop_info_clean;

-- Most expensive
SELECT
	company,
	typename,
	MAX(price) AS price -- agregating function 
FROM laptop_info_clean
GROUP BY company, typename
ORDER BY price DESC
LIMIT 1;

-- Most expensive subquerying

/*
select columns_
from table -- add a subquery
where -- add subquery
*/

SELECT
	*
FROM laptop_info_clean
WHERE typename = 'Lenovo ThinkPad T16g Gen 3'
	
SELECT
	company, 
	typename,
	cpu
FROM laptop_info_clean
WHERE price = (
	SELECT 
		MAX(price) AS price
	FROM laptop_info_clean
);

SELECT 
	company,
	ROUND(AVG(price), 2)
FROM laptop_info_clean
GROUP BY company;


SELECT
	company,
	typename,
	price,
	(
		SELECT 
			max(price)
		FROM laptop_info_clean
	) AS most_expensive,
	(
		SELECT 
			max(price)
		FROM laptop_info_clean
	) - price AS price_difference
FROM laptop_info_clean
	
SELECT
	percentile_cont(.5) WITHIN GROUP (ORDER BY price) AS median_price,
	AVG(price) AS average_price,
	median_price - average_price AS mean_diff
FROM laptop_info_clean; -- wrong

SELECT
	percentile_cont(.5) WITHIN GROUP (ORDER BY price) AS median_price,
	AVG(price) AS average_price,
	percentile_cont(.5) WITHIN GROUP (ORDER BY price) - 
	AVG(price) AS mean_diff
FROM laptop_info_clean;

SELECT 
	median_price,
	average_price,
	median_price - average_price AS mean_diff
FROM (
	SELECT 
		ROUND((percentile_cont(.5) WITHIN GROUP (ORDER BY price))::numeric, 2) AS median_price,
		ROUND(AVG(price), 2) AS average_price
	FROM laptop_info_clean
) AS calculation;

SELECT 
	median_price,
	ROUND(average_price, 2) AS average_price,
	ROUND((median_price - average_price)::NUMERIC, 2) AS mean_diff
FROM (
	SELECT 
		percentile_cont(.5) WITHIN GROUP (ORDER BY price) AS median_price,
		AVG(price) AS average_price
	FROM laptop_info_clean
) AS calculation;

-- subquerying
	-- where
	-- from
	-- select

-- Dates
-- text manipulation



-- Laterals
SELECT 
	median_price,
	ROUND(average_price, 2) AS average_price,
	ROUND((median_price - average_price)::NUMERIC, 2) AS mean_diff
FROM laptop_info_clean, LATERAL (
	SELECT 
		percentile_cont(.5) WITHIN GROUP (ORDER BY price) AS median_price,
		AVG(price) AS average_price
	FROM laptop_info_clean
) AS calculation;



SELECT
	company,
	typename,
	price
FROM
	laptop_info_clean AS lap_inf,
	LATERAL (
		SELECT max(price) AS max_price
		FROM laptop_info_clean AS lap_inf_2
		WHERE lap_inf.company = lap_inf_2.company
	) 

-- CTE (Common Table Expressions)
-- temp tables
-- view

/*
WITH -- signal the start, define the cte name
AS -- query goes in here
*/

WITH nvidia_laptops (company, cpu, gpu, price)
AS(
	SELECT 
		company, cpu, gpu, price
	FROM laptop_info_clean
	WHERE gpu ILIKE 'Nvidia%'
	)
SELECT 
	COUNT(*)
FROM nvidia_laptops

SELECT
	AVG(price)
FROM nvidia_laptops
