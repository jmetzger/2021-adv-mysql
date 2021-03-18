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
