-- Working with Dates
SELECT *
FROM flights
LIMIT 5;

/* Types of dates
Example: 2023-01-01 06:00:00

- date: 2023-01-01
- timestamp: 2023-01-01 06:00:00
- timestamptz
- time: 06:00:00
- timetz
- interval: 1 year, 2 years, 30 mins, 2 decades
*/

/* Components of date
- year
- month
- week
- quarter
- day
- hour
- seconds
- minute
*/

SELECT time_hour
FROM flights;

-- Extracting components from date
/*
date_part(component_of_date, column)
*/

SELECT
	date_part('month', time_hour)
FROM flights;

SELECT NOW()
SELECT current_time
SELECT current_date
SELECT localtimestamp










