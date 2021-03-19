# Upgrade from MySQL 5.7 -> MySQL 8.0 (Centos/Redhat 8) 

## Step 1: For lab - starting with installing MySQL 5.7.

```
# As mysql 5.7. is not present in Centos 8 repo-rpm -file
# Use the one for Centos 7 
yum install https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

#
```
## Step 2: Uninstall old repo and install new repo 

```
yum remove https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
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

