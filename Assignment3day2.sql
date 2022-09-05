use assin2

select * from DPT;
select * from EMP;

--2



-- ques1. 
select * from EMP where job='MANAGER'

-- ques2. 
select ename, salary from EMP where salary > 1000


--ques3. 
select ename, salary from EMP where ename != 'JAMES'



--ques4. 
select * from EMP where ename like 'S%'


--ques5.
select ename from EMP where ename like '%A%';


--ques6. 

select ename from EMP where ename like '___L%';



--ques7.
select salary/30 as 'DAILY SALARY OF JONES' from EMP where ename = 'JONES';



--8. Calculate the total monthly salary of all employees. 
select sum(salary) as 'TOTAL MONTHLY SALARY OF ALL EMPLOYEES' from tblEMP;



--ques9.
select AVG(salary*12) as 'AVERAGE ANNUAL SALARY' from EMP;



--ques10. 
select ename, job, salary, deptno from EMP where job != 'SALESMAN' OR deptno <> 30;



--ques11.
select distinct(e.deptno) as 'DEPARTMENTS',(select dname from DPT where deptno = e.deptno) 'DEPARTMENT NAME'  from EMP e where deptno is not null;



--ques12.
select ename 'EMPLOYEE', salary 'MONTLY SALARY'from EMP where salary > 1500 and deptno in (10, 30)



--ques13. 
select ename , job ,  salary from EMP where job in ('MANAGER', 'ANALYST') AND salary not in 
(1000, 3000, 5000);



--ques14.
select ename, job, comm 'commission' from EMP where comm > (salary + salary * 0.1)



--ques15. 
select ename from EMP where ename like '%L%L%' and deptno = 30 or mgr_id = 7782



--ques16.
select ename from EMP where DATEDIFF(YEAR, hiredate, GETDATE())  BETWEEN 10 AND 20
select COUNT(empno) from EMP where DATEDIFF(YEAR, hiredate, GETDATE())  BETWEEN 10 AND 20



--ques17. 
select ename, dname from EMP e join DPT d on e.deptno = d.deptno order by dname asc , ename desc;



--ques18. 
select DATEDIFF(YEAR, hiredate, GETDATE()) 'EXPERIENCE OF MILLER' from EMP where ename='MILLER';
