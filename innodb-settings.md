# InnoDB - Settings 

## innodb_buffer_pool_size 

```
# how big is it ?
show variables like 'innodb_buffer%';

# 70-80% of memory of system
# evaluate with 
show engine innodb status
pager grep -i 'free buffers'
show engine innodb status 
pager 
```

## innodb_log_buffer_size 

```
# how big is it ? 
show variables like 'innodb_log_buffer%'
```

## innodb_flush_trx_commit 

```
# Defaults to 1 
# flush from log_buffer to log 
# after every commit 
# ACID compliant

# Only set to 0 or 2 if you are willing to loose 1 second of data
# in case of Stand-Alone and Master-Slave 

# On group-replication / galera cluster
# 0 <- is safe because of virtuell synchronisation 
```



