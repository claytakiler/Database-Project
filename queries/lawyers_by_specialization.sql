select lawyer.name, lawyer.title, lawyer.salary, ls.specialization
from lawyer
join lawyer_specialization ls on lawyer.lawyer_ID = ls.lawyer_ID
order by lawyer.name, ls.specialization;