create table lawyer_specialization(
    lawyer_ID   INT,
    specialization      varchar(20),

    primary key(lawyer_ID, specialization),
    check(specialization in ('corporate law', 'criminal law', 'family law', 'property law')),
    foreign key (lawyer_id) references lawyer(lawyer_id) on delete cascade
);