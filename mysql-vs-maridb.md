# MySQL vs. MariaDB 

## Cluster 

```
MariaDB (im Bauch) - im Repo:
=============================
2007: 
Galera Cluster (virtuell synchrone Cluster) 
--> Auto-Provisioning -> Node konfigurieren -> dann holt sie sich die Daten selbst

MySQL - im Repo:
================
viel, viel später:
Group Replication (=Cluster) 

aber: es gibt auch eine binary von codership - mit galera cluster 
```

## Features 

  * Welche Features brauche ich .

## Spezielle Features von MariaDB 

  * Flashback (auf älteren Datenstand gehen ohne komplettes neues Backup + PIT - Recovery.
  * Encryption 

## Speziele von MySQL 

  * Persistent settings of variables 
  * Spezielle Tools (mysql_repl) 

## Unterschiede sind 

  * Implementierungen ändern sich (z.B. mariadb -> user -> views) 
 
## MariaDB 

  * MaxScale + MariaDB Galera Cluster 

