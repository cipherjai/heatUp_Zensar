load data
infile 'G:\TEST\department.txt'
	into table department
	fields terminated by "|"
	(
	 department_code,
	 department_name
	)
	