create table users
	(
		u_id number(3),
		u_f_name varchar2(25),
		u_l_name varchar2(25),
		u_location varchar2(25)
	);
-- SELECT

	select * from users;
	-- gives all the data 


	--select column_name, column_name from table_name;
	select u_id, u_f_name from users;
	-- gives only specific column;


	--select DISTINCT column_name, column_name from table_name;
	select DISTINCT u_id, u_f_name from users;
	-- gives only the distinct values

-- INSERTING VALUES

	-- INSERT INTO 
	--INSERT INTO table_name values (value1,value2);

	INSERT INTO users VALUES(001, 'Jai', 'Gupta','Kanpur');
	INSERT INTO users VALUES(002, 'Devshree', 'Gupta','Bangalore');
	INSERT INTO users VALUES(003, 'Isha', 'Gupta','Hyderabad');
	INSERT INTO users VALUES(004, 'Prabhu', 'Gupta','Delhi');
	INSERT INTO users VALUES(005, 'Gaurav', 'Gupta','Pune');
	INSERT INTO users VALUES(005, 'Ankit', 'Mehrotra','Mumbai');
	INSERT INTO users VALUES(005, 'Saumya', 'Tandon','Gurgaon');


-- CLAUSES
	-- WHERE
		--use to extract the records which meet the specified criterion.

		--SELECT column_name,column_name
		--FROM table_name
		--WHERE column_name operator value;

		select * from users
		WHERE u_id = 5;

	-- operator
		Operator	Description
				=	Equal
				<>	Not equal. Note: In some versions of SQL this operator may be written as !=
				>	Greater than
				<	Less than
				>=	Greater than or equal
				<=	Less than or equal
		   BETWEEN	Between an inclusive range
			  LIKE	Search for a pattern
				IN	To specify multiple possible values for a column

		select u_id, u_f_name
		FROM users
		WHERE u_l_name = 'Gupta';


	-- AND OPERATOR

		--when both the conditions are true !

		select * from users
		WHERE u_l_name = 'Gupta'
		AND u_id = 5;


		select * from users
		WHERE u_l_name = 'Tandon'
		AND u_id = 5;

	-- OR OPERATOR
		-- When either is true


		select * from users
		WHERE u_l_name = 'Tandon' OR U_L_NAME = 'Gupta'
		AND u_id = 5;


		select * from users
		WHERE u_l_name = 'Tandon' OR U_F_NAME = 'Jai'
		AND u_id = 5;


		select * from users
		WHERE u_id = 5 
		AND (u_location ='Gurgaon' OR U_F_NAME = 'Gaurav' OR u_f_name = 'Ankit');


	-- ORDER KEYWORD
		--The ORDER BY keyword is used to sort the result-set by one or more columns.
		--The ORDER BY keyword sorts the records in ascending order by default.
		--To sort the records in a descending order, you can use the DESC keyword.

		SELECT * FROM users
		ORDER BY u_location;


		SELECT * FROM users
		ORDER BY u_location ASC, u_f_name DESC;


	-- UPDATE existing records in table 

		UPDATE table_name
		SET column1=value1,column2=value2,...
		WHERE some_column=some_value;

	--	Note	Notice the WHERE clause in the SQL UPDATE statement!
	--	The WHERE clause specifies which record or records that should be updated. If you omit the WHERE clause, all records will be updated!

		UPDATE users
		SET u_id = 6 
		WHERE u_f_name = 'Ankit';

	--  The DELETE statement is used to delete records in a table.
		
		DELETE FROM table_name
		WHERE some_column=some_value;

		DELETE FROM users
		WHERE u_id = 'Jai';

	-- 	Select some Rows from table 

		--select column_name(s)
		--FROM table_name
		--LIMIT number;
	
	Select column_name(s)
	FROM table_name
	WHERE ROWNUM <= number;

	SELECT u_f_name,u_l_name
	FROM users
	WHERE ROWNUM <= 4;

	-- SELECT TOP PERCENT

		SELECT TOP 50 PERCENT * FROM users


	-- LIKE
		-- The LIKE operator is used 
		-- in a WHERE clause to search 
		-- for a specified pattern in a column.

		SELECT column_name(s)
		FROM table_name
		WHERE column_name LIKE pattern;

		SELECT * FROM countries
  		WHERE COUNTRY_NAME LIKE '%er%';

  		SELECT * FROM countries
  		WHERE COUNTRY_NAME NOT LIKE '%er%';