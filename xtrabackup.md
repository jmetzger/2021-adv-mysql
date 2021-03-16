# Xtrabackup with Centos/Redhat 

## Walkthrough 

```
xtrabackup --backup --target-dir=/backups/20210316
# Apply crash-recovery-log -> aka ib_logfile_1  
xtrabackup --prepare --target-dir=/backups/20210316
# Restore   
systemctl stop mysqld 
cd /var/lib
mv mysql mysql.bkup 
xtrabackup --copy-back --target-dir=/backups/20210316
chown -R mysql:mysql mysql 
# special selinux 
restorecon -r /var/lib/mysql
systemctl start mysqld 
```

## move-back with alternative datadir 

```
xtrabackup --copy-back --datadir=/var/lib/coolio --target-dir=/backups/20210316
```
