-- requires case table
create table hearing (
case_ID		INT,
judge			varchar(25),
date_time		timestamp,
courthouse		varchar(25),

primary key(case_ID, date_time),
foreign key (case_ID) references `case`(case_ID)
);
