CREATE TABLE client(
	client_ID CHAR(5),
	name VARCHAR(20),
	type VARCHAR(10),
	phone_number VARCHAR(10),
	
	PRIMARY KEY (client_ID),
	CHECK (type IN('individual', 'corporate'))
);
