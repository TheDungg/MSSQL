create table Categories(
	Id int primary key identity(1,1),
	Name nvarchar(255) not null
);

create table Publishers(
	Id int primary key identity(1,1),
	Name nvarchar(255) not null unique,
	Address nvarchar(255) not null
);

create table Authors(
	Id int primary key identity(1,1),
	Name nvarchar(255) not null unique
);

create table Books(
	Code varchar(20) primary key,
	Name nvarchar(255) not null,
	Description ntext,
	PublishYear int not null,
	NumberOfPublish int not null,
	Price decimal(12,4) not null,
	Qty int not null,
	CategoryId int not null foreign key references Categories(Id),
	PublisherId int not null foreign key references Publishers(Id)
);

create table BookAuthors(
	BookCode varchar(20) not null foreign key references Books(Code),
	AuthorId int not null foreign key references Authors(Id)
);

insert into Categories(Name)
values(N'Khoa học xã hội');

insert into Publishers(Name,Address)
values(N'Tri Thức',N'53 Nguyễn Du, Hai Bà Trưng, Hà Nội');

insert into Authors(Name)
values(N'Eran Katz');

insert into Books(Code,Name,Description,PublishYear,NumberOfPublish,Price,Qty,CategoryId,PublisherId)
values('B001',N'Trí tuệ Do Thái',N'Bạn có muốn biết: Người Do Thái sáng tạo ra cái gì và nguồn gốc trí tuệ của họ xuất phát từ đâu không? Cuốn sách này sẽ dần hé lộ những bí ẩn về sự thông thái của người Do Thái, của một dân tộc thông tuệ với những phương pháp và kỹ thuật phát triển tầng lớp trí thức đã được giữ kín hàng nghìn năm như một bí ẩn mật mang tính văn hóa.',
2000,1,79000,100,1,1);

insert into BookAuthors(BookCode,AuthorId)
values('B001',1);

select * from Books;

-- 3
select * from Books where PublishYear >= 2008;
-- 4
select top 10* from Books order by Price desc;
-- 5
select * from Books where Name like N'%tin học%';
-- 6
select * from Books where Name like N'T%' order by Price desc;
-- 7
select * from Books where PublisherId in (select Id from Publishers where Name = N'Tri thức');
-- 8
select * from Publishers where Id in (select PublisherId from Books where Name = N'Trí tuệ Do Thái');
-- 9
select A.Code,A.Name,A.PublishYear,C.Name,B.Name from Books A
inner join Categories B on A.CategoryId=B.Id
inner join Publishers C on A.PublisherId=C.Id;
-- 10
select top 1* from Books order by Price desc;
-- 11
select top 1* from Books order by Qty desc;
-- 12
select * from Books where Code in (select BookCode from BookAuthors where AuthorId in(select Id from Authors where Name = N'Eran Katz'));
-- 13
update Books
set Price = Price*9/10
where PublishYear <= 2008;
-- 14
select B.Name,count(distinct A.Code) from Books A
inner join Publishers B on A.PublisherId=B.Id
group by B.Name;
-- 15
select B.Name,count(distinct A.Code) from Books A
inner join Categories B on A.CategoryId=B.Id
group by B.Name;
-- 16
create index chi_muc_phi_vat_ly_Name on Books(Name);
-- 17
create view cau17 as
select A.Code,A.Name as BookName,C.Name as AuthorName,D.Name PublisherName,A.Price from Books A
inner join BookAuthors B on A.Code=B.BookCode
inner join Authors C on B.AuthorId=C.Id
inner join Publishers D on A.PublisherId=D.Id;

select * from cau17;
-- 18
create procedure SP_Them_Sach @Code varchar(20), @Name nvarchar(255), @Description ntext, @PublishYear int, @NumberOfPublish int,
@Price decimal(12,4), @Qty int, @CategoryId int, @PublisherId int as
insert into Books
values(@Code, @Name, @Description, @PublishYear, @NumberOfPublish, @Price, @Qty, @CategoryId, @PublisherId);

create procedure SP_Tim_Sach @keyword nvarchar(255) as
select * from Books where Name = @keyword;

create procedure SP_Sach_ChuyenMuc @CategoryCode int as
select * from Books where CategoryId = @CategoryCode;
-- 19
create trigger khong_cho_phep_xoa_sach_van_con 
on Books
after delete
as if exists(select * from deleted where Qty > 0)
begin
	rollback transaction;
	print N'không cho phép xóa các cuốn sách vẫn còn trong kho';
end
--20
create trigger khong_cho_phep_xoa_danh_muc_sach 
on Categories
after delete
as if exists(select * from deleted where Id in (select CategoryId from Books where Qty > 0))
begin
	rollback transaction;
	print N'chỉ cho phép xóa một danh mục sách khi không còn cuốn sách nào thuộc chuyên mục này.';
end