
Create table lawyer_assignment(
lawyer_ID                   INT,
case_ID                      INT,

Primary key(lawyer_ID, case_ID),
Foreign key (lawyer_id) references lawyer(lawyer_id) on delete cascade,
Foreign key (case_ID) references `case`(case_id) on delete cascade
);
