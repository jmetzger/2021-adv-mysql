# Variables 

# Select into 

```
select first_name,last_name from actor where actor_id = 1;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| PENELOPE   | GUINESS   |
+------------+-----------+
1 row in set (0.00 sec)

mysql> select first_name,last_name into @vorname,@nachname from actor where actor_id = 1;
Query OK, 1 row affected (0.00 sec)

mysql> select @vorname;
+----------+
| @vorname |
+----------+
| PENELOPE |
+----------+
1 row in set (0.00 sec)

mysql>

```

# Variables can only be used for field-values 

```
## This does not work 

mysql> set @tabellenname='actor'
mysql> insert into @tabellenname (first_name,last_name) values ('a','b');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '@tabellenname (first_name,last_name) values ('a','b')' at line 1
mysql> insert into concat(@tabellenname,'') (first_name,last_name) values ('a','b');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '@tabellenname,'') (first_name,last_name) values ('a','b')' at line 1
mysql> select concat(@tabellenname,'');
+--------------------------+
| concat(@tabellenname,'') |
+--------------------------+
| actor                    |
+--------------------------+
1 row in set (0.00 sec)


mysql> set @feld='last_name';
Query OK, 0 rows affected (0.00 sec)

mysql> insert into tabellenname (@feld, first_name) values ('a','b');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '@feld, first_name) values ('a','b')' at line 1
mysql> insert into tabellenname (last_name, first_name) values (@feld,'b');
ERROR 1146 (42S02): Table 'sakila.tabellenname' doesn't exist
```

```
# THIS DOES WORK 
mysql> insert into actor (last_name, first_name) values (@feld,'b');
Query OK, 1 row affected (0.00 sec)

mysql> insert into @tabellenname (last_name, first_name) values (@feld,'b');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '@tabellenname (last_name, first_name) values (@feld,'b')' at line 1

```


