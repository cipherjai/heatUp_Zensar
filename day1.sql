create table toss 
(
  sno varchar(20)
);
insert into toss values('1254');
insert into toss values('1657');
insert into toss values('1251');
insert into toss values('1354');
insert into toss values('1119');
select * from toss order by sno;
select * from toss order by TO_NUMBER(sno);

