```
USE kspatingupta2005;
```

```
CONSISTENCY LOCAL_QUORUM
```

```
CREATE TABLE IF NOT EXISTS user ( first_name text, last_name text, title text, PRIMARY KEY (first_name));
```

```
SELECT * FROM system_schema.keyspaces;
```

```
INSERT INTO user (first_name, last_name, title) VALUES ('Bill', 'Nguyen', 'Mr.') IF NOT EXISTS;
```


```
INSERT INTO user (first_name, last_name) VALUES ('Mary', 'Rodriguez') IF NOT EXISTS;
```
