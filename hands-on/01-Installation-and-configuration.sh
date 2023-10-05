## Configure AWS CLI

aws --version
aws configure
aws s3 ls


## Create Keyspaces

aws keyspaces create-keyspace --keyspace-name ksp$USER
aws keyspaces get-keyspace --keyspace-name ksp$USER


## Create table

aws keyspaces create-table --keyspace-name ksp$USER --table-name 'book_awards' --schema-definition 'allColumns=[{name=year,type=int},{name=award,type=text},{name=rank,type=int}, {name=category,type=text}, {name=author,type=text},{name=book_title,type=text},{name=publisher,type=text}], partitionKeys=[{name=year},{name=award}],clusteringKeys=[{name=category,orderBy=ASC},{name=rank,orderBy=ASC}]'

aws keyspaces get-table --keyspace-name ksp$USER --table-name 'book_awards'



## Using the cqlsh-expansion to connect to Amazon Keyspaces

source /pyenv/bin/activate
pip install cqlsh-expansion
cqlsh-expansion.init



export AWS_DEFAULT_REGION=us-east-1



cqlsh-expansion cassandra.us-east-1.amazonaws.com 9142 --ssl


