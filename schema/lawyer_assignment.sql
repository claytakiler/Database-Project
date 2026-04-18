Create table lawyer_assignment(
lawyer_ID                   char(5)
case_ID                      varchar(20)

Primary key(lawyer_ID, case_ID),
Foreign key (lawyer_ID) references lawyer(lawyer_ID),
Foreign key(case_ID) references case(case_ID)
);
