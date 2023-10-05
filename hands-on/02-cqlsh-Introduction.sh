source /pyenv/bin/activate
export AWS_DEFAULT_REGION=us-east-1
cqlsh-expansion cassandra.us-east-1.amazonaws.com 9142 --ssl

# To get help for cqlsh, type HELP or ? to see the list of available commands:

HELP


## To learn about the current cluster you’re working in, type:

DESCRIBE CLUSTER;


## Documented Shell Commands
- HELP − Displays help topics for all cqlsh commands.
- CAPTURE − Captures the output of a command and adds it to a file.
- CONSISTENCY − Shows the current consistency level, or sets a new consistency level.
- COPY − Copies data to and from Cassandra.
- DESCRIBE − Describes the current cluster of Cassandra and its objects.
- EXPAND − Expands the output of a query vertically.
- EXIT − Using this command, you can terminate cqlsh.
- PAGING − Enables or disables query paging.
- SHOW − Displays the details of current cqlsh session such as Cassandra version, host, or data type assumptions.
- SOURCE − Executes a file that contains CQL statements.
- TRACING − Enables or disables request tracing.


## CQL Data Definition Commands
- CREATE KEYSPACE − Creates a KeySpace in Cassandra.
- USE − Connects to a created KeySpace.
- ALTER KEYSPACE − Changes the properties of a KeySpace.
- DROP KEYSPACE − Removes a KeySpace
- CREATE TABLE − Creates a table in a KeySpace.
- ALTER TABLE − Modifies the column properties of a table.
- DROP TABLE − Removes a table.
- TRUNCATE − Removes all the data from a table.
- CREATE INDEX − Defines a new index on a single column of a table.
- DROP INDEX − Deletes a named index.

## CQL Data Manipulation Commands
- INSERT − Adds columns for a row in a table.
- UPDATE − Updates a column of a row.
- DELETE − Deletes data from a table.
- BATCH − Executes multiple DML statements at once.

## CQL Clauses
- SELECT − This clause reads data from a table
- WHERE − The where clause is used along with select to read a specific data.
- ORDERBY − The orderby clause is used along with select to read a specific data in a specific order.

# To see which keyspaces are available in the cluster, issue the command below.
# What are these keyspaces for?
DESCRIBE KEYSPACES;

# Learn the client, server, and protocol versions in use
SHOW VERSION;

# View the default consistency level that will be used on all queries
CONSISTENCY

# Create your own keyspace. Try using tab completion as you enter this command
CREATE KEYSPACE my_keyspace WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

# Describe the keyspace you just created.
# What additional information do you notice?
DESCRIBE KEYSPACE my_keyspace;

# Use the keyspace so you don't have to enter it on every data manipulation
# Note how the prompt changes after you do this
USE my_keyspace;

# Create a simple table
# What other syntax could you use to designate a single column primary key?
CREATE TABLE user ( first_name text, last_name text, PRIMARY KEY (first_name));

# Describe the table you just created
# What additional information do you notice?
DESCRIBE TABLE user;

CONSISTENCY LOCAL_QUORUM

# Write some data
INSERT INTO user (first_name, last_name) VALUES ('Atin', 'Gupta');

# Read the data we just wrote
SELECT * FROM user WHERE first_name='Atin';

# Remove a non-primary key column
DELETE last_name FROM USER WHERE first_name='Atin';

# Check to see the value was removed
SELECT * FROM user WHERE first_name='Atin';

# Delete an entire row
DELETE FROM USER WHERE first_name='Atin';

# Check to make sure it was removed
SELECT * FROM user WHERE first_name='Atin';

# Add a column to the table
ALTER TABLE user ADD title text;

# Check to see that the column was added
DESCRIBE TABLE user;

# Write a couple of rows, populate different columns for each, and view the results:
INSERT INTO user (first_name, last_name, title) VALUES ('Atin', 'Gupta', 'Mr.');
INSERT INTO user (first_name, last_name) VALUES ('Parul', 'Rodriguez');
SELECT * FROM user;

# Remove the entire table
DROP TABLE user;

# Clear the screen of output from previous commands
CLEAR

# Exit cqlsh
EXIT
