# mysql (--loginpath)

## Walkthrough - Default (client)  

```
# Step 1: Eventually Set/Change password 
mysql>alter user root@localhost identified by 'MYSECRETPASS'
mysql>quit
# set pass in loginpath 
# in this case if not set loginpath is 'client' 

# Step  2: set password for client use
# Set the same pass as set above 
[root@localhost ~]# mysql_config_editor set --user=root --password

# Step 3: use it 
# Feel happy using / pass will be taken from:
[root@localhost ~]# ls -la /root/.mylogin.cnf 
[root@localhost ~]# mysql 

```


## Walkthrough - loginpath=admin (client)  

```
# Step 1: Eventually Set/Change password 
mysql>alter user admin@localhost identified by 'MYSECRETPASS'
mysql>quit
# set pass in loginpath 
# in this case if not set loginpath is 'client' 

# Step  2: set password for client use
# Set the same pass as set above 
[root@localhost ~]# mysql_config_editor set --loginpath=admin --user=root --password

# Step 3: use it 
# Feel happy using / pass will be taken from:
[root@localhost ~]# ls -la /root/.mylogin.cnf 
[root@localhost ~]# mysql --loginpath=admin
```

## Side - Notes (file is not encrypted but obfuscated) 

  * https://jira.mariadb.org/browse/MDEV-20665
  * https://mariadb.com/kb/en/mysql_config_editor-compatibility/

## Ref:

  * https://dev.mysql.com/doc/refman/8.0/en/mysql-config-editor.html
