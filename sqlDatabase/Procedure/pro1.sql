drop PROCEDURE if exists pro1;

delimiter $

create procedure pro1(d1 date,str1 varchar(10))

begin

set @tempd=d1;

l:LOOP

set @tempd=concat(year(@tempd),'-',month(@tempd),'-',day(@tempd)+1);

if dayname(@tempd)=str1 then leave l;
end if;


end loop l;
end $

delimiter ;