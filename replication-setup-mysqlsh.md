# Setup Replication with MySQL-Shell (Centos/Redhat 8) 

## Remarks 

```
# Warning: Do not try to use mysql-shell from epel-repo -> Centos/Redaht 
# javascript is not supported 
```

## Installation on both servers 

```
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
yum install mysql-shell 
```

## Configuration Basis Configuration on both servers 

```
mysqlsh --uri root@localhost 
dba.configureReplicaSetInstance()
# use 2 
# setup user: repl 
# and agree to do the changes -> Y
# Restart : Y 
```

## Now login in as replication user on master 

```
mysql --uri repl@master 
rs=dba.createReplicaSet('MasterSlaveGroup')
rs.status()

```

## Probably if not reachable (test with telnet) setup firewalld

```
# test if ports 3306 and 33061 are reachable from outside 
# if not 
firewall-cmd --add-service=mysql --permanent
firewall-cmd --add-port=33060/tcp --permanent
firewall-cmd --reload
```

## Setup mysqlrouter 

```
# on mysqlrouter server / same as app-server
# set same /etc/hosts file 

192.168.56.103 master.training.local master
192.168.56.105 slave.training.local slave
192.168.56.106 router.training.local router

yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
yum install mysql-router mysql

```
