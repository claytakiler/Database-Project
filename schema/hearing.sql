-- requires case table
create table hearing (
case_ID		char(5),
judge			varchar(20),
date_time		timestamp,
courthouse		varchar(20),

primary key(case_ID, date_time),
foreign key (case_ID) references case(case_ID)
);
