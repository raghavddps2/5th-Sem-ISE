create table boat(
bid int primary key,
bname varchar(10),
colour varchar(10));

create table sailor(
sid int primary key,
sname varchar(10),
age int,
rating int);

create table reserves(
bid int,
sid int,
day int,
primary key(sid,bid),
foreign key(bid) references boat(bid) on delete cascade,
foreign key(sid) references sailor(sid) on delete cascade);

insert into boat values(&bid,&bname,&colour);
insert into sailor values(&sid,&sname,&age,&rating);
insert into reserves values(&bid,&sid,&day);

/*3a*/
select * from boat,sailor
where sname='Ram';

/*3b*/
select bid,sid from reserves;

/*3c*/
select sid,count(bid) from reserves group by sid;