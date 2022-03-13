create database if not exists Testing_System_Assignment_1;
use Testing_System_Assignment_1;


create table Department (
DepartmentID 		int,
DepartmentName 		varchar(50)
);


create table Posision (
PosisionID 		int,
PosisionName	varchar(50)

);


create table Accounts (
AccountsID    	int,
Email         	varchar(50),
Username      	varchar(50),
Fullname      	varchar(50),
DepartmentID 	int not null,
/*departmentsdepartmentsdept_empdept_empforeign key (DepartmentID) references Department(DepartmentID),*/
PosisionID 		int,
Creatdate 		date
);


create table Groupss(
GroupID 		int,
GroupName 		varchar(50),
CreatorID 		int,
CreatDate 		date
);


create table GroupAccount(
GroupID 	int,
AccountID 	int,
JoinDate 	date
);


create table TypeQuestion (
TypeID 		int,
TypeName	varchar(50)
);


create table CategoryQuestion (
CategoryID 		int,
CategoryName 	varchar(50)
);


create table Question(
QuestionID 		int,
Content 		varchar(100),
CategoryID 		int,
TypeID 			int,
CreatorID 		int,
CreatorDate 	date
);



create table Answer(
AnswerID 	int,
Content 	varchar(100),
QuestionID 	int,
IsCorrect 	boolean
);


create table Exam(
ExamID		int,
CodeID 		varchar(10),
Title 		varchar(50),
CategoryID 	int,
Duration 	int,
CreatorID 	int,
CreatDate 	date		
);



create table ExamQuestion(
ExamID 		int,
QuestionID 	int
);