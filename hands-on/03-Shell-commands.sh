source /pyenv/bin/activate
export AWS_DEFAULT_REGION=us-east-1
cqlsh-expansion cassandra.us-east-1.amazonaws.com 9142 --ssl

# Shell Commands


CAPTURE '/home/hadoop/CassandraProgs/Outputfile'



select * from emp;



capture off;



CONSISTENCY



COPY emp (emp_id, emp_city, emp_name, emp_phone,emp_sal) TO ‘myfile’;




describe cluster;




describe keyspaces;



describe tables;



describe table emp;




DESCRIBE TYPES;




expand on;
select * from emp;
expand off;



show host;



source '/home/hadoop/CassandraProgs/inputfile';



exit


