-- adminlist 테이블 생성
create table adminlist(
userid varchar(20) not null,
pwd varchar(20) not null
)
comment ='adminlist'
default charset = utf8
engine = InnoDB;

CREATE TABLE DEPT (
	DEPTNO int(2),
	DNAME VARCHAR(14),
	LOC VARCHAR(13),
    primary key(DEPTNO)
)
comment ='DEPT'
default charset = utf8
engine = InnoDB;


-- EMP 테이블 생성
CREATE TABLE EMP (
	EMPNO int(4) not null,
	ENAME VARCHAR(10) not null,
	JOB VARCHAR(9) not null,
	MGR int(4),
	HIREDATE date not null,
	SAL int unsigned not null,
	COMM int unsigned,
	DEPTNO int(2) ,
    IMAGEFILENAME varchar(100),
	primary key(EMPNO),
    foreign key (DEPTNO)
    references familyc.dept(DEPTNO)
    on delete cascade
)
comment ='EMP'
default charset  =utf8
engine=InnoDB;

-- insert Data
insert into adminlist values('admin', '1004')
							, ('adminkim', '1234');

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK')
						, (20,'RESEARCH','DALLAS')
						, (30,'SALES','CHICAGO')
						, (40,'OPERATIONS','BOSTON');

INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20, null)
						, (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30, null)
						, (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30, null)
						, (7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20, null)
						, (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30, null)
						, (7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30, null)
						, (7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10, null)
						, (7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20, null)
						,  (7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10, null)
						, (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30, null)
						, (7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20, null)
						, (7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30, null)
						, (7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20, null)
						, (7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10, null);