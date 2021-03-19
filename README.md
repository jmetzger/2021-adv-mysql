# Advanced MySQL 15.03. - 19.03.2021 

## Agenda 

  1. Installation 
     * [Installation with tar-bundle Centos 8/Redhat 8](/installation/mysql8-tar-bundle.md)
     * [Installation from centos8/centos7](/installation/repo.md)
     * [Login ohne passwort - mysql-client](mysql-login.md) 
     * [Login with --login-path](mysql-loginpath.md)
     * [Using HashiCorp-Vault for Authentication](https://www.vaultproject.io/docs/secrets/databases)

  1. Configuration 
     * [Port change on Centos/Redhat](port.md)

  1. Binlog - Management
     * [Binlog](binlog.md) 

  1. Backup and Restore 
     * [Best Practice mysqldump](mysqldump.md) 
     * [Point-In-Time-Recovery](pit.md) 
     * [mysqlbackup - MySQL Enterprise Backup](mysqlbackup.md)
     * [xtrabackup 8 with Centos/Redhat](xtrabackup.md)

  1. Variablen 
     * [Use-Cases Variables](variables.md) 

  1. MariaDB vs. MySQL 
     * [Comparing MySQL vs. MariaDB](mysql-vs-maridb.md) 

  1. Performance (InnoDB) 
     * [Important Configuration Settings-Innodb](innodb-settings.md)

  1. Tools 
     * [Install percona toolkit - Centos/Redhat 8](percona-toolkit-centos.md)
     * [Percona Monitoring and Slow Queries GUI](pmm-percona.md) 

  1. Indexes und slow query log  
     * [slow query log](slow-query-log.md)  
     * [Function Index](functional-index.md) 

  1. Replication 
     * [show slave hosts/show replicas](slaves.md) 
     * [clone-plugin](clone-plugin.md) 
     * [Setup Replication with GTID](replication-gtid.md)
     * [Installation Master-Slave with mysqlsh - mysql-shell](replication-setup-mysqlsh.md) 
     * [ReplicaSet - Troubleshoot](replicaset-troubleshooting.md)

  1. Group Replication/InnoDB Cluster 
     * [group replication](group-replication.md) 
     * [innodb_cluster](innodb-cluster.md) 

  1. Upgrade / Update 
     * [Upgrading from 5.7 to 8.0](upgrade57-80.md)
 
  1. Documentaton 
     * [MySQL Performance pdf](http://schulung.t3isp.de/documents/pdfs/mysql/mysql-performance.pdf)
     * [Incompabilities from MySQL 8 to MariaDB 10.5](https://mariadb.com/kb/en/incompatibilities-and-feature-differences-between-mariadb-105-and-mysql-80/)
     * [multiple Bind-address starting from 8.0.13](https://mysqlserverteam.com/the-bind-address-option-now-supports-multiple-addresses/)
     * [pdf linux-security - selinux chapter](http://schulung.t3isp.de/documents/linux-security.pdf)
     * [linux selinux type statements](https://selinuxproject.org/page/TypeStatements)
     

