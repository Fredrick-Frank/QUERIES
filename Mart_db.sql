create database  Mart;
use Mart;
#creating the table 'customers':
create table customers ( customers_id int, primary key (customers_id), customers_phone_NO int, customers_purchase_NO int,
customers_email_address varchar (25), customers_marital_status varchar (25), customers_Geolocation varchar (25),
customers_home_address varchar (25),  customers_birthday datetime (6), customers_Name varchar (30));

#creating the table 'product':
create table product (product_id int, product_purchase_No int, customer_Name varchar (25), 
product_price int, product_Name varchar (25), product_quality varchar (25), 
product_quantity int, product_order varchar (25), product_in_store varchar (30));

#creating the table 'Order'
create table orders (order_id int, order_name varchar (25), 
order_invoice int, quantity int, price_on_order int, order_purchased_NO int, 
order_returned varchar (30),order_delivered varchar (30));

select * from customers; 

#inserting the values into the customers table:
insert into customers values ( 001, 081239, '0001', 'felixjohn@gmail.com', 'M', 'North-East','North Side Coast',
'1998-01-23', 'felix john');
insert into customers values ( 002, 081623, '0002', 'faithjohn@gmail.com', 'M', 'South-East','Coast Side Coast',
'1998-01-23', 'faith john');
insert into customers values (003, 081343,'0003','lewisjack@outlook.com','F',
 'East-coast','Dallas City','1992-03-21', 'Lewis Jack');
insert into customers values (004, 081234,'0004','pauldonald@gamil.com','M',
'Atlanta','New York','1993-04-23','paul donald');

update customers 
set customers_phone_NO = 81333, customers_email_address = 'faithjohn@gmail.com'
where customers_id = 2;

create table orders (order_id int, order_name varchar (25), 
order_invoice int, quantity int, price_on_order int, order_purchased_NO int, 
order_returned varchar (30),order_delivered varchar (30));

#inserting the values into the order table:
insert into orders values ('1', 'provision', 1234, 50, 20000, '9999','No return',
'Successful');
insert into orders values ('2', 'fruits', 1235, 200, 2000, '9998','NO returned',
'Successful');
insert into orders values ('3', 'Cereals', 1236, 100, 1000, '9997','No return',
'Successful');
insert into orders values ('4', 'Baby_Wears', 1237, 60, 1500, '9996','Returned',
'Unsuccessful');
insert into orders values ('5', 'Egg', 1238, 50, 30000, '9995','NO return',
'Successful');
insert  into orders values ('6', 'cosmetics', 1239, 40, 25000, '9994', 'No return',
'Successful');
insert  into orders values ('7', 'grocery', 1240, 100, 35000, '9993', 'No return',
'Successful');
insert  into orders values ('8', 'diet', 1241, 250, 25000, '9992', 'Returned',
'Unsuccessful');
insert  into orders values ('9', 'beverages', 1242, 330, 40000, '9991', 'No return',
'Successful');
insert  into orders values ('10', 'cakes', 1243, 450, 5000, '9990', 'Returned',
'Unsuccessful');


#fetch all the table
select * from orders;

create table product (product_id int, product_purchase_No int, customer_Name varchar (25), 
product_price int, product_Name varchar (25), product_quality varchar (25), 
product_quantity int, product_order varchar (25), product_in_store varchar (30));


#inserting into the product table
insert into product values (1, 2345, 'felix john', 300, 'Food Items', 60, 1000, 8888, 'Available');
insert into product values (2,2346, 'Lewis Jack', 320, 'HouseHold Items', 75, 200, 8887,'Not Available');
insert into product values (3,2347,'Bruno James', 321,'Electronics',80,300,8886, 'Availale');
insert into product values (4,2348,'Victoria James',500, 'Phone Accessories',45,550,8885,'Available');
insert into product values (5,2349,'Fredrick Joel',1000,'Electric Filter',55,600,8884,'Available');
insert into product values (6,2350,'Fred',1000,'Electric Filter',55,600,8883,'Available');
insert into product values (7,231,'Jerry',2500,'Soda',97,540,8882,'Not Avaiable');
insert into product values (8,2351,'drick Joel',1000,'Electric Filter',55,60,8884,'Available');
insert into product values (9,2351,'Joseph Bold',2321,'Toys',60,890,8885,'Not Available');
insert into product values (10,2349,'Fredrick Joel',1000,'Electric Filter',55,600,8898,'Not Available');

