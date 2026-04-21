--Query 2: List the names, titles, salaries, and specializations of all lawyers, ordered by name and specialization.
select lawyer.name, lawyer.title, lawyer.salary, ls.specialization
from lawyer
join lawyer_specialization ls on lawyer.lawyer_ID = ls.lawyer_ID
order by lawyer.name, ls.specialization;