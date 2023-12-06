1.	Pass DEPTNO to the function (named sumSalary) and calculate the sum of salary.(Use: EMP table)
         drop function if exists sumSalary;
delimiter $
create function sumSalary(_deptno int) returns int
deterministic
begin
	declare sum int;
	select sum(sal) into z from emp where deptno=_deptno ;
	return sum;
end $
delimiter ;

2.	Create a new table called STUDENT_NEW having following columns (studentID, namefirst, namelast, DOB, and emailID). Write a function names autoNumber to return auto generate studentID and return the new value (Use: STUDENT_NEW table).
drop function if exists autoNumber;
drop table if exists student_new;
create table student_new(studentID int default 0, namefirst varchar(20), namelast varchar(20), dob date, emailID varchar(50));
delimiter $
create function autoNumber() returns int
deterministic
begin
	declare _num int;
	select max(studentID) + 1 from student_new into _num;
	insert into student_new(studentID) values(_num);
	return _num;
end $
delimiter ;

3.	Write a function which will accept email-ID from the user, if the email-ID is present return his username and password or else `Return “Employee not exists”. (Use: LOGIN table)
drop function if exists acceptEmail;
delimiter $
create function acceptEmail(_emailid varchar(20)) returns varchar(50)
deterministic
begin
	declare _username varchar(20) default '0';
	declare _pwd varchar(20) default '0';
	if _emailid in (select _emailid from login) then 
		select Username from emp where _email = emailid into _username;
		select Password from emp where _email = emailid into _pwd;
		return concat(_username,' ', _pwd);
	else
		return "Employee not exists";
	end if;
end $
delimiter ;

4.	Write a function which will accept studentID from the user and calculate the sum of (10th, 12th, and BE) marks.
drop function if exists marksum;
delimiter $
create function marksum(student_id int) returns int
deterministic
begin
	declare numsum int default 0;
	select sum(marks) into numsum from student_qualifications where student_id = studentID;
	return numsum;
end $
delimiter ;
5.	Write a function that returns random OTP number of 6 digits.
drop function if exists otp;
delimiter $
create function otp() returns int
deterministic
begin
declare x int;
l1: loop
	set x:= rand()*1000000;
	if x>99999 then
		return x ;
		leave l1;
	end if;
	end loop l1;
end $
delimiter ;
