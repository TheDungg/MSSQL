create table Classes(
	Name varchar(20) not null,
	Code varchar(20) primary key,
	Room int 
);

create table Students(
	Birthday date not null check(Birthday < getdate()),
	Code integer primary key,
	Name varchar(20) not null,
	ClassCode varchar(20) foreign key references Classes(Code)
);

create table Subjects(
	Name varchar(20) not null unique,
	Code varchar(20) primary key
);


create table Results(
	Result nvarchar(20) not null check(Result in (N'Yếu',N'Trung Bình', N'Khá', N'Giỏi', N'Xuất sắc')),
	Point int not null check(Point >=0 and Point <=10) default 0,
	Id int primary key identity(1,1),
	StudentCode int not null foreign key references Students(Code),
	SubjectCode varchar(20)not null foreign key references Subjects(Code)
);

create table StudentSubjects(
	StudentCode int foreign key references Students(Code),
	SubjectCode varchar(20) foreign key references Subjects(Code)
);

