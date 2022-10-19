
-- 2
create table Companies(
	Code varchar(20) primary key,
	Name nvarchar(255) not null unique,
	Address nvarchar(255) not null,
	PhoneNumber	varchar(20) not null unique
);

create table Products(
	Id int primary key identity(1,1),
	Name nvarchar(20) not null,
	Description ntext,
	Unit nvarchar(20) not null check(Unit in (N'Chiếc',N'Cặp',N'Bộ'))
);

create table ProductCompanies(
	Qty int not null,
	Price decimal(12,4) not null,
	CompanyCode varchar(20) not null foreign key references Companies(Code),
	ProductId int not null foreign key references Products(Id)
);

-- 3
insert into Companies(Code,Name,Address,PhoneNumber)
values('123','Asus','USA','983232');

select * from Companies;

insert into Products(Name,Description,Unit)
values(N'Máy tính T450',N'Máy nhập mới',N'Chiếc'),
(N'Điện thoại Nokia 567',N'Điện thoại đang hot',N'Chiếc'),
(N'Máy in Samsung 450',N'Máy in đang ế',N'Chiếc');

select * from Products;

insert into ProductCompanies(Qty,Price,CompanyCode,ProductId)
values(10,1000,'123',1),
(200,200,'123',2),
(10,100,'123',3);

select * from ProductCompanies;

-- 4
select * from Companies;
select * from Products;
-- 5
select * from Companies order by Name desc;
select * from ProductCompanies order by Price desc;
select * from Companies where Name = 'Asus';
select * from ProductCompanies where Qty < 11;
select * from ProductCompanies where CompanyCode = '123';
-- 6
select count(Code) as sohangsanpham from Companies;
select count(Id) as somathang from Products;
select count(ProductId) from ProductCompanies where CompanyCode = '123';
select count(ProductId) from ProductCompanies;