# Setup group replication 

## Setup Server 1 

```
Step 0.5:
yum install wget 
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
dnf remove @mysql
dnf module reset mysql && dnf module disable mysql
cd /etc/yum.repos.d
rm -fR percona*
yum install mysql-server 
```
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
# Step 4 setup firewall 
firewall-cmd --zone=public --list-all
firewall-cmd --add-service=mysql --permanent 
firewall-cmd --add-port=33060-33061/tcp --permanent
firewall-cmd --reload 

# Step 4a: selinux adjustments ports
semanage -a -t mysqld_port_t -p tcp 33061

```

```
# Step 5: setting z_cluster.cnf 
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

```
# Step 5: Setup replication user 
# within mysql> client
set sql_log_bin = 0;
create user repl@'192.168.56.%' identified by 'P@ssw0rd';
grant replication slave on *.* to 'repl'@'192.168.56.%';
set sql_log_bin=1;
change master to master_user='repl', master_password='P@ssw0rd' for channel 'group_replication_recovery';
```

```
# Step 6: Start group replication of server 1 (bootstrap)
# within mysql - client 
set global group_replication_bootstrap_group=on; 
start group_replication; 
set global group_replication_bootstrap_group=off;
```

```
# Step 7: Show status 
select * from performance_schema.replication_group_members \G
```

## Setup Server 2 

```
# Step 0.5:
yum install wget 
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
dnf remove @mysql
dnf module reset mysql && dnf module disable mysql
cd /etc/yum.repos.d
rm -fR percona*
yum install mysql-server 
```

```
# Start and set root pw 
systemctl start mysqld 
```

```
# Step 4 setup firewall 
firewall-cmd --zone=public --list-all
firewall-cmd --add-service=mysql --permanent 
firewall-cmd --add-port=33060-33061/tcp --permanent
firewall-cmd --reload 

# Step 4a: selinux adjustments ports
semanage port -a -t mysqld_port_t -p tcp 33061
```




## Setup Server 3 

```
# Step 0.5:
yum install wget 
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
dnf remove @mysql
dnf module reset mysql && dnf module disable mysql
cd /etc/yum.repos.d
rm -fR percona*
yum install mysql-server 
```

```
# Start and set root pw 
systemctl start mysqld 
```

```
# Step 4 setup firewall 
firewall-cmd --zone=public --list-all
firewall-cmd --add-service=mysql --permanent 
firewall-cmd --add-port=33060-33061/tcp --permanent
firewall-cmd --reload 

# Step 4a: selinux adjustments ports
semanage port -a -t mysqld_port_t -p tcp 33061
```


