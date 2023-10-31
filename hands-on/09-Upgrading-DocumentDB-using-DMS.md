# Upgrading Amazon DocumentDB cluster using AWS Database Migration Service

### Enable Change Streams
```
db.adminCommand({modifyChangeStreams: 1, database: "db_name", collection: "", enable: true});
```

### Migrate Indexes
```
git clone https://github.com/awslabs/amazon-documentdb-tools.git
```

```
cd amazon-documentdb-tools/index-tool
```

```
python -m pip install -r requirements.txt
```

```
cd ../..
```
   

```
python amazon-documentdb-tools/index-tool/migrationtools/documentdb_index_tool.py --dump-indexes --uri 'mongodb://atingupta2005:Aws123456@ag-docdb-2023-10-31-06-30-19.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false' --dir .

### Create a AWS DMS Replication Instance

### Create an AWS DMS Source Endpoint

### Create an AWS DMS Target Endpoint

### Create and run a migration task

### Changing the application endpoint to the target Amazon DocumentDB cluster


### Restore Indexes
```
python amazon-documentdb-tools/index-tool/migrationtools/documentdb_index_tool.py --restore-indexes --uri  mongodb://atingupta2005:Aws123456@ag-docdb-2023-10-31-06-30-19.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017/?tls=true&tlsCAFile=global-bundle.pem&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false' --dir .
```

```
mongo --ssl --host atingupta2005:Aws123456@ag-docdb-2023-10-31-06-30-19.cluster-cmihymqkhemz.us-east-1.docdb.amazonaws.com:27017 --sslCAFile rds-ca-2019-root.pem --username atingupta2005 --password Aws123456
```

```
db.coll.getIndexes()
```
