create database demo;

create table Products(
	id int auto_increment not null,
    productCode varchar(15) not null,
    productName varchar(50) not null,
    productPrice double not null,
    productAmount int not null,
    productDescription varchar(250),
    productStatus varchar(50),
    primary key(id)
);
insert into Products(productCode,productName,productPrice,productAmount) values
('SH01','addidas',1313102,5),
('SH02','nike',2014521,5),
('SH03','gucci',1216464,5),
('SH04','converse',456464,5),
('SH05','sneaker',50000,5);
-- B3
-- create unique
alter table Products add index index_productCode(productCode);
-- create composite index
alter table Products add index index_name_price(productName,productPrice);
-- use sql to check how to sql statement excute
explain select * from Products;
-- B4
-- create view to get info code, name, price, status
create view products_view as
select productCode, productName, productPrice, productStatus
from Products;
select * from products_view;
-- Edit view
create or replace view products_view as
select productCode, productName, productPrice, productStatus
from Products
where productName='sneaker';
select * from products_view;
-- delete view
-- drop view products_view;
-- B5
-- create store procedure to get all info
delimiter //
create procedure findAllProducts()
begin 
	select * from Products;
end //
delimiter ;
call findAllProducts();
-- create store procedure to add new products
delimiter //
create procedure insertProducts()
begin 
	insert into Products(productCode,productName,productPrice,productAmount) values
	('SH07','sandal',1200000,10);
end //
delimiter ;
call insertProducts();
select * from Products;
-- edit products follow id
delimiter //
create procedure updateProducts(in id int, in product_name varchar(50))
begin 
	update Products
    set Products.productName=product_name
    where Products.id= id;
end //
delimiter ;
call updateProducts(3,'boston');
select * from Products;
-- create store procedure to delete follow id
delimiter //
create procedure deleteProducts(in id int)
begin 
	delete Products
    from Products
    where Products.id= id;
end //
delimiter ;
call deleteProducts(1);
select * from Products;
