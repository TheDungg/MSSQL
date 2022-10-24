
-- tao bang
create table People(
	Id int primary key identity(1,1),
	Name nvarchar(25) not null,
	Address nvarchar(50) not null,
	Birthday date not null
);

create table PhoneNumbers(
	Id int primary key identity(1,1),
	PhoneNumber varchar(15) check(PhoneNumber like '0%'),
	PersonId int not null foreign key references People(Id)
);


-- nhap du lieu
insert into People(Name,Address,Birthday)
values(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','11/18/87');
 select * from People;

 insert into PhoneNumbers(PhoneNumber,PersonId)
 values('0987654321','1'),
 ('09873452','1'),
 ('09832323','1'),
 ('09434343','1');

 --4
 select * from People;
 select * from PhoneNumbers;
 --5
 select * from People order by asc;
 select * from PhoneNumbers where PersonId in (select Id from People where Name like N'%Nguyễn Văn An%');
 select * from People where Birthday in ('12/12/09');
 --6
 select PersonId, count(PhoneNumber) from PhoneNumbers, group by PersonId;
 select count(Birthday) from People where month(Birthday) = 12;
 select * from PhoneNumbers a
 left join People b on a.PersonId=b.Id;
 select * from People where Id in(select PersonId from PhoneNumbers where PhoneNumber = '123456789';
 --7
 alter table People add check(Birthday <= GetDate());

 alter table People add StartDay date;
 --8
 create index chi_muc_phi_vat_ly_Name on People(Name);
 create index chi_muc_phi_vat_ly_PhoneNumber on PhoneNumbers(PhoneNummber);


