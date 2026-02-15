-- CREATE DATABASE data_types_db

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


SELECT *
FROM data_types;

COPY data_types TO 'C:\Users\eustudyassist\Documents\SQL-ESSENTIALS-DATA\data_types.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|')


