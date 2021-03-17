# Slow query log 

## Activation 

```
mysql> set global slow_query_log = on 
-- in seconds 
mysql> set global long_query_time = 0.01 
-- log sql - staments that have no index
mysql> set global log_queries_not_using_indexes = ON

```
