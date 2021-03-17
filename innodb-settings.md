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

## should be able to hold one commit 

```

## innodb_log_file_size 

```
# Should hold work load of 120 minutes 
```

* https://www.percona.com/blog/2008/11/21/how-to-calculate-a-good-innodb-log-file-size/


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

## innodb_flush_method  

```
#### Linux 
O_DIRECT 
# use only on linux,
# can increase performance 

## Do not use  or be critical about it 
O_DIRECT_NOI_FSYNC

#### Windows 

# no need to change, because O_DIRECT does not work 
```
