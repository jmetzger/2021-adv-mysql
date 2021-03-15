# Installation on Centos8/MySQL 8 with tar-bundle 

## Steps, if there is not outside connection Linux Machine to MySQL repo or internet 

```
# Step 1: Download bundle to your local machine 
https://dev.mysql.com/downloads/mysql/

# Step 2: Download winscp 
# just google 

# Step 3: Transfer bundle to server with winscp 

# Step 4: untar folder 

# Step 5: change into folder and install necessary files 
cd /home/kurs 
sudo yum install mysql-community-{server,client,common,libs}-*

```

## Ref: 

https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/linux-installation-rpm.html
