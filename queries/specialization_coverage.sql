--Query 3: For each specialization, show how many lawyers cover it
select ls.specialization, count(ls.lawyer_ID) as num_lawyers
from lawyer_specialization ls
group by ls.specialization
order by num_lawyers desc;