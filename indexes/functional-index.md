# Functional Index (Starting from MySQL 8) 

## Walkthrough 

```
use sakila;
create index idx_func_upper_last_name on actor ((upper(last_name)));
mysql> explain select * from actor where UPPER(last_name) = 'Akroyd';
+----+-------------+-------+------------+------+--------------------------+--------------------------+---------+-------+------+----------+-------+
| id | select_type | table | partitions | type | possible_keys            | key                      | key_len | ref   | rows | filtered | Extra |
+----+-------------+-------+------------+------+--------------------------+--------------------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | actor | NULL       | ref  | idx_func_upper_last_name | idx_func_upper_last_name | 183     | const |    3 |   100.00 | NULL  |
+----+-------------+-------+------------+------+--------------------------+--------------------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

```
