# Replication (Setup) with GIT 

## On master setup settings

```
mysql>set persist server_id=1;
mysql>set persist_only gtid_mode=ON
mysql>set persist_only enforce_gtid_consistency=true; 
mysql>restart;
```

## Setup replication user 

```
create user 'repl'@'%' identified by 'mysecrectpass' require ssl;
grant replication slave on *.* to 'repl'@'%' 
```


## On Slave use clone plugin

  * See entry in this documentation 

## On Slave 

```
mysql>set persist server_id=2;
mysql>set persist_only gtid_mode=ON
mysql>set persist_only enforce_gtid_consistency=true; 
mysql>restart

set persist server_id=2;
set persist_only gtid_mode=ON;
set persist_only enforce_gtid_consistency=true; 
restart;

```

## Now setup master-connection-config 

```
change master to master_host='192.168.56.103',
master_user='repl',master_password='mysecretpass',
master_auto_position=1, master_ssl = 1;
start slave; 
show slave status \G
```
