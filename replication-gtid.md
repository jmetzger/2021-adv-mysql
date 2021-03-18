# Replication (Setup) with GIT 


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
