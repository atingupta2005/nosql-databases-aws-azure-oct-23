## Database Roles

- CQL uses database roles to represent users and group of users.


```CQL
CREATE ROLE alice WITH PASSWORD = 'password_a' AND LOGIN = true;
```


```CQL
CREATE ROLE bob WITH PASSWORD = 'password_b' AND LOGIN = true AND SUPERUSER = true;
```


```CQL
CREATE ROLE alice WITH PASSWORD = 'password_a' AND LOGIN = true AND ACCESS TO DATACENTERS {'DC1', 'DC3'};
```


```CQL
CREATE ROLE alice WITH PASSWORD = 'password_a' AND LOGIN = true AND ACCESS TO ALL DATACENTERS;
```


```CQL
ALTER ROLE bob WITH PASSWORD = 'PASSWORD_B' AND SUPERUSER = false;
```


```CQL
GRANT report_writer TO alice;
```


```CQL
REVOKE report_writer FROM alice;
```


```CQL
LIST ROLES;
```


```CQL
LIST ROLES OF alice;
```
