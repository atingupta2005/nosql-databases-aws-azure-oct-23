- Hits directory
```
ll /var/lib/cassandra/hints
```

- Disable hints
```
nodetool statushandoff
nodetool disablehintsfordc dc1
nodetool enablehintsfordc dc1
```

- Delete hints. You can remove all hints on the local node.
```
nodetool truncatehints
```

## Anti-Entropy Repair
- Data can become inconsistent over time due to frequent data deletions and node crashes
- In these situations, you need to maintain the nodes by performing anti-entropy repair
- During anti-entropy repair, Cassandra compares all replicas and updates those replicas to the latest version of the data
- Cassandra uses Merkle trees (binary hash trees) so it can check data independently without the coordinator node having to download the entire
data set.
- When the initiating node detects differences in the Merkel trees from participating peer nodes, it exchanges data for the configuring ranges and Cassandra writes the new data to the SSTables.
```
nodetool repair
nodetool repair -dc dc1
nodetool repair -local
nodetool repair <key-space-name> <table-name>
```

- The nodetool rebuild command is useful when you’re adding a datacenter to your cluster
- If you don’t provide the name of any datacenter, the command may seem to work, but it won’t do anything.
```
nodetool rebuild –keyspace cyclists, motorists
```

- For any reason you wish to reclaim disk space faster, you can run:
```
nodetool cleanup <key-space-name>
```

- Rebuild Indexes
```
nodetool rebuild_index <key-space-name> <table-name> <index-name>;
```

- In cases such as this, where you’re unable to take a node out of a cluster with the nodetool decommission command, run the nodetool assassinate command to get rid of the node.
```
nodetool assassinate
nodetool assassinate -h <ip-address>
```

- If the node you want to remove is healthy and running, just run the nodetool decommission command to remove the node from your cluster
- However, if the node is down, you can’t decommission it, of course, and that’s when you need to run the nodetool removenode command to get rid of the node.
```
nodetool removenode <ip-address>
nodetool removenode status
```

- Getting Information About Gossip
```
nodetool gossipinfo
```

- You can effectively take a running node out of the cluster, without stopping the instance, by disabling the gossip protocol on that node.
- Execute the nodetool disablegossip command to disable the gossip protocol on a node, as shown here:
```
nodetool disablegossip
nodetool statusgossip
tail -f -n 500  /var/log/cassandra/system.log
nodetool enablegossip
tail -f -n 500  /var/log/cassandra/system.log
nodetool statusgossip
```

## Draining a node
- You run the nodetool drain command to flush memtables to SSTables on disk.
```
nodetool drain
```

- The nodetool drain command is interesting. When you run this command,
Cassandra does other things beyond just flushing the memtables to disk
- It also stops listening for any client requests for connections or connection requests from other nodes

```
nodetool enablegossip
// nodetool: Unable to start gossip because the node was drained
```

- It’s a good strategy to flush the memtables to disk prior to taking a snapshot of the database, or one or more keyspaces.
```
nodetool flush -- <keypsace>
```

- Checking for Data Corruption
```
sstableverify --verbose <key-space-name> <table-name>
```

- Removing Corrupt Data by Rebuilding the Table
```
nodetool scrub
```
