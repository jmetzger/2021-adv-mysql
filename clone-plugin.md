# Clone Plugin 

## Walkthrough

```
# On Joiner -> Server that shall get the clone 
# Plugin needs to loaded 
mysql> show plugins
# if not present install
mysql> install plugin clone soname 'mysql_clone.so'

# On Donor - server that provides clone 
# needs a user with 'BACKUP_ADMIN'
# Joiner: needs a 'CLONE_ADMIN'
# on Donor -> master 
create user cloneuser@'192.168.56.105' identified by 'your_Secret_pass';
grant backup_admin,clone_admin on *.* to cloneuser@'192.168.56.105';

# On Joiner -  test connection 
mysql -ucloneuser -p -h 192.168.56.105 
mysql> show grants 
```


## Prerequisites for cloning 

```
# on both systems these values must be identical 
# collation / character - the server stuff 
mysql> show variables like 'innodb_page_size';
+------------------+-------+
| Variable_name    | Value |
+------------------+-------+
| innodb_page_size | 16384 |
+------------------+-------+
1 row in set (0.00 sec)

mysql> show variables like 'innodb_data_file_path';
+-----------------------+------------------------+
| Variable_name         | Value                  |
+-----------------------+------------------------+
| innodb_data_file_path | ibdata1:12M:autoextend |
+-----------------------+------------------------+
1 row in set (0.00 sec)

mysql> show variables like 'max_allowed_packet';
+--------------------+----------+
| Variable_name      | Value    |
+--------------------+----------+
| max_allowed_packet | 67108864 |
+--------------------+----------+
1 row in set (0.01 sec)

mysql> show global variables like '%character%';
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8mb4                    |
| character_set_connection | utf8mb4                    |
| character_set_database   | utf8mb4                    |
| character_set_filesystem | binary                     |
| character_set_results    | utf8mb4                    |
| character_set_server     | utf8mb4                    |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+
8 rows in set (0.01 sec)

mysql> show global variables like '%collation%';
+-------------------------------+--------------------+
| Variable_name                 | Value              |
+-------------------------------+--------------------+
| collation_connection          | utf8mb4_0900_ai_ci |
| collation_database            | utf8mb4_0900_ai_ci |
| collation_server              | utf8mb4_0900_ai_ci |
| default_collation_for_utf8mb4 | utf8mb4_0900_ai_ci |
+-------------------------------+--------------------+
4 rows in set (0.01 sec)

mysql> select tablespace_name, file_name from information_schema.files where file_type like 'UNDO LOG';
+-----------------+------------+
| TABLESPACE_NAME | FILE_NAME  |
+-----------------+------------+
| innodb_undo_001 | ./undo_001 |
| innodb_undo_002 | ./undo_002 |
+-----------------+------------+
2 rows in set (0.00 sec)


```

## Increase Verbosity 

```
# on master - really important
# because you can see the progress and return-code: success -> 0 
mysql> set global log_error_verbosity=3 

# eventually on joiner - not tested output verbosity yet 
mysql> set global log_error_verbosity.de 

```

## Overview clone variables 

```
 show variables like '%clone%'
    -> ;
+-----------------------------+---------+
| Variable_name               | Value   |
+-----------------------------+---------+
| clone_autotune_concurrency  | ON      |
| clone_buffer_size           | 4194304 |
| clone_ddl_timeout           | 300     |
| clone_enable_compression    | OFF     |
| clone_max_concurrency       | 16      |
| clone_max_data_bandwidth    | 0       |
| clone_max_network_bandwidth | 0       |
| clone_ssl_ca                |         |
| clone_ssl_cert              |         |
| clone_ssl_key               |         |
| clone_valid_donor_list      |         |
+-----------------------------+---------+
11 rows in set (0.01 sec)


```

## Set compression on master (but takes cpu-load) 

```
# before cloning or in general 
set global clone_enable_compression = ON
```

## Setup donor list and start clone 

```
# on joiner 
mysql> set global clone_valid_donor_list = '192.168.56.103:3306'; 
mysql> show variables like 'clone_valid_donor_list';

mysql> CLONE INSTANCE FROM 'cloneuser'@'192.168.56.103':3306 identified by 'P@ssw0rd';

mysql> show variables like 'clone_valid_donor%';              
+------------------------+-------+
| Variable_name          | Value |
+------------------------+-------+
| clone_valid_donor_list |       |
+------------------------+-------+
 
```
