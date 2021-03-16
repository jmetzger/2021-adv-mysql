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


