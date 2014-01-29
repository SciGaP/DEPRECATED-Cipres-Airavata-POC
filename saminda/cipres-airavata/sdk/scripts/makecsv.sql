# I don't have permission to run this.

select * from running_tasks into outfile "/users/u4/result.csv"
	fields terminated by ',' 
	optionally enclosed by '"'
	lines terminated by '\n'
	fields escaped by '"' ;

