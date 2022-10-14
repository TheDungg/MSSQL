
create table Orders(
	Code int primary key,
	Date1 date
);

create table Customers(
	Id int primary key,
	Name varchar(20),
	Address1 varchar(255),
	PhoneNumber int,
	OrderCode int foreign key references Orders(Code)
);


create table Goods(
	Name varchar(255),
	Id int primary key,
	Price varchar(255),
	Quantity int
);

create table OrderGoods(
	OrderCode int foreign key references Orders(Code),
	GoodId int foreign key references Goods(Id)
);