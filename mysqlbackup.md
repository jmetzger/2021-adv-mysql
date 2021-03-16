# MySQLBackkup 

## Walkthrough 

```
# Download von mysqlbackup 
## Step 1 
# File auf ssh-server runterlasen (MySQL 2) und installieren
sudo su -
cd /usr/src 
unzip V1006234-01.zip
rpm -i mysql-commercial-backup-8.0.23-1.1.el8.x86_64.rpm

## Step 2 
# Backup durchführen 
mysqlbackup --user=root --password --host=127.0.0.1 --backup-image=/backups/my.mbi \
  --backup-dir=/backups/backup-tmp  backup-to-image
echo $? # 0 is success 

## Step 3  
mysqlbackup --backup-image=/backups/my.mbi validate
echo $? 

## Step 4
# systemctl stop mysqld 
cd /var/lib/
mv mysql mysql.bkup 
## backup-tmp-back needs to be empty 
mysqlbackup --backup-image=/backups/my.mbi --backup-dir=/backups/backup-tmp-back copy-back-and-apply-log
chown -R mysql:mysql /var/lib/mysql
systemctl start mysqld 

```
