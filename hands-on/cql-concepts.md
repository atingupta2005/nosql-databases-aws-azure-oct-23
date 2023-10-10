# DynamoDB using CQL

## Environment Setup
```
sudo apt update
java -version
sudo apt install default-jre
sudo apt install default-jdk
javac -version
sudo apt install -y unzip zip tree

pip install awscli
aws configure
```

```
curl -O https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.zip
```

```
unzip dynamodb_local_latest.zip
```

```
java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
```

```
export LOCAL="--endpoint-url http://localhost:8000"
```

```
aws dynamodb list-tables $LOCAL
```

## Creating a table
```
aws dynamodb create-table \
  --table-name UsersTable \
  --attribute-definitions '[
    {
        "AttributeName": "Username",
        "AttributeType": "S"
    }
  ]' \
  --key-schema '[
    {
        "AttributeName": "Username",
        "KeyType": "HASH"
    }
  ]' \
  --provisioned-throughput '{
    "ReadCapacityUnits": 1,
    "WriteCapacityUnits": 1
  }' \
  $LOCAL
```

```
aws dynamodb list-tables $LOCAL
```

```
aws dynamodb describe-table \
  --table-name UsersTable \
  $LOCAL
```

## Put Item
```
aws dynamodb put-item \
    --table-name UsersTable \
    --item '{
      "Username": {"S": "alexdebrie"}
    }' \
    $LOCAL
```

```
aws dynamodb put-item \
    --table-name UsersTable \
    --item '{
      "Username": {"S": "daffyduck"},
      "Name": {"S": "Daffy Duck"},
      "Age": {"N": "81"}
    }' \
    $LOCAL
```

## Get Item
```
aws dynamodb get-item \
    --table-name UsersTable \
    --key '{
      "Username": {"S": "alexdebrie"}
    }' \
    $LOCAL
```

## Expressions
```
aws dynamodb get-item \
    --table-name UsersTable \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
    $LOCAL
```

```
aws dynamodb get-item \
    --table-name UsersTable \
    --projection-expression "Age, Username" \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
    $LOCAL
```


```
aws dynamodb get-item \
    --table-name UsersTable \
    --projection-expression "#a, #u" \
    --expression-attribute-names '{
      "#a": "Age",
      "#u": "Username"
    }' \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
    $LOCAL
```

## Updating Items
```
aws dynamodb update-item \
    --table-name UsersTable \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
    --update-expression 'SET #dob = :dob' \
    --expression-attribute-names '{
      "#dob": "DateOfBirth"
    }' \
    --expression-attribute-values '{
      ":dob": {"S": "1937-04-17"}
    }' \
    $LOCAL
```

```
aws dynamodb get-item \
    --table-name UsersTable \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
    $LOCAL
```


```
aws dynamodb update-item \
    --table-name UsersTable \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
    --update-expression 'REMOVE #dob' \
    --expression-attribute-names '{
      "#dob": "DateOfBirth"
    }' \
    --return-values 'ALL_NEW' \
    $LOCAL
```


```
aws dynamodb delete-item \
    --table-name UsersTable \
    --key '{
      "Username": {"S": "daffyduck"}
    }' \
    $LOCAL
```
	

## Working with Multiple Items
```
aws dynamodb create-table \
    --table-name UserOrdersTable \
    --attribute-definitions '[
      {
          "AttributeName": "Username",
          "AttributeType": "S"
      },
      {
          "AttributeName": "OrderId",
          "AttributeType": "S"
      }
    ]' \
    --key-schema '[
      {
          "AttributeName": "Username",
          "KeyType": "HASH"
      },
      {
          "AttributeName": "OrderId",
          "KeyType": "RANGE"
      }
    ]' \
    --provisioned-throughput '{
      "ReadCapacityUnits": 1,
      "WriteCapacityUnits": 1
    }' \
    $LOCAL
```

