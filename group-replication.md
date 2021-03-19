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
# Step 3 setup firewall 
firewall-cmd --zone=public --list-all
firewall-cmd --add-service=mysql --permanent 
firewall-cmd --add-port=33060-33061/tcp --permanent
firewall-cmd --reload 
```

```
# Step 4: setting z_cluster.cnf 
[mysqld]

server_id=1
bind-address=0.0.0.0
gtid_mode=ON
enforce_gtid_consistency=ON
# from 8.0.23 on, mysql understand checksum
# so no need to set to NONE 
# binlog_checksum=NONE

plugin_load_add='group_replication.so'
group_replication_single_primary_mode=OFF
loose-group_replication_group_name="9d7a361f-8884-11eb-9199-525400278b50"
loose-group_replication_start_on_boot=OFF
loose-group_replication_local_address= "192.168.56.102:33061"
loose-group_replication_group_seeds="192.168.56.102:33061, 192.168.56.103:33061, 192.168.56.104:33061"
loose-group_replication_bootstrap_group=OFF
report_host=192.168.56.102

# restart 
systemctl restart mysqld 

```
