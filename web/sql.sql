create table wanted(name varchar(40),age varchar(20),crime varchar(35),date varchar(20));
create table complaint(name varchar(40),email varchar(40),phone varchar(15),subject varchar(20),message varchar(40));
create table contactus(name varchar(40),email varchar(50),occupation varchar(25),phone varchar(15),subject varchar(20),message varchar(50));
create table prisoner(name varchar(35),age varchar(20),criminal varchar(30),datein varchar(20),dateout varchar(20));
create table users(username varchar(40) primary key,name varchar(20),email varchar(50),password varchar(25),cpassword varchar(25));