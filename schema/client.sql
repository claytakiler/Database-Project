CREATE TABLE client(
	client_ID CHAR(5),
	name VARCHAR(20),
	type VARCHAR(10),
	phone_number VARCHAR(10),
	
	PRIMARY KEY (client_ID),
	CHECK (type IN('individual', 'corporate'))
);

-- requires case table
create table hearing (
case_ID		char(5),
judge			varchar(20),
date_time		timestamp,
courthouse		varchar(20),

primary key(case_ID, date_time),
foreign key (case_ID) references case(case_ID)
);
