# Document DB Console

### Install Mongo Shell
```
sudo apt-get install gnupg
wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-7.0.asc
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update
sudo apt-get install -y mongodb-mongosh
```

### Install Mongo tools
```
wget https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-x86_64-100.9.0.deb
sudo apt install ./mongodb-database-tools-*-100.9.0.deb
```


### Download Certificate to connect to Document DB
```
wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
```

### Download sample data
```
wget https://raw.githubusercontent.com/ozlerhakan/mongodb-json-files/master/datasets/restaurant.json
```

### Import Sample Data
```
mongoimport --ssl --host="ag-source-docdb-2023-11-01-05-05-53.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017" --collection=restaurants --db=business --file=restaurant.json --numInsertionWorkers 4 --username=atingupta2005 --password=Aws123456 --sslCAFile global-bundle.pem
```

### Dumping
```
mongodump --ssl --host="ag-source-docdb-2023-11-01-05-05-53.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017" --collection=restaurants --db=business --out=restaurantDump.bson --numParallelCollections 4 --username=atingupta2005 --password=Aws123456 --sslCAFile global-bundle.pem
```

### Drop
```
mongosh --ssl --host ag-source-docdb-2023-11-01-05-05-53.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017 --sslCAFile global-bundle.pem --username atingupta2005 --password Aws123456
```

```
use business
```

```
db.restaurants.drop()
```

```
exit
```

### Restore
```
mongorestore --ssl --host="ag-source-docdb-2023-11-01-05-05-53.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017" --numParallelCollections 4 --username=atingupta2005 --password=Aws123456 --sslCAFile global-bundle.pem restaurantDump.bson
```

### Export
```
mongoexport --ssl --host="ag-source-docdb-2023-11-01-05-05-53.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017" --collection=restaurants --db=business --out=restaurant2.json --username=atingupta2005 --password=Aws123456 --sslCAFile global-bundle.pem
```


### Connect to Mongo DB
```
mongosh --ssl --host ag-source-docdb-2023-11-01-05-05-53.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017 --sslCAFile global-bundle.pem --username atingupta2005 --password Aws123456
```

### Database Access Using Role-Based Access Control
```
show users
```

```
db.createUser({user: "user1", pwd: "abc123", roles: [{role: "readWriteAnyDatabase", db: "admin"}]})
```

```
db.createUser({user: "user2", pwd: "abc123", roles: [{role: "read", db: "sample-database-1"}]})
```

```
db.createUser({user: "user3", pwd: "abc123", roles: [{role: "readWrite", db: "sample-database-1"}]})
```

```
db.grantRolesToUser("user3", [{role: "read", db: "sample-database-2"}])
```

```
db.dropUser("user1")
```

```
db.dropUser("user2")
```

```
show users
```

```
db.updateUser("readInFooBar", {roles: [{role: "read", db: "foo"}, {role: "read", db: "baz"}]})
```

```
db.getRole("read", {showPrivileges:true})
```


## Find and terminate long running or blocked queries?
### List all queries that are either blocked or running for more than 10 seconds
```
db.adminCommand({
    aggregate: 1,
    pipeline: [
        {$currentOp: {}},
        {$match: 
            {$or: [
                {secs_running: {$gt: 10}},
                {WaitState: {$exists: true}}]}},
        {$project: {_id:0, opid: 1, secs_running: 1}}],
    cursor: {}
});
```

### To find and terminate a query running for more than 10 seconds
```
db.adminCommand({
    aggregate: 1,
    pipeline: [
        {$currentOp: {}},
        {$match: 
            {$or: 
                [{secs_running: {$gt: 10}},
                 {WaitState: {$exists: true}}]}}],
    cursor: {}
});

db.adminCommand({killOp: 1, op: 24646});
```

### See a query plan and optimize a query?
```
db.runCommand({explain:{
    aggregate: "sample-document",
    pipeline: [{$match: {x: {$eq: 1}}}],
    cursor: {batchSize: 1}}
});
```

### List all running operations on an instance?
```
db.adminCommand({currentOp: 1, $all: 1});
```

### Determine the open cursors on an instance?
```
db.runCommand("listCursors") 
```

### Analyze index usage and identify unused indexes?
```
db.collection.getIndexes()
```

```
db.collection.dropIndex("indexName")
```

```
exit
```

## Install and configure MongoDB community edition
```
sudo apt-get install -y libcurl4 libgssapi-krb5-2 libldap-2.5-0 libwrap0 libsasl2-2 libsasl2-modules libsasl2-modules-gssapi-mit openssl liblzma5
```

```
sudo apt install software-properties-common gnupg apt-transport-https ca-certificates -y
```

```
curl -fsSL https://pgp.mongodb.com/server-7.0.asc |  sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
```

```
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
```

```
sudo apt update
```

```
sudo apt purge mongodb-org
sudo apt install mongodb-org -y
```

```
mongod --version
```


```
sudo nano /etc/mongod.conf
```

- Change from bindIp: 127.0.0.1 to bindIp: 0.0.0.0

```
sudo service mongod restart
```

```
sudo systemctl enable mongod
```

```
sudo systemctl status mongod
```

```
sudo ss -pnltu | grep 27017
```

```
mongosh
```

```
show dbs
```

```
exit
```

### Import sample data to local mongodb
```
wget http://media.mongodb.org/zips.json
```

```
mongoimport --host ec2-34-230-63-221.compute-1.amazonaws.com:27017 --db zips-db --file zips.json

```
mongosh --host ec2-34-230-63-221.compute-1.amazonaws.com:27017
```


```
use zips-db
```

```
db.zips.count()
```

```
db.zips.aggregate( [
   { $group: { _id: { state: "$state", city: "$city" }, pop: { $sum: "$pop" } } },
   { $group: { _id: "$_id.state", avgCityPop: { $avg: "$pop" } } }
] )
```

```
exit
```

