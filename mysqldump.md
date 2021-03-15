# mysqldump - best practice 

##  best practice mysqldump

```
# important to dump --event and --routines starting from
# mysql 8, because they are not part of mysql-tables anymore

# flush-logs - create new binlog after dump -> good for pit (Point-In-Time - Recovery) 
# master-data = 2 (2 means comment) 
#
mysqldump --all-databases --flush-logs --master-data=2 --routines --events > /usr/src/all-databases.sql
```

## Also delete old logs after mysqldump (not for master-slave) 

```
mysqldump --delete-master-logs --all-databases --flush-logs --master-data=2 --routines --events > /usr/src/all-databases.sql

```

## use transaction -> for dumping 

```
mysqldump --single-transactions --delete-master-logs --all-databases --flush-logs --master-data=2 --routines --events > /usr/src/all-databases.sql
```
