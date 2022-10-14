create table Categories(
	Id int primary key, 
	Name varchar(255)
);
drop table Categories;

create table Authors(
	Id int primary key,
	Name varchar(255)
);
 drop table Authors;

 create table Publishers(
	Id int primary key,
	Name varchar(255),
	Address varchar(255)
);
drop table Publishers;

create table Books(
	Code varchar(20) primary key,
	Name varchar(255),
	Description text,
	PublishYear int,
	NumberOfPublish int,
	Price decimal(12,4),
	Quantity int,
	CategoryId int foreign key references Categories(Id),
	PublisherId int foreign key references Publishers(Id)
);

create table BookAuthors(
	BookCode varchar(20) foreign key references Books(Code),
	AuthorId int foreign key references Authors(Id)
);

