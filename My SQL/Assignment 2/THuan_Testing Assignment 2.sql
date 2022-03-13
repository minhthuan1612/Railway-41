drop database if exists Testing_System_Assignment_2;
create database if not exists Testing_System_Assignment_2;
use Testing_System_Assignment_2;


create table if not exists Department (
DepartmentID 		int auto_increment primary key,
DepartmentName 		varchar(50) not null
);


create table if not exists Posision (
PosisionID 		int auto_increment primary key,
PosisionName	enum('Dev','Test','Scrum Master','PM')

);


create table if not exists `Acount` (
AcountID    	int primary key auto_increment,
Email         	varchar(50) unique key,
Username      	varchar(50) not null,
Fullname      	varchar(50) not null,
Age 			int check(Age>=18 and Age <=50),
Gender			enum('male','female'),
DepartmentID 	int signed not null,
foreign key(DepartmentID) references Department(DepartmentID),
PosisionID 		int not null,
foreign key(PosisionID) references Posision(PosisionID),
Creatdate 		date default now()
);


create table if not exists `Group`(
GroupID 		int not null primary key auto_increment,
GroupName 		varchar(50),
CreatorID 		int not null,
CreatDate 		date default now()
);



create table if not exists GroupAccount(
GroupID 	int not null primary key,
AcountID 	int not null,
foreign key(AcountID)references Acount(AcountID),
JoinDate 	date default now()
);


create table if not exists TypeQuestion (
TypeID 		int not null primary key check(length(TypeID)>=8),
TypeName	enum('Essay','multiple choice')
);



create table if not exists CategoryQuestion (
CategoryID 		int signed primary key auto_increment,
CategoryName 	varchar(50) not null
);



create table if not exists Question(
QuestionID 		int signed auto_increment primary key,
Content 		varchar(1000),
CategoryID 		int not null,
foreign key(CategoryID) references CategoryQuestion(CategoryID),
TypeID 			int not null,
foreign key(TypeID) references TypeQuestion(TypeID),
CreatorID 		int,
CreatorDate 	date not null
);



create table if not exists Answer(
AnswerID 	int not null auto_increment primary key,
Content 	varchar(100),
QuestionID 	int,
foreign key(QuestionID) references Question(QuestionID),
IsCorrect 	enum ('truth','false')
);


create table if not exists Exam(
ExamID		int not null primary key auto_increment,
CodeID 		varchar(10) check(length(CodeID)>=8),
Title 		varchar(50),
CategoryID 	int not null,
foreign key(CategoryID) references CategoryQuestion(CategoryID),
Duration 	time not null,
CreatorID 	int,
CreatDate 	date not null		
);


create table if not exists ExamQuestion(
ExamID 		int not null,
QuestionID 	int not null,
primary key(ExamID,QuestionID)
);