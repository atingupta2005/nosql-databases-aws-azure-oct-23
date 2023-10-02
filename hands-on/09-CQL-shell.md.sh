## cqlsh: the CQL shell

- cqlsh is a command-line interface for interacting with Cassandra using CQL (the Cassandra Query Language)
- It is shipped with every Cassandra package, and can be found in the bin/ directory alongside the cassandra executable
- cqlsh is implemented with the Python native protocol driver, and connects to the single specified node.

## Command Line Options

- Usage:
    - cqlsh [options] [host [port]]

![image.png](image.png)

![image.png](image.png)

## Special Commands
- In addition to supporting regular CQL statements, cqlsh also supports a number of special commands that are not part of CQL.

![image.png](image.png)


```CQL
SHOW VERSION
```


```CQL
SHOW HOST
```


```CQL
SOURCE '/home/calvinhobbs/commands.cql'
```

## EXIT
- Ends the current session and terminates the cqlsh process.


```CQL
EXIT
QUIT
```

## CLEAR
- Clears the console.


```CQL
CLEAR
CLS
```

## DESCRIBE
- Prints a description (typically a series of DDL statements) of a schema element or the cluster. This is useful for dumping all or portions of the schema.


```CQL
DESCRIBE CLUSTER
DESCRIBE SCHEMA
DESCRIBE KEYSPACES
DESCRIBE KEYSPACE <keyspace name>
DESCRIBE TABLES
DESCRIBE TABLE <table name>
DESCRIBE INDEX <index name>
DESCRIBE MATERIALIZED VIEW <view name>
DESCRIBE TYPES
DESCRIBE TYPE <type name>
DESCRIBE FUNCTIONS
DESCRIBE FUNCTION <function name>
DESCRIBE AGGREGATES
DESCRIBE AGGREGATE <aggregate function name>
```

## COPY TO
- Copies data from a table to a CSV file.


```CQL
```
COPY <table name> [(<column>, ...)] TO <file name>
```
```

## COPY FROM
- Copies data from a CSV file to table.
- Usage:
    - 
    ```
    COPY <table name> [(<column>, ...)] FROM <file name> WITH
    ```
