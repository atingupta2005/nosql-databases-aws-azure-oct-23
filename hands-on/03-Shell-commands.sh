source /pyenv/bin/activate
export AWS_DEFAULT_REGION=us-east-1
cqlsh-expansion cassandra.us-east-1.amazonaws.com 9142 --ssl

# Shell Commands
CAPTURE '/tmp/u20-Outputfile'


USE kspu20;
DESCRIBE tables;
select * from user;
capture off;

CONSISTENCY

describe user;

COPY user (first_name, last_name, title) TO 'user.txt';

describe keyspaces;

describe tables;

describe table user;

show host;

exit