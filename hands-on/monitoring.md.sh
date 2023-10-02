# Monitoring
- The nodetool proxyhistograms command shows the network statistics in a cluster.
```
nodetool proxyhistograms
```

- get statistics about one or more tables
```
nodetool tablestats test_keyspace.user
```

- Get network information about a node
```
nodetool netstats -H
```

- Provides statistics about tables that you can use to plot a frequency function
```
nodetool tablehistograms test_keyspace user
```


- Here’s a description of the key columns in the output of the command:
  - Percentile: The percentile rank
  - SSTables: The number of SSTables accessed per read during a recent read
  - Write Latency: The write latency in microseconds for recent writes
  - Read Latency: The read latency in microseconds for recent reads
  - Partition Size: The partition size in bytes

## Checking the Cluster Health
- Enables to check the health of a cluster’s nodes
- In addition, it also lets know about the distribution of data among the nodes
- Monitor the cluster with this command, and if it shows an unbalanced cluster due to too many nodes in a rack, move some of the nodes around
```
nodetool status
```

- To get node information, such as disk load, uptime, and heap memory usage.
- The command also provides valuable information about how the database is utilizing all three of its caches: the key cache, the row cache, and the
counter cache.
```
nodetool info
```

- Shows the usage statistics of thread pools.
```
nodetool tpstats
```
