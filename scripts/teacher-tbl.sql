CREATE TABLE teachers (
	id SERIAL,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	gender VARCHAR(20),
	salary BIGINT,
	hire_date DATE
);


INSERT INTO teachers
	(first_name, last_name, gender, salary, hire_date)
VALUES
	('Olumide', 'Adeyemi', 'Male', 55000, '2015-08-20'),
	('Chiamaka', 'Okonkwo', 'Female', 62000, '2012-03-15'),
	('Abubakar', 'Musa', 'Male', 48500, '2019-01-10'),
	('Ifeyinwa', 'Eze', 'Female', 71000, '2008-11-05'),
	('Babatunde', 'Olowu', 'Male', 53000, '2017-09-01'),
	('Zainab', 'Abdullahi', 'Female', 59000, '2014-06-22'),
	('Chidi', 'Nwachukwu', 'Male', 46000, '2021-02-18'),
	('Eseosa', 'Igbinedion', 'Female', 68000, '2010-05-30'),
	('Damilola', 'Ogunleye', 'Male', 51500, '2018-08-15'),
	('Aminu', 'Sani', 'Male', 73000, '2005-12-01'),
	('Chinelo', 'Obi', 'Female', 49000, '2020-07-12'),
	('Folake', 'Balogun', 'Female', 56500, '2016-04-25'),
	('Emeka', 'Anyanwu', 'Male', 64000, '2011-10-09'),
	('Aisha', 'Bello', 'Female', 52000, '2018-01-20'),
	('Ohenhen', 'Osaze', 'Male', 47500, '2022-03-05'),
	('Ngozi', 'Okoro', 'Female', 69500, '2009-09-14'),
	('Segun', 'Ajayi', 'Male', 54000, '2016-11-30'),
	('Hadiza', 'Usman', 'Female', 61000, '2013-08-08'),
	('Obinna', 'Ikechukwu', 'Male', 45000, '2023-01-15'),
	('Ifeanyi', 'Usman', 'Female', 62000, '2010-05-15'),
	('Olumide', 'Adeyinka', 'Male', 62000, '2011-03-15'),
	('Ifeanyi', 'Okonkwo', 'Female', 62000, '2014-03-15'),
	('Titi', 'Adenuga', 'Female', 58000, '2015-05-20');
