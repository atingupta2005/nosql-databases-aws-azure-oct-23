# Ops Center
- Need cassandra enterprise for this
- We will install Cassandra Enterprise on a single machine with Ops Center

## Install Cassandra Enterprise
### Install Open JDK
```
sudo apt update -y
sudo apt install openjdk-8-jdk -y
export JAVA_HOME=/usr/bin/java
```
### Deal with certificate issue
- Edit the following file:
```
sudo nano /etc/apt/apt.conf.d/apt.conf
```

- Now paste in the following code:
```
// Do not verify peer certificate
Acquire::https::Verify-Peer "false";
// Do not verify that certificate name matches server name
Acquire::https::Verify-Host "false";
```

### Install DSE Cassandra
```
sudo echo "deb https://debian.datastax.com/enterprise stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.sources.list
```
```
sudo curl -k -L https://debian.datastax.com/debian/repo_key | sudo apt-key add -
```
```
sudo apt update
sudo apt -y remove dse=5.1.22-1 \
    dse-full=5.1.22-1 \
    dse-libcassandra=5.1.22-1 \
    dse-libgraph=5.1.22-1 \
    dse-libhadoop2-client-native=5.1.22-1 \
    dse-libhadoop2-client=5.1.22-1 \
    dse-liblog4j=5.1.22-1 \
    dse-libsolr=5.1.22-1 \
    dse-libspark=5.1.22-1 \
    dse-libtomcat=5.1.22-1
```
- Update the max_map_count setting.
```
sudo nano /etc/sysctl.conf
```

- Add the following line:
```
vm.max_map_count = 1048575
```

- Run DSE Cassandra
```
sudo service dse start
```

- Verify the service has started.
```
sudo service dse status
```

- You should see the following output if DSE is running.
  - * dse is running

- As DSE is starting you can tail the logs.
```
tail -f /var/log/cassandra/debug.log
```

- If you see the following output then DSE has finished the startup process and is ready to use.
```
INFO  [main] 2021-04-23 10:05:19,264  DseDaemon.java:872 - DSE startup complete.
```

- You can also use the admin tool nodetool to verify the health of Cassandra.
```
nodetool status
```

## Install Ops Center
```
sudo apt install opscenter -y
```
```
sudo service opscenterd start
```

```
sudo apt install datastax-agent
sudo service datastax-agent start
```

```
curl http://localhost:8888/
```
