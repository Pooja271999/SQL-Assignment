create database Assignment1
use Assignment1


CREATE TABLE Client(
   Client_ID NUMERIC(4) NOT NULL PRIMARY KEY ,
   Cname     VARCHAR(40) NOT NULL,
   Address   VARCHAR(30),
   Email     VARCHAR(30) UNIQUE,
   Phone     NUMERIC(10),
   Business  VARCHAR(20) NOT NULL
)


CREATE TABLE Department(
   Deptno NUMERIC(2,0) NOT NULL PRIMARY KEY,
   Dname  VARCHAR(15) NOT NULL,
   Loc    VARCHAR(20)
)


CREATE TABLE Employee(
   Empno  NUMERIC(4,0) NOT NULL PRIMARY KEY,
   Ename  VARCHAR(20) NOT NULL,
   Job    VARCHAR(15),
   Salary NUMERIC(7,0) check (Salary > 0),
   Deptno NUMERIC(2,0) foreign key references Department(Deptno)
)


CREATE TABLE Project(
   Project_ID       NUMERIC(3,0) NOT NULL PRIMARY KEY, 
   Descr            VARCHAR(30) NOT NULL,
   Start_Date       DATE ,
   Planned_End_Date DATE , 
   Actual_End_date  DATE ,
   Budget           NUMERIC(10,0) check (Budget > 0),
   Client_ID        NUMERIC(4,0) foreign key references Client(Client_ID),
   constraint ckdate_plannededata_actualedata check(Planned_End_Date < Actual_End_date )
)
CREATE TABLE EmpProjectTasks(
   Project_ID NUMERIC(3,0) NOT NULL,
   Empno      NUMERIC(4,0) NOT NULL,
   Start_Date DATE,
   End_Date   DATE,
   Task       VARCHAR(25) NOT NULL,
   Status     VARCHAR(15) NOT NULL,
   constraint pk_projectId_empNo PRIMARY KEY(Project_ID, Empno),
   constraint fkey_tblProjectTask_projectid FOREIGN KEY(Project_ID) REFERENCES Project(Project_ID),
   constraint fkey_tblProjectTask_empno FOREIGN KEY(Empno) REFERENCES Employee(Empno)
  
)
--insert in client

INSERT INTO Client(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1001,'ACME Utilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing')
INSERT INTO Client(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1002,'Trackon Consultants','Mumbai','consult@trackon.com',8734210090,'Consultant')
INSERT INTO Client(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1003,'MoneySaver Distributors','Kolkata','save@moneysaver.com',7799886655,'Reseller')
INSERT INTO Client(Client_ID,Cname,Address,Email,Phone,Business) VALUES (1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional')

select *from client

--insert in department

INSERT INTO Department(Deptno,Dname,Loc) VALUES (10,'Design','Pune'),(20,'Development','Pune'),(30,'Testing','Mumbai'),(40,'Document','Mumbai')

select *from Department



--insert in Employee


INSERT INTO Employee(Empno,Ename,Job,Salary,Deptno) VALUES (7001,'Sandeep','Analyst',25000,10),(7002,'Rajesh','Designer',30000,10),(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20),(7005,'Abhay','Designer',35000,10),(7006,'Uma','Tester',30000,30),(7007,'Gita','Tech. Writer',30000,40),(7008,'Priya','Tester',35000,30),
(7009,'Nutan','Developer',45000,20),(7010,'Smita','Analyst',20000,10),(7011,'Anand','Project Mgr',65000,10)

select *from Employee


--insert in project

INSERT INTO Project(Project_ID,Descr,Start_Date,Planned_End_Date,Actual_End_date,Budget,Client_ID) VALUES (401,'Inventory','1-Apr-11','1-Oct-11','31-Oct-11',150000,1001),
(402,'Accounting','1-Aug-11','1-Jan-12',NULL,500000,1002),(403,'Payroll','1-Oct-11','31-Dec-11',NULL,75000,1003),(404,'Contact Mgmt','1-Nov-11','31-Dec-11',NULL,50000,1004)

select *from project

--insert in  EmpProjectTask

INSERT INTO EmpProjectTasks(Project_ID,Empno,Start_Date,End_Date,Task,Status) VALUES (401,7001,'1-Apr-11','20-Apr-11','System Analysis','Completed'),
(401,7002,'21-Apr-11','30-May-11','System Design','Completed'),(401,7003,'1-Jun-11','15-Jul-11','Coding','Completed'),(401,7004,'18-Jul-11','1-Sep-11','Coding','Completed'),
(401,7006,'3-Sep-11','15-Sep-11','Testing','Completed'),(401,7009,'18-Sep-11','5-Oct-11','Code Change','Completed'),(401,7008,'6-Oct-11','16-Oct-11','Testing','Completed'),
(401,7007,'6-Oct-11','22-Oct-11','Documentation','Completed'),(401,7011,'22-Oct-11','31-Oct-11','Sign off','Completed'),(402,7010,'1-Aug-11','20-Aug-11','System Analysis','Completed'),
(402,7002,'22-Aug-11','30-Sep-11','System Design','Completed'),(402,7004,'1-Oct-11',NULL,'Coding','In Progress')

select *from EmpProjectTasks

