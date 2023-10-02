# Configuring Cassandra Cluster
## endpoint_snitch
- It tells Cassandra about the network topology so it can efficiently
route its requests.
- It enables Cassandra to spread the data copies (replicas) around the
cluster, thus avoiding correlated failures. Cassandra uses datacenters
and racks to logically group a cluster’s nodes. It tries its best not to
store multiple replicas of the same piece of data on a single rack.
- Cassandra offers a half dozen snitches, but for production environments, the go-to option is the GossipingPropertyFileSnitch.
- When you select the GossipingPropertyFileSnitch option, you specify the
datacenter and the rack in the cassandra-rackdc.properties file on that node.
Cassandra then propagates this information to the other nodes via gossip.

## auto_bootstrap
- The default value for the auto_bootstrap property is true, and the parameter is not present in the cassandra.yaml file
- This parameter makes new non-seed nodes migrate the data to themselves

## Change snitch:
```
sudo nano /etc/cassandra/cassandra.yaml
```

```
endpoint_snitch: GossipingPropertyFileSnitch
```

## Configuring the Datacenter and Rack Names
- In my cluster, I have a single datacenter and a single rack
- I must specify the datacenter and rack names in the cassandra-rackdc.properties file.
```
sudo nano /etc/cassandra/cassandra-rackdc.properties
```

- indicate the rack and dc for this node
```
dc=DC1
rack=RACK1
```
- I need to do this on all six nodes of the cluster.

- Node: Do the required changes in cassandra.yaml and cassandra-rackdc.properties and run below commands

```
nodetool decommission -f
sudo systemctl stop cassandra
sudo rm -rf /var/lib/cassandra/* /var/log/cassandra/*
sudo systemctl start cassandra
```

```
tail -f -n 500  /var/log/cassandra/debug.log
```

```
nodetool status
nodetool info
nodetool describecluster
```
