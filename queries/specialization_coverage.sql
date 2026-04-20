<<<<<<< HEAD
--Query 3: For each specialization, show how many lawyers cover it
=======
>>>>>>> df5d85d (yes)
select ls.specialization, count(ls.lawyer_ID) as num_lawyers
from lawyer_specialization ls
group by ls.specialization
order by num_lawyers desc;