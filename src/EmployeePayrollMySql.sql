//MySQL queries for employee pay roll Service

//UC1-->
mysql> CREATE DATABASE payroll_service;
Query OK, 1 row affected (0.25 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
| world              |
+--------------------+
6 rows in set (0.00 sec)

mysql> select database();
+-----------------+
| database()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.00 sec)

mysql> use payroll_service;
Database changed

//UC2-->

mysql> Create Table employee_payroll
    -> (
    -> id int NOT NULL AUTO_INCREMENT,
    -> name VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (1.52 sec)

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.23 sec)

//UC3--->

mysql> insert into employee_payroll (name,salary,start) values
    -> ('Sanjay',30000,'2021-08-15'),
    -> ('Aviral',30000,'2021-06-21'),
    -> ('Prem',40000,'2021-03-22');
Query OK, 3 rows affected (0.08 sec)
Records: 3  Duplicates: 0  Warnings: 0

//UC4---->

mysql>  select * from employee_payroll;
+----+--------+--------+------------+
| id | name   | salary | start      |
+----+--------+--------+------------+
|  1 | Sanjay |  30000 | 2021-08-15 |
|  2 | Aviral |  30000 | 2021-06-21 |
|  3 | Prem   |  40000 | 2021-03-22 |
+----+--------+--------+------------+
3 rows in set (0.04 sec)

//UC5--->
mysql> select salary from employee_payroll where name='Sanjay';
+--------+
| salary |
+--------+
|  30000 |
+--------+
1 row in set (0.00 sec)

mysql>  select * from employee_payroll
    -> where start between cast('2019-01-01' as date) and date(now());
+----+--------+--------+------------+
| id | name   | salary | start      |
+----+--------+--------+------------+
|  2 | Sanjay |  30000 | 2021-08-15 |
|  3 | Aviral |  30000 | 2021-06-21 |
|  4 | Prem   |  40000 | 2021-03-22 |
+----+--------+--------+------------+
3 rows in set (0.04 sec)

//UC6-->
mysql> alter table employee_payroll add gender char(1) after name;
Query OK, 0 rows affected (3.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int          | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | char(1)      | YES  |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.15 sec)

