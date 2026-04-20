select lawyer.name, lawyer.lawyer_ID, count(lawyer_specialization.specialization) as num_specializations
from lawyer
join lawyer_specialization ls on lawyer.lawyer_ID = ls.lawyer_ID
group by lawyer.lawyer_ID, lawyer.name
having count(ls.specialization) > 1
order by num_specializations desc;