# Security
- By default, Cassandra doesn’t require authentication for someone to log into a cluster
- That is, you can simply type in cqlsh without any credentials and gain access to the cluster

## Creating Roles
- Cassandra comes with a built-in role named cassandra and the password is cassandra as well
- This default role cassandra has administrator privileges
- You can also create additional login roles and grant them the administrator privilege.
- By default, the authentication option in the cassandra.yaml file is set to
```
authenticator: AllowAllAuthenticator
```
- AllowAuthenticator is the default authentication backend
- If you set AllowAuthenticator as the value for the authenticator property, you disable authentication in the database
- Cassandra won’t perform any checks and will allow anyone to log in without a challenge.
- The alternative to AllowAuthenticator as the authentication backend is PasswordAuthenticator
- Change the authentication option in the cassandra.yaml file to PasswordAuthenticator, as shown here:
```
authenticator: PasswordAuthenticator
```
- Note: Make sure to modify cassandra.yaml on all nodes
- The change you make here forces Cassandra to require a role name and password when a client connects to the cluster.
- The system keyspace system_auth stores the role credentials
If you’ve only the default single replica for this keyspace, you can lose access to the cluster if that replica becomes unavailable.
- Therefore, to enhance availability, increase the replication factor for the system_auth tablespace to a higher value such as 3 or 5 per datacenter, as shown here:
```
ALTER KEYSPACE "system_auth"
WITH REPLICATION = {'class' :
'NetworkTopologyStrategy', 'dc1' : 1,
'dc2' : 1};
```

- To ensure that the replication factor changes are enforced throughout the cluster, run the nodetool repair command for the system_auth keyspace.
```
nodetool repair system_auth
```

- Restart
```
sudo service cassandra restart
```

## Creating Roles
```
cqlsh vmubuntu1 -u cassandra -p cassandra
```

```
create role 'test' with password='test123';
create role 'newsuper' with password='test123';
list roles;
select * from system_auth.roles;
alter role 'newsuper' with password = 'newsuper2';
drop role newsuper;
create role 'newsuper' with password='newsuper1' superuser;
```

- Edit cassandra.yaml
```
-authorizer: org.apache.cassandra.auth.CassandraAuthorizer
```

```
sudo service cassandra restart
```

```
grant all permissions on all keyspaces to newsuper;
```

```
create role 'sam' with password='test123';
alter role 'sam' with login=true;
```

```
grant select on all keyspaces to 'sam';
grant modify on all keyspaces to 'sam';
grant modify on keyspace test_keyspace to 'sam';
```

```
use system_auth;
```

```
select * from role_permissions;
```

```
cqlsh vmubuntu1 -u sam -p test123
```

- Should throw security error
```
ALTER KEYSPACE "system_auth"
WITH REPLICATION = {'class' :
'NetworkTopologyStrategy', 'dc1' : 1,
'dc2' : 1};
```
