# Installation on Centos8/MySQL 8 with tar-bundle 

## Steps, if there is not outside connection Linux Machine to MySQL repo or internet 

```

# Step 1: Download bundle to your local machine 
https://dev.mysql.com/downloads/mysql/

# Step 2: Download winscp 
# just google 

# Step 3: Transfer bundle to server with winscp 


# Step 4: mv tar and untar folder 
sudo su - 
mv /home/kurs/mysql-8.0.23-1.el8.x86_64.rpm-bundle.tar /usr/src
cd /usr/src 
mkdir mysql-install
cd mysql-install
tar xvf ../mysql-8.0.23-1.el8.x86_64.rpm-bundle.tar

# Step 5: change into folder and install necessary files 
yum install mysql-community-{server,client,common,libs}-*

```

## Ref: 

https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/linux-installation-rpm.html
