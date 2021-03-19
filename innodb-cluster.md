# InnoDB Cluster (Centos/Redhat 8) 

## Pre-Requisites:

```
Install 4 Servers:
e.g. 
192.168.56.101  gr1.training.local gr1
192.168.56.102  gr2.training.local gr2
192.168.56.103  gr3.training.local gr3 
192.168.56.104  router.training.local router 

- set hostname properly for each server: 
hostnamectl set-hostname gr1.training.local  

on every server add the above configuration to the /etc/hosts 
```


## Step 1: Setup Server 1 

```
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
yum install mysql-server mysql mysql-shell

### set firewall and selinux 
semanage port -a -t mysqld_port_t -p tcp 33061 
firewall-cmd --add-service=mysql
firewall-cmd --add-port 33060-33061/tcp --permanent 
firewall-cmd --reload 

### start and enable service 
systemctl start mysqld
systemctl enable mysqld

# set pw 
cat /var/log/mysqld.log | grep temp 
mysql -p 
mysql> create user root@localhost identified by 'P@ssw0rd'

### set firewall and selinux 
semanage port -a -t mysqld_port_t -p tcp 33061 
firewall-cmd --add-service=mysql
firewall-cmd --add-port 33060-33061/tcp --permanent 
firewall-cmd --reload 

## configure the instance 
mysqlsh --uri=root@localhost 
JS> dba.configureInstance()
```

## Step 2: Setup Server 2 

```
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
yum install mysql-server mysql mysql-shell

### set firewall and selinux 
semanage port -a -t mysqld_port_t -p tcp 33061 
firewall-cmd --add-service=mysql
firewall-cmd --add-port 33060-33061/tcp --permanent 
firewall-cmd --reload 

### start and enable service 
systemctl start mysqld
systemctl enable mysqld

# set pw 
cat /var/log/mysqld.log | grep temp 
mysql -p 
mysql> create user root@localhost identified by 'P@ssw0rd'

### set firewall and selinux 
semanage port -a -t mysqld_port_t -p tcp 33061 
firewall-cmd --add-service=mysql
firewall-cmd --add-port 33060-33061/tcp --permanent 
firewall-cmd --reload 

## configure the instance 
mysqlsh --uri=root@localhost 
JS> dba.configureInstance()
```

## Step 3: Setup Server 3 

```
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
yum install mysql-server mysql mysql-shell

### set firewall and selinux 
semanage port -a -t mysqld_port_t -p tcp 33061 
firewall-cmd --add-service=mysql
firewall-cmd --add-port 33060-33061/tcp --permanent 
firewall-cmd --reload 

### start and enable service 
systemctl start mysqld
systemctl enable mysqld

# set pw 
cat /var/log/mysqld.log | grep temp 
mysql -p 
mysql> create user root@localhost identified by 'P@ssw0rd'

### set firewall and selinux 
semanage port -a -t mysqld_port_t -p tcp 33061 
firewall-cmd --add-service=mysql
firewall-cmd --add-port 33060-33061/tcp --permanent 
firewall-cmd --reload 

## configure the instance 
mysqlsh --uri=root@localhost 
dba.configureInstance()

## --> add User -> [2]
## clusteradmin
## pw:  yourclusteradminpw
 
```

## Step 4: Setup Cluster and addInstances (on gr1- server1)  

```
mysqlsh --uri clusteradmin@gr1 
JS> rs.dba.createCluster('devCluster')
JS> rs.status()
JS> rs.addInstance('clusteradmin@gr2') 
JS> rs.addInstance('clusteradmin@gr3')
```


## Step 5: Setup mysqlrouter on Server 4 

```
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
yum install mysql mysqlrouter
mysqlrouter --bootstrap clusteradmin@gr2  --user mysqlrouter  --force
systemctl start mysqlrouter 
systemctl enable mysqlrouter 

```
