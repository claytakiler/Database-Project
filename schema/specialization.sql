create table lawyer_specialization(
    lawyer_ID   char(5),
    specialization      varchar(20),

    primary key(lawyer_ID, specialization),
    check(specialization in ('coporate law', 'criminal law', 'family law', 'property law')),
    foreign key(lawyer_ID) references lawyer(lawyer_ID)
)