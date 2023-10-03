# To get help for cqlsh, type HELP or ? to see the list of available commands:
```
HELP
```

## To learn about the current cluster you’re working in, type:
```
DESCRIBE CLUSTER;
```

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