#fetching the tables
select * from product;
select * from customers;
select * from orders;

#data manipulation:
select count(distinct customers_Name) from customers; 
select count(distinct product_in_store) from product;
select count(distinct price_on_order) from orders;

select product_id, product_Name, customer_Name
from product 
where product_id = 3;

select * from product
where product_quality > 60; #the use of an operator

select * from product
where product_quality between 40 and 100;

select * from product 
where customer_Name like 'J%'; #filtering the letter with the first letter J

select * from customers
where customers_home_address in ('USA','London'); #using the 'IN' operator

#AND, OR , NOT
select order_name, order_invoice, quantity
from orders
where order_name = 'fruits' and order_invoice = 1235 and quantity = 200; #note: when using the and operator, the columns should align 

select order_name, order_invoice, quantity
from orders
where order_name = 'fruits' or order_invoice = 1235 or quantity = 200;

select order_name, order_invoice, quantity
from orders
where not quantity = 100000;  #to verify if the the record is ture

select * from orders
where not order_name = 'fruit'; 

select customers_Name, customers_home_address
from customers
order by customers_phone_No, customers_marital_status desc;


select customers_phone_No, customers_marital_status 
from customers
order by customers_Name, customers_home_address desc;

select * from customers
order by customers_phone_No, customers_marital_status; 

select customers_phone_No from customers
where customers_phone_No is not null;


select * from customers
limit 4; #fetching a specific number fro the dataset

select min(customers_phone_No) as minimum_phone_no
from customers;

select max(customers_phone_No) as maximum_phone_no
from customers; 

select max(quantity) as LargestQuantity
from orders;

select count(product_price) 
from product
where product_Name = 'Soda'; 

select count(product_price) 
from product;

select avg(product_price)
from product;

select abs(product_price)
from product;

select sum(product_price)
from product;

select * from orders
where  order_name like 'e%';

select price_on_order, order_invoice
from orders
where price_on_order in (order_delivered);

select quantity, order_name, price_on_order
from orders
where quantity between 300 and 1000;

select * from orders
where quantity between 300 and 1000; #selcts all the values that falls btw 300 & 1000

select * from orders
where quantity between 300 and 1000 and order_id not in (1,2,3); #sorts the values excluding from 1,2, and 3.

select * from orders
where quantity between 300 and 4000 order by order_name;

#joins are used to combine rows from two or more tables with a common or related columns.
select customers_name
from customers
inner join product
on customers.customers_Name = product.customer_name;

select customers_home_address, customers_marital_status
from customers
left join product
on customers.customers_home_address = 
product.product_quantity;

#creating stored procedures
delimiter //
create procedure ALLCUSTOMERS()
begin 
       select * from customers;
end //
delimiter ;

call ALLCUSTOMERS();

show procedure status; #checking all the created stored procedure

delimiter //
create procedure ALLPRODUCTS()
begin 
        select * from product;
end //
delimiter ;

delimiter //
create procedure ALLORDERS()
begin 
     select * from orders;
end //
delimiter ;

#adding index
create table product_visibility(intensity_of_product int not null,
product_durability int not null,
product_expiration_date varchar (25),
index (intensity_of_product, product_durability));

insert into product_visibility values (25, 10, '1 week');
insert into product_visibility values (30,5, '4 weeks');
insert into product_visibility values (10,9,'5 weeks');
insert into product_visibility values (35,5,'4 weeks');
insert into product_visibility values (40,9,'10 weeks');
insert into product_visibility values (50,99,'52 weeks');
insert into product_visibility values (30,5,'14 weeks');
insert into product_visibility values (20,10,'18 weeks');
insert into product_visibility values (25,8,'4 weeks');

select * from product_visibility;

create index product_name on product(product_Name);

explain select * from product
where product_name = 'product_Name'; #the explain helps to show the internally performance of the query

#to view the indexes in a table in a database:
show indexes from product;
show indexes from product_visibility;

create view customer_product
as 
select 
      customers_id, 
      customers_phone_NO, 
      customers_purchase_NO, 
	  customers_email_address, 
      customers_marital_status
from customers
inner join 
product using (customers_name); #created a view 

select * from customer_product; #extracting using the view

#creating triggers
create trigger TRIGGER_CUSTOMERS
before update on customers
for each row
insert into product_visibility
set action = 'update',
    customers_Name = new.customers_Name,
    customers_purchase_NO = now();
    
show triggers;

select * from product_visibility;

