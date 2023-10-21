/*drop function if exists f1;

delimiter .

create function f1(_deptno int) returns int
deterministic

BEGIN
declare sumSalary int;
select sum(sal) into sumSalary from emp where deptno=_deptno;
return sumSalary;
end .
delimiter ;


drop procedure if exists getQualification;

delimiter $

create procedure getQualification(sid int)

BEGIN

if sid in(select studentid from student_qualifications) then
select * from student s1 join student_qualifications sq on s1.id=sq.studentid where studentid=sid;

ELSE
select "Student not found";
end if;
end $
delimiter ;


drop PROCEDURE if exists addStudent;

delimiter $

create PROCEDURE addStudent(s_fname varchar(20),s_lname varchar(20),s_phone varchar(20),s_address varchar(20))

BEGIN
set @st=0;
set @stp=0;
set @sta=0;


select max(id)+1 into @st from student;
select max(id)+1 into @stp from student_phone;
select max(id)+1 into @sta from student_address;

insert into student(id,namefirst,namelast) VALUES(@st,s_fname,s_lname);

insert into student_phone(id,p_number,studentid,isActive) VALUES(@stp,s_phone,@st,1);


insert into student_address(id,studentid,address) VALUES(@sta,@st,s_address);

end $

delimiter ;

*/

/* drop PROCEDURE IF EXISTS addQualification ;
delimiter $
CREATE PROCEDURE addQualification (siid int ,sq_name varchar(20))
BEGIN

set @sid=0;

select max(id)+1 into @sid from student_qualifications;

if siid in(select id from student) THEN

insert into student_qualifications(id,studentid,name) values(@sid,siid,sq_name);

select "Record inserted...";

ELSE
select "Student Not Found...";

end if;

end $

delimiter ;




drop PROCEDURE if exists pro1;

delimiter $

create PROCEDURE pro1(str1 varchar(20))

BEGIN

declare x int;
set x=1;

l:LOOP

insert into name values(substr(str1,x,1));



if x>length(str1) THEN leave l;
end if;
set x=x+1;
end loop l;



end $
delimiter ;
*/


/*drop PROCEDURE if exists pro1;

delimiter $

create PROCEDURE pro1()

BEGIN

declare paise int;
declare name varchar(50);

declare c1 cursor for select ename,sal from emp order by sal desc limit 5;

open c1;
l:LOOP

fetch c1 into name,paise;
select name,paise;

end loop l;
close c1;

end $
delimiter ;
*/


/*
drop PROCEDURE if EXISTS pro1;

delimiter $

create PROCEDURE pro1()

BEGIN

declare _eno,_mgr,_sal,_comm,_deptno,_bonusid int;
declare _ename,_job,_userName,_pwd,_phone varchar(30);
declare _date date;
declare _gender char;
declare _active BOOLEAN;

declare c1 cursor for select * from emp where deptno=10;

declare c2 cursor for select * from emp where deptno=20;
declare c3 cursor for select * from emp where deptno=30;

open c1;
open c2;
open c3;

l:LOOP
 fetch c1 into _eno,_ename,_gender,_job,_mgr,_date,_sal,_comm,_deptno,_bonusid,_userName,_pwd,_phone,_active;
 insert into emp10 values(_eno,_ename,_gender,_job,_mgr,_date,_sal,_comm,_deptno,_bonusid,_userName,_pwd,_phone,_active);
 
  fetch c2 into _eno,_ename,_gender,_job,_mgr,_date,_sal,_comm,_deptno,_bonusid,_userName,_pwd,_phone,_active;
 insert into emp20 values(_eno,_ename,_gender,_job,_mgr,_date,_sal,_comm,_deptno,_bonusid,_userName,_pwd,_phone,_active);
 
  fetch c3 into _eno,_ename,_gender,_job,_mgr,_date,_sal,_comm,_deptno,_bonusid,_userName,_pwd,_phone,_active;
 insert into emp30 values(_eno,_ename,_gender,_job,_mgr,_date,_sal,_comm,_deptno,_bonusid,_userName,_pwd,_phone,_active);
 
end loop l;
close c1;
close c2;
close c3;

end $
delimiter ;
*/

