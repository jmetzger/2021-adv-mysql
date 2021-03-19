# Upgrade from MySQL 5.7 -> MySQL 8.0 (Centos/Redhat 8) 

## Step 1: For lab - starting with installing MySQL 5.7.

```
# As mysql 5.7. is not present in Centos 8 repo-rpm -file
# Use the one for Centos 7 
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

# disable mysql from centos repo
dnf remove @mysql
dnf module reset mysql && dnf module disable mysql
dnf config-manager --disable mysql80-community
dnf config-manager --enable mysql57-community
yum install mysql-community-server 

# 
systemctl start mysqld
# get temporary pass
cat /var/log/mysqld.log | grep temp
mysql -p
# Change pass in mysql 
mysql>alter user root@localhost identified by 'mysecretpass'
mysql_config_editor set --user=root --password
```

## Step 1b (Optiona): Install sakila

```
yum install wget 
cd /usr/src 
wget https://downloads.mysql.com/docs/sakila-db.tar.gz
tar xzvf sakila-db.tar.gz 
cd sakila-db 
mysql < sakila-schema.sql
mysql < sakila-data.sql 

```

## Step 2: Uninstall old repo and install new repo 

```
yum remove mysql80-community-release
yum install https://dev.mysql.com/get/mysql80-community-release-el8-1.noarch.rpm
```

## Step 3: Install MySQL 8 - Shell 

```
yum install mysql-shell
```

## Step 4: Run checks 

```
mysqlsh 
JS> shell.connect('root@localhost')
JS> util.checkForServerUpgrade({configPath: '/etc/my.cnf'})
```

## Step 5: Create Backup of Data with mysqldump 

```
mysqldump --all-dabases > /usr/src/dump57.sql
echo $? # Was dump succesful 
```

## Step 6:

```
# stop server 
systemctl stop mysqld 
# uninstall server 
yum list installed | grep mysql 
yum remove mysql-community-server 

# Install new mysql 8 server 
# works because we already have the new repo in place 
yum install mysql-community-server 

# now start the new server and see, if it will come up
# this will be an INPLACE update, which is recommended by MySQL 
# if everything works well the system will come up again 
systemctl start mysqld 

# look into the logs and status if mysqld is ready
tail /var/log/mysqld.log 
systemctl status mysqld 
```

