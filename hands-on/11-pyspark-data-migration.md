# Migrate data using PySpark

```
sudo apt install -y default-jdk
```

```
sudo apt install -y default-jre
```

```
pip install pyspark
```

```
pip install pyspark[sql]
```


```
pip install pyspark[pandas_on_spark] plotly
```


```
pip install pyspark[connect]
```


```
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

from datetime import datetime, date
import pandas as pd
from pyspark.sql import Row

df = spark.createDataFrame([
    Row(a=1, b=2., c='string1', d=date(2000, 1, 1), e=datetime(2000, 1, 1, 12, 0)),
    Row(a=2, b=3., c='string2', d=date(2000, 2, 1), e=datetime(2000, 1, 2, 12, 0)),
    Row(a=4, b=5., c='string3', d=date(2000, 3, 1), e=datetime(2000, 1, 3, 12, 0))
])

df.show()
df.printSchema()
```