create database Assignment4
use Assignment4

--1.
create table Book(id int identity(1,1) primary key , title varchar(max), author varchar(max), isbn numeric(20,0) unique, published_date datetime)
insert into tblBook values ('My First SQL book', 'Mary parker',1363636224,'2012-02-22 12:08:17.260'),('My Second SQL book', 'John Mayer',5428570112,'1972-02-22 12:08:17.260'),
('My Third SQL book', 'Cary Flint',1641777152,'2015-02-22 12:08:17.260')

select * from Book where author like '%er'

--2.
create table Review(id int identity(1,1) primary key, book_id int foreign key references Book(id), reviewer_name varchar(20), content varchar(max), rating numeric(10), published_date datetime)

select * from Review

insert into Review values (1, 'John Smith', 'First review of john',1,'2012-02-22 12:08:17.260'),(2,'John Smith', 'Second review',4,'1972-02-22 12:08:17.260'),
(3,'Alice waker', 'Third review',5,'2015-02-22 12:08:17.260')

select title, author, reviewer_name as 'reviewer name' from Book, Review where Book.id = Review.book_id

--3.
select reviewer_name from Review group by reviewer_name having count(reviewer_name) > 1

--4.
create table Customer(id int identity(1,1) primary key, name varchar(20),  age numeric(4), address varchar(max), salary numeric(10))
select name from Customer where address like '%o%'

--5.
create table tblOrder(int int identity(1, 1)primary key, odr_date date, customer_id int foreign key references Customer(id), amount numeric(10))
select count(*) ' Total number of customers placed on same date ', odr_date 'order date' from Customer c1 join tblOrder o1 on c1.id = o1.customer_id group by odr_date having count(*) > 1
--6.
create table Employee(empId int primary key,empName varchar(30),age int,empAddress varchar(30),salary float)

insert into Employee values(1,'Ramesh',32,'Ahmedabad',2000.00),(2,'Khilan',25,'Delhi',1500.00),(3,'Kaushik',23,'Kota',2000.00),(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),(6,'Komal',22,'MP',null),(7,'Muffy',24,'Indore',null)
 select Lower(empName) from Employee where salary is null


 --7
create table StudentDetails(registerNo int primary key,studName varchar(30),age int,qualification varchar(10), mobileNo bigint,mail_id varchar(50),loc varchar(30),gender varchar(2))
select * from StudentDetails

insert into StudentDetails values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

select gender,count(gender) from StudentDetails group by gender

--8
create table CourseDetails(cId varchar(20) primary key,cName varchar(30), startDate date,endDate date,fee float)

select * from CourseDetails

insert into CourseDetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),('JC001','CoreJava','2018-01-02','2018-01-12',3000)

create table CourseRegistration(registerNo int references StudentDetails(registerNo),cId varchar(20) references CourseDetails(cId),batch varchar(5)primary key(registerNo,cId))

select * from CourseRegistration

insert into CourseRegistration values(2,'DN003','FN'),(3,'DV004','AN'),(4,'JA002','FN'),(2,'JA002','AN'),(5,'JC001','FN')

select cd.cId, cName, count(registerNo) as 'Student Count' from CourseDetails cd join CourseRegistration cr on cd.cId = cr.cId group by cName, cd.cId order by cd.cId desc

--9.
create table Customer1(cId int primary key,firstName varchar(30),lastName varchar(30))
insert into Customer1 values(1,'George','Washington'),(2,'John','Adams'),(3,'Thomas','Jefferson'),(4,'James','Madison'),(5,'James','Monroe')

select * from Customer1

create table Order1(orderId int primary key,orderDate date,amount float,customerId int)

insert into Order1 values(1,'1776-07-04',234.56,1),(2,'1760-03-14',78.50,3),(3,'1784-05-23',124.00,2),(4,'1790-08-03',65.50,3),(5,'1795-07-21',25.50,10),(6,'1787-11-27',14.40,9)

select * from Order1

select firstName, lastName from Customer1 c join Order1 o on c.cId = o.customerId group by firstName, lastName having count(customerId) = 2
--10.

select studName, Upper(loc) from StudentDetails order by studName desc


--11
create table Order2(ordId int primary key,orderDate date,orderNumber int,customerId int,totalAmount float)

create table Product(prodId int primary key,productName varchar(20),supplierId int,unitPrice float,package float,isDiscontinued bit)

create table OrderItem(id int primary key,orderId int references Order2(ordId),productId int references Product(prodId),unitPrice float,quantity int)

create view productOrderView as select productName, quantity, orderNumber from Product p join OrderItem oi on p.prodId = oi.productId join Order2 o on o.ordId = oi.orderId

select * from productOrderView

--12
select studName, cName from StudentDetails sd join CourseRegistration cr on cr.registerNo = sd.registerNo join CourseDetails cd on cd.cId = cr.cId where studName ='Nisha'



