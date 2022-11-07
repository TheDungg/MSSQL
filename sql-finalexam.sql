create table Categories(
	CateID char(6) primary key,
	CateName nvarchar(100) not null,
	Description nvarchar(200)
);

create table Parts(
	PartID int primary key identity(1,1),
	PartName nvarchar(100) not null unique,
	CateID char(6) not null foreign key references Categories(CateID),
	Description nvarchar(1000),
	Price decimal(12,0) not null default 0,
	Quantity int default 0,
	Warranty int default 1,
	Photo nvarchar(200) check(Photo like 'photo/%') default 'photo/nophoto.png'
);

insert into Categories(CateID,CateName,Description)
values('TD01',N'RAM',N''),
('TD02',N'CPU',N''),
('TD03',N'HDD',N'');

insert into Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
values(N'HDD 512GB','TD03','like new',50,7,2,N'photo/hdd512.png'),
(N'RAM 8GB','TD01','new',30,10,2,N'photo/ram.png'),
(N'HDD 128GB','TD02','like new',70,20,2,N'photo/hdd128.png');

--4
select * from Parts where Price > 100;

--5
select * from Parts where CateID in (select CateID from Categories where CateName like N'CPU');

--6
create view v_Parts as
select A.PartID, A.PartName, B.CateName, A.Price, A.Quantity from Parts A
inner join Categories B on A.CateID=B.CateID;

-- 7
create view v_TopParts as
select top 5* from Parts order by Price desc;