mysql> update employee_payroll set gender = 'M' where name = 'Sanjay' or name = 'Aviral' or name = 'Prem';
Query OK, 3 rows affected (0.17 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from employee_payroll;
+----+--------+--------+--------+------------+
| id | name   | gender | salary | start      |
+----+--------+--------+--------+------------+
|  2 | Sanjay | M      |  30000 | 2021-08-15 |
|  3 | Aviral | M      |  30000 | 2021-06-21 |
|  4 | Prem   | M      |  40000 | 2021-03-22 |
+----+--------+--------+--------+------------+
3 rows in set (0.12 sec)

//UC7-->

mysql> select avg(salary) from employee_payroll where gender = 'M' group by gender;
+--------------------+
| avg(salary)        |
+--------------------+
| 33333.333333333336 |
+--------------------+
1 row in set (0.03 sec)
mysql> select avg(salary) from employee_payroll  group by gender;
+--------------------+
| avg(salary)        |
+--------------------+
| 33333.333333333336 |
|              35000 |
+--------------------+
2 rows in set (0.10 sec)

mysql> select gender, avg(salary) from employee_payroll  group by gender;
+--------+--------------------+
| gender | avg(salary)        |
+--------+--------------------+
| M      | 33333.333333333336 |
| F      |              35000 |
+--------+--------------------+
2 rows in set (0.00 sec)
mysql> select gender, COUNT(name) from employee_payroll  group by gender;
+--------+-------------+
| gender | COUNT(name) |
+--------+-------------+
| M      |           3 |
| F      |           1 |
+--------+-------------+
2 rows in set (0.02 sec)

mysql> select gender, sum(salary) from employee_payroll  group by gender;
+--------+-------------+
| gender | sum(salary) |
+--------+-------------+
| M      |      100000 |
| F      |       35000 |
+--------+-------------+
2 rows in set (0.00 sec)

UC-->

mysql> alter table employee_payroll add phone_number varchar(250) after name;
Query OK, 0 rows affected (2.46 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> desc employee_payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(150) | NO   |     | NULL    |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| gender       | char(1)      | YES  |     | NULL    |                |
| salary       | double       | NO   |     | NULL    |                |
| start        | date         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> alter table employee_payroll add department varchar(250) not null after phone_number;
Query OK, 0 rows affected (2.40 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(150) | NO   |     | NULL    |                |
| address      | varchar(250) | YES  |     | NULL    |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| department   | varchar(250) | NO   |     | NULL    |                |
| gender       | char(1)      | YES  |     | NULL    |                |
| salary       | double       | NO   |     | NULL    |                |
| start        | date         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
8 rows in set (0.02 sec)

mysql> alter table employee_payroll alter address set default 'KOLKATA';
Query OK, 0 rows affected (0.46 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(150) | NO   |     | NULL    |                |
| address      | varchar(250) | YES  |     | KOLKATA |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| department   | varchar(250) | NO   |     | NULL    |                |
| gender       | char(1)      | YES  |     | NULL    |                |
| salary       | double       | NO   |     | NULL    |                |
| start        | date         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
8 rows in set (0.05 sec)

UC9-->
mysql> alter table employee_payroll rename column salary to basic_pay;
Query OK, 0 rows affected (0.51 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------------+------------+--------+-----------+------------+
| id | name    | address | phone_number | department | gender | basic_pay | start      |
+----+---------+---------+--------------+------------+--------+-----------+------------+
|  2 | Sanjay  | NULL    | NULL         |            | M      |     30000 | 2021-08-15 |
|  3 | Aviral  | NULL    | NULL         |            | M      |     30000 | 2021-06-21 |
|  4 | Prem    | NULL    | NULL         |            | M      |     40000 | 2021-03-22 |
|  5 | Monisha | NULL    | NULL         |            | F      |     35000 | 2018-05-22 |
+----+---------+---------+--------------+------------+--------+-----------+------------+
4 rows in set (0.04 sec)

mysql> alter table employee_payroll
    -> add Deduction double not null after basic_pay,
    -> add TaxablePay double not null after Deduction,
    -> add IncomeTax double not null after TaxablePay,
    -> add NetPay double not null after IncomeTax;
Query OK, 0 rows affected (2.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
| id | name    | address | phone_number | department | gender | basic_pay | Deduction | TaxablePay | IncomeTax | NetPay | start      |
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
|  2 | Sanjay  | NULL    | NULL         |            | M      |     30000 |         0 |          0 |         0 |      0 | 2021-08-15 |
|  3 | Aviral  | NULL    | NULL         |            | M      |     30000 |         0 |          0 |         0 |      0 | 2021-06-21 |
|  4 | Prem    | NULL    | NULL         |            | M      |     40000 |         0 |          0 |         0 |      0 | 2021-03-22 |
|  5 | Monisha | NULL    | NULL         |            | F      |     35000 |         0 |          0 |         0 |      0 | 2018-05-22 |
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
4 rows in set (0.00 sec)

mysql> desc employee_payroll;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(150) | NO   |     | NULL    |                |
| address      | varchar(250) | YES  |     | KOLKATA |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| department   | varchar(250) | NO   |     | NULL    |                |
| gender       | char(1)      | YES  |     | NULL    |                |
| basic_pay    | double       | NO   |     | NULL    |                |
| Deduction    | double       | NO   |     | NULL    |                |
| TaxablePay   | double       | NO   |     | NULL    |                |
| IncomeTax    | double       | NO   |     | NULL    |                |
| NetPay       | double       | NO   |     | NULL    |                |
| start        | date         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
12 rows in set (0.03 sec)

UC10-->

mysql> select * from employee_payroll;
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
| id | name    | address | phone_number | department | gender | basic_pay | Deduction | TaxablePay | IncomeTax | NetPay | start      |
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
|  2 | Sanjay  | NULL    | NULL         |            | M      |     30000 |         0 |          0 |         0 |      0 | 2021-08-15 |
|  3 | Aviral  | NULL    | NULL         |            | M      |     30000 |         0 |          0 |         0 |      0 | 2021-06-21 |
|  4 | Prem    | NULL    | NULL         |            | M      |     40000 |         0 |          0 |         0 |      0 | 2021-03-22 |
|  5 | Monisha | NULL    | NULL         | Sales      | F      |     35000 |         0 |          0 |         0 |      0 | 2018-05-22 |
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
4 rows in set (0.13 sec)

mysql> insert into employee_payroll (name,phone_number,department,gender,basic_pay,Deduction,TaxablePay,IncomeTax,NetPay,Start) values
    -> ('Monisha',8794561231,'Marketing','F',300000,50000,30000,20000,200000,'2021-09-30');
Query OK, 1 row affected (0.20 sec)

mysql> select * from employee_payroll;
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
| id | name    | address | phone_number | department | gender | basic_pay | Deduction | TaxablePay | IncomeTax | NetPay | start      |
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
|  2 | Sanjay  | NULL    | NULL         |            | M      |     30000 |         0 |          0 |         0 |      0 | 2021-08-15 |
|  3 | Aviral  | NULL    | NULL         |            | M      |     30000 |         0 |          0 |         0 |      0 | 2021-06-21 |
|  4 | Prem    | NULL    | NULL         |            | M      |     40000 |         0 |          0 |         0 |      0 | 2021-03-22 |
|  5 | Monisha | NULL    | NULL         | Sales      | F      |     35000 |         0 |          0 |         0 |      0 | 2018-05-22 |
|  6 | Monisha | KOLKATA | 8794561231   | Marketing  | F      |    300000 |     50000 |      30000 |     20000 | 200000 | 2021-09-30 |
+----+---------+---------+--------------+------------+--------+-----------+-----------+------------+-----------+--------+------------+
5 rows in set (0.12 sec)