source /pyenv/bin/activate
export AWS_DEFAULT_REGION=us-east-1
cqlsh-expansion cassandra.us-east-1.amazonaws.com 9142 --ssl

USE kspu20;

CONSISTENCY LOCAL_QUORUM

CREATE TABLE IF NOT EXISTS user ( first_name text, last_name text, title text, PRIMARY KEY (first_name));

SELECT * FROM system_schema.keyspaces;

INSERT INTO user (first_name, last_name, title) VALUES ('Atin', 'Gupta', 'Mr.') IF NOT EXISTS;

INSERT INTO user (first_name, last_name) VALUES ('Parul', 'Rodriguez') IF NOT EXISTS;

exit
