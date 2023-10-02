## Install Cassandra
```
sudo apt -y update
sudo apt install net-tools
sudo apt -y install openjdk-8-jdk -y    # Note: Only this version is needed
java -version
sudo swapoff –all
```

- Enable Ports:
  - Port 7000: For Cassandra inter-node cluster communication
  - Port 7001: For Cassandra SSL inter-node cluster communication
  - Port 7199: For Cassandra JMX monitoring
  - Port 9042: Cassandra native client port
  - Port 9160: Cassandra client port (Thrift)

```
sudo apt -y install apt-transport-https
```

```
sudo sh -c 'echo "deb http://www.apache.org/dist/cassandra/debian 40x main" > /etc/apt/sources.list.d/cassandra.list'
```

```
wget -q -O - https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
```

```
sudo apt -y update
```

```
sudo apt -y install cassandra
```

- If needed:
```
nodetool decommission
sudo rm -rf /var/lib/cassandra/* /var/log/cassandra/*
```

```
sudo cp /etc/cassandra/cassandra.yaml /etc/cassandra/cassandra.yaml.backup
sudo nano /etc/cassandra/cassandra.yaml
```

- Cluster Name: 'Atin Cluster'

- Configuration: /etc/cassandra/cassandra.yaml
  - listen_address: comment out <Private IP>
  - rpc_address: comment out <Public IP>
  - seeds: "10.0.0.5:7000,10.0.0.6:7000,10.0.0.7:7000" <public-ip>

- Configuration: /etc/hosts
  - 10.0.0.? vmubuntu?


```
sudo systemctl status cassandra
```

```
sudo systemctl enable cassandra
```

```
sudo systemctl stop cassandra
sudo systemctl start cassandra
```

```
tail -f -n 500  /var/log/cassandra/debug.log
```

```
nodetool status
nodetool info
nodetool describecluster
nodetool repair
```

```
cqlsh
```

- Important File Paths:
```
ls /etc/cassandra/cassandra.yaml
ll /var/log/cassandra/
ll /var/lib/cassandra/data
ll /var/lib/cassandra/commitlog
ll /var/lib/cassandra/saved_caches
ls /usr/share/cassandra/
ls ~/.cassandra/
```

## Install Jupyter Kernal for Cassandra (Optional)
```
sudo apt install python3.8-venv
```

```
python3 -m venv cassandra-env
```

```
source ~/cassandra-env/bin/activate
```

```
pip install cqljupyter
```

```
pip install notebook
```


```
python -m cqljupyter.install  [<hostname> <port>] [--ssl] [-u user] [-p password]
```

```
jupyter notebook --ip=0.0.0.0
```
