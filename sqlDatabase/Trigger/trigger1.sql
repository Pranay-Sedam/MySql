/*drop TRIGGER if exists tr1;

delimiter $

create trigger tr1 before insert on student for each row


begin


insert into student_logtable values(new.id,new.namefirst,new.namelast,new.dob,new.emailid);


end $

delimiter ;
 
*/

drop trigger if exists tr1;

delimiter $

create trigger tr1 after delete on student for each ROW

begin

insert into student_logtable values(old.id,old.namefirst,old.namelast,old.dob,old.emailid);

end $

delimiter ;


