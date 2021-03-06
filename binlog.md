# binlog 

## Key Facts 

```
show variables like '%log_bin%';
# set in configuration 
log_bin 
# changed during session for not logging actions in session to binlog 
sql_log_bin 
```

## show master status 

```
# at which position is the master currently 
show master status 
```

## when using slave potential master .... 

```
# on by default on mysql 8 
# off by default on mysql 5.7 
log_slaves_updates = on 

# this must be on, if you want to use slave as master later
# alle update from master are logged to binary of slave if log-bin=on 
```

## Disable binary logging 

```
# /etc/my.cnf 
[mysqld]
skip-log-bin 
# or
# disable-log-bin 

## Restart
# systemctl restart mysqld 
# now master is empty
mysql>show master status 

```

## binlog_format 

```
# STATEMENT 
# The direct statement will be used 
# e.g. INSERT INTO actors (first_name, last_name) values ('hans','mustermann')

# MIXED
# Server decides if to use STATEMENT or ROW for each sql - statement 

# ROW 


```

## Workaround for tail -f ;o) for binlog 

```
mysqlbinlog -vvv -R -t --stop-never binlog.00000

```

## mysqlbinlog with date 
```
mysqlbinlog --stop-datetime="2021-03-15 15:23" binlog.000012
```

## mysqlbinlog over multiple binlogs 

```
mysqlbinlog -vvv --stop-position=465 binlog.000010 binlog.000011 binlog.000012 > /usr/recovery.sql 
```

## Ref: 

https://dev.mysql.com/doc/refman/8.0/en/replication-options-binary-log.html
