# Point-Time-Recovery 

## Walkthrough 

```
# Prerequisites dump from midnight 
/usr/src/all-databases.sql 

# Step 1: find out from where to start from last backup 
# master-data=2 --> CHANGE MASTER TO - Line 

# Step 2: test with mysqlbinlog e.g. pos 645 
mysqlbinlog -vvvv --stop-position=645 binlog.000010 

# Step 3: create recovery.sql 
mysqlbinlog -vvvv --stop-position=645 binlog.000010 > /usr/src/recovery.sql 

# Step 4: import all-databases, then recovery.sql
cd /usr/src
mysql < all-databases.sql 
mysql < recovery.sql 
```
 
