Select ls.specialization, count(ls.lawyer_ID) as num_lawyers
From lawyer_specialization ls
Group by ls.specialization
Order by num_lawyers desc;
