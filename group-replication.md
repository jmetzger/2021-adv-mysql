# Setup group replication 

## Setup Server 1 

```
# Step 1: set pw 

# Step 2: Get uuid for whole group 
mysql> select uuid()

# Step 3: Create /etc/my.cnf.d/z_cluster.cnf 
# + include includedir /etc/my.cnf.d 
# cat /etc/my.cnf
includedir /etc/my.cnf 

```

```
# setup firewall 
firewall-cmd --zone=public --list-all
firewall-cmd --add-service=mysql --permanent 
firewall-cmd --add-port=33060-33061/tcp --permanent
firewall-cmd --reload 
```

