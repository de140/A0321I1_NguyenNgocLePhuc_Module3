create database demo_1;
use demo_1;
create table users(
	id int(3) not null auto_increment,
    name varchar(120) not null,
    email varchar(220) not null,
    country varchar(120),
    primary key(id)
);
insert into users(name,email,country) values('Phuc','phucnnlde140045@fpt.edu.vn','Viet Nam');
insert into users(name, email, country) values('Kien','kienhq@fpt.edu.vn','Viet Nam');

drop database th_demo;