/*drop PROCEDURE if exists pro1;

delimiter $

create PROCEDURE pro1()

BEGIN

select deptno,group_concat(ename) from emp group by deptno;

end $

delimiter ;
*/


/*drop PROCEDURE if EXISTS pro1;

delimiter $

create PROCEDURE pro1(_cnum int)

BEGIN

declare _onum,_snum,_ccnum int;

declare _amt float;
declare _odate datetime;
declare _type varchar(40);



DECLARE c1 cursor for select o.* from customers c join orders o on c.cnum=o.cnum where o.cnum=_cnum;

open c1;

l:LOOP
fetch c1 into _onum,_amt,_odate,_ccnum,_snum,_type;

select _onum,_amt,_odate,_ccnum,_snum,_type;

end loop l;


close c1;
end $
delimiter ;

*/

/*
drop PROCEDURE if exists pro1;

delimiter $

create PROCEDURE pro1(str1 varchar(20))

BEGIN

declare x int;
set x=1;


set @ch='';
set @res="";

l:LOOP
set @ch=substr(str1,x,1);

if @ch='0' then set @res:=concat(@res,' ',"zero");
elseif @ch='1' then set @res:=concat(@res,' ',"one");
elseif @ch='2' then set @res:=concat(@res,' ',"two");
elseif @ch='3' then set @res:=concat(@res,' ',"three");
elseif @ch='4' then set @res:=concat(@res,' ',"four");
elseif @ch='5' then set @res:=concat(@res,' ',"five");
elseif @ch='6' then set @res:=concat(@res,' ',"six");
elseif @ch='7' then set @res:=concat(@res,' ',"seven");
elseif @ch='8' then set @res:=concat(@res,' ',"eight");
elseif @ch='9' then set @res:=concat(@res,' ',"nine");

end if;

if x > length(str1) then leave l;
end if;
set x=x+1;
end loop l;

end $
delimiter ;

*/


drop function if exists f1;

delimiter $

create function f1(str1 varchar(20)) returns varchar

deterministic


BEGIN




set @ch='';
set @res="";
select "Function f1 is called...";

set @ch=substr(str1,x,1);

if @ch='0' then set @res:=concat(@res,' ',"zero");
elseif @ch='1' then set @res:=concat(@res,' ',"one");
elseif @ch='2' then set @res:=concat(@res,' ',"two");
elseif @ch='3' then set @res:=concat(@res,' ',"three");
elseif @ch='4' then set @res:=concat(@res,' ',"four");
elseif @ch='5' then set @res:=concat(@res,' ',"five");
elseif @ch='6' then set @res:=concat(@res,' ',"six");
elseif @ch='7' then set @res:=concat(@res,' ',"seven");
elseif @ch='8' then set @res:=concat(@res,' ',"eight");
elseif @ch='9' then set @res:=concat(@res,' ',"nine");

end if;

return @res;

end $
delimiter ;








drop PROCEDURE if exists pro2;

delimiter $

create PROCEDURE pro2(str1 varchar(10))

BEGIN
set @ans="";
select "PROCEDURE pro2 is called..";
if length(str1)=1 THEN set @ans:=concat(@ans,f1(str1));
end IF;


end $

delimiter ;





drop PROCEDURE if exists pro1;

delimiter $

create PROCEDURE pro1(num int)

BEGIN

declare temp int;
set temp=num;

set @res=0;

l:LOOP

set @res=@res+mod(temp,10);

set temp=floor(temp/10);

if temp=0 then leave l;
end if;


end loop l;

call pro2(TO_CHAR(@res));

end $



delimiter ;

