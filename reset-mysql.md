# Reset MySQL 

## Walktrough 

```
# Server does not start 
cp -a /var/lib/mysql /var/lib/mysql.bkup 
cd /var/lib
mkdir mysql
chown mysql:mysql mysql
# for se linux
restorecon -r /var/lib/mysql 
# start server 
systemctl start mysqld 
```

## Set root user 

```
alter user root@localhost identified by 'my_new_passwort
```
