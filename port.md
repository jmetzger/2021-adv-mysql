# Change port on Centos / Redhat (SELinux) 

```
# Walkthrough 
/etc/my.cnf 
port=13306 

# Change port in selinux
# this will be persistent across reboots
semanage port -a -t mysqld_port_t -p tcp 13306

# Errors can be found in 
# /var/log/audit/audit.log

systemctl restart mysqld 
