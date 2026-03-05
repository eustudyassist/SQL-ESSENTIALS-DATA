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
