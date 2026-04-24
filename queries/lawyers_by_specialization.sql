select lawyer.name,
       lawyer.title,
<<<<<<< HEAD
=======
       format(lawyer.salary, 2) as salary,
>>>>>>> acb2f40 (made the specialization queries more complex)
       ls.specialization,
       count(distinct la.case_ID) as num_cases_assigned,
       format(lawyer.salary / nullif(count(distinct la.case_ID), 0), 2) as salary_per_case
from lawyer
join lawyer_specialization ls on lawyer.lawyer_ID = ls.lawyer_ID
left join lawyer_assignment la on lawyer.lawyer_ID = la.lawyer_ID
group by lawyer.lawyer_ID, lawyer.name, lawyer.title, lawyer.salary, ls.specialization
order by ls.specialization, lawyer.salary desc;