```
aws dynamodb batch-write-item \
    --request-items '{
        "UserOrdersTable": [
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20160630-12928"},
                        "Amount": {"N": "142.23"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20170608-10171"},
                        "Amount": {"N": "18.95"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20170609-25875"},
                        "Amount": {"N": "116.86"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20160630-28176"},
                        "Amount": {"N": "88.30"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-18618"},
                        "Amount": {"N": "122.45"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-4177"},
                        "Amount": {"N": "27.89"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170608-24041"},
                        "Amount": {"N": "142.02"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-17146"},
                        "Amount": {"N": "114.00"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-9476"},
                        "Amount": {"N": "19.41"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20160630-13286"},
                        "Amount": {"N": "146.37"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-8718"},
                        "Amount": {"N": "76.19"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20171129-29970"},
                        "Amount": {"N": "6.98"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-10699"},
                        "Amount": {"N": "122.52"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20160630-25621"},
                        "Amount": {"N": "141.78"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170330-29929"},
                        "Amount": {"N": "80.36"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20160630-4350"},
                        "Amount": {"N": "138.93"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170330-20659"},
                        "Amount": {"N": "47.79"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170115-20782"},
                        "Amount": {"N": "80.05"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170330-18781"},
                        "Amount": {"N": "98.40"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170330-1645"},
                        "Amount": {"N": "25.53"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170115-2268"},
                        "Amount": {"N": "37.30"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-8267"},
                        "Amount": {"N": "32.13"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170330-3572"},
                        "Amount": {"N": "126.17"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20171129-28042"},
                        "Amount": {"N": "83.12"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-481"},
                        "Amount": {"N": "136.68"}
                    }
                }
            }
        ]
    }' \
    $LOCAL
```

```
aws dynamodb query \
    --table-name UserOrdersTable \
    --key-condition-expression "Username = :username" \
    --expression-attribute-values '{
        ":username": { "S": "daffyduck" }
    }' \
    $LOCAL
```


## Querying
```
aws dynamodb query \
    --table-name UserOrdersTable \
    --key-condition-expression "Username = :username AND OrderId BETWEEN :startdate AND :enddate" \
    --expression-attribute-values '{
        ":username": { "S": "daffyduck" },
        ":startdate": { "S": "20170101" },
        ":enddate": { "S": "20180101" }
    }' \
    $LOCAL
```



```
aws dynamodb query \
    --table-name UserOrdersTable \
    --key-condition-expression "Username = :username" \
    --expression-attribute-values '{
        ":username": { "S": "daffyduck" }
    }' \
    --projection-expression 'Amount' \
    $LOCAL
```



```
aws dynamodb query \
    --table-name UserOrdersTable \
    --key-condition-expression "Username = :username" \
    --expression-attribute-values '{
        ":username": { "S": "daffyduck" }
    }' \
    --select COUNT \
    $LOCAL
```



## Scans
```
aws dynamodb scan \
    --table-name UserOrdersTable \
    $LOCAL
```



```
aws dynamodb scan \
    --table-name UserOrdersTable \
    --max-items 1 \
    $LOCAL
```



```
aws dynamodb scan \
    --table-name UserOrdersTable \
    --total-segments 3 \
    --segment 0 \
    $LOCAL
```

```
aws dynamodb scan \
    --table-name UserOrdersTable \
    --total-segments 3 \
    --segment 1 \
    $LOCAL
```

## Filtering
```
aws dynamodb query \
    --table-name UserOrdersTable \
    --key-condition-expression "Username = :username" \
    --filter-expression "Amount > :amount" \
    --expression-attribute-values '{
        ":username": { "S": "daffyduck" },
        ":amount": { "N": "100" }
    }' \
    $LOCAL
```

```
aws dynamodb delete-table \
    --table-name UserOrdersTable \
    $LOCAL
```

### Creating a Local Secondary Index
```
aws dynamodb create-table \
    --table-name UserOrdersTable \
    --attribute-definitions '[
      {
          "AttributeName": "Username",
          "AttributeType": "S"
      },
      {
          "AttributeName": "OrderId",
          "AttributeType": "S"
      },
      {
          "AttributeName": "Amount",
          "AttributeType": "N"
      }
    ]' \
    --key-schema '[
      {
          "AttributeName": "Username",
          "KeyType": "HASH"
      },
      {
          "AttributeName": "OrderId",
          "KeyType": "RANGE"
      }
    ]' \
    --local-secondary-indexes '[
      {
          "IndexName": "UserAmountIndex",
          "KeySchema": [
              {
                  "AttributeName": "Username",
                  "KeyType": "HASH"
              },
              {
                  "AttributeName": "Amount",
                  "KeyType": "RANGE"
              }
          ],
          "Projection": {
              "ProjectionType": "KEYS_ONLY"
          }
      }
    ]' \
    --provisioned-throughput '{
      "ReadCapacityUnits": 1,
      "WriteCapacityUnits": 1
    }' \
    $LOCAL
```

- Insert data
```
aws dynamodb batch-write-item \
    --request-items '{
        "UserOrdersTable": [
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20160630-12928"},
                        "Amount": {"N": "142.23"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20170608-10171"},
                        "Amount": {"N": "18.95"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20170609-25875"},
                        "Amount": {"N": "116.86"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20160630-28176"},
                        "Amount": {"N": "88.30"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-18618"},
                        "Amount": {"N": "122.45"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-4177"},
                        "Amount": {"N": "27.89"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170608-24041"},
                        "Amount": {"N": "142.02"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-17146"},
                        "Amount": {"N": "114.00"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-9476"},
                        "Amount": {"N": "19.41"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20160630-13286"},
                        "Amount": {"N": "146.37"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-8718"},
                        "Amount": {"N": "76.19"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20171129-29970"},
                        "Amount": {"N": "6.98"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-10699"},
                        "Amount": {"N": "122.52"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20160630-25621"},
                        "Amount": {"N": "141.78"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170330-29929"},
                        "Amount": {"N": "80.36"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20160630-4350"},
                        "Amount": {"N": "138.93"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170330-20659"},
                        "Amount": {"N": "47.79"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170115-20782"},
                        "Amount": {"N": "80.05"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170330-18781"},
                        "Amount": {"N": "98.40"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170330-1645"},
                        "Amount": {"N": "25.53"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170115-2268"},
                        "Amount": {"N": "37.30"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170609-8267"},
                        "Amount": {"N": "32.13"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20170330-3572"},
                        "Amount": {"N": "126.17"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20171129-28042"},
                        "Amount": {"N": "83.12"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-481"},
                        "Amount": {"N": "136.68"}
                    }
                }
            }
        ]
    }' \
    $LOCAL
```

- Scan all the records
```
aws dynamodb scan \
    --table-name UserOrdersTable \
    --select COUNT \
    $LOCAL
```

### Querying a Local Secondary Index
- In our filter example, we looked for all of Daffy Duck's Orders that were over $100. We can now convert this directly to a Query without using a filter:

```
aws dynamodb query \
    --table-name UserOrdersTable \
    --index-name UserAmountIndex \
    --key-condition-expression "Username = :username AND Amount > :amount" \
    --expression-attribute-values '{
        ":username": { "S": "daffyduck" },
        ":amount": { "N": "100" }
    }' \
    $LOCAL
```

- Just like the filter example, we received only one Item back that satisfied our conditions. However, look at the ScannedCount and Count. When we ran this query with a filter, we scanned 4 Items. These were all of Daffy's orders. It then returned a Count of 1 Item that satisfied the filter.

- When we queried the index, our ScannedCount is 1. This shows that we only retrieved 1 Item rather than all 4. This resulted in our query using a smaller number of read capacity units than with the filter example. When querying partitions with a large number of Items, this can make a huge difference in query speed and complexity.


## Global Secondary Indexes
### Creating a Global Secondary Index
```
aws dynamodb update-table \
    --table-name UserOrdersTable \
    --attribute-definitions '[
      {
          "AttributeName": "ReturnDate",
          "AttributeType": "S"
      },
      {
          "AttributeName": "OrderId",
          "AttributeType": "S"
      }
    ]' \
    --global-secondary-index-updates '[
        {
            "Create": {
                "IndexName": "ReturnDateOrderIdIndex",
                "KeySchema": [
                    {
                        "AttributeName": "ReturnDate",
                        "KeyType": "HASH"
                    },
                    {
                        "AttributeName": "OrderId",
                        "KeyType": "RANGE"
                    }
                ],
                "Projection": {
                    "ProjectionType": "ALL"
                },
                "ProvisionedThroughput": {
                    "ReadCapacityUnits": 1,
                    "WriteCapacityUnits": 1
                }
            }
        }
    ]' \
    $LOCAL
```

### Querying a Global Secondary Index
```
aws dynamodb scan \
    --table-name UserOrdersTable \
    --index-name ReturnDateOrderIdIndex \
    $LOCAL
```

### Let's use the BatchWriteItem API call to insert a few Orders that have been returned:
```
aws dynamodb batch-write-item \
    --request-items '{
        "UserOrdersTable": [
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "alexdebrie"},
                        "OrderId": {"S": "20160630-12928"},
                        "Amount": {"N": "142.23"},
                        "ReturnDate": {"S": "20160705"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20170608-10171"},
                        "Amount": {"N": "18.95"},
                        "ReturnDate": {"S": "20170628"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "daffyduck"},
                        "OrderId": {"S": "20170609-25875"},
                        "Amount": {"N": "116.86"},
                        "ReturnDate": {"S": "20170628"}
                    }
                }
            },
            {
                "PutRequest": {
                    "Item": {
                        "Username": {"S": "yosemitesam"},
                        "OrderId": {"S": "20170609-18618"},
                        "Amount": {"N": "122.45"},
                        "ReturnDate": {"S": "20170615"}
                    }
                }
            }
        ]
    }' \
    $LOCAL
```


### Scan data again. We will receive our 4 Items back:
```
aws dynamodb scan \
    --table-name UserOrdersTable \
    --index-name ReturnDateOrderIdIndex \
    $LOCAL
```

