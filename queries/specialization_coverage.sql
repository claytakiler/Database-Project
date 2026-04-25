select ls.specialization,
       count(distinct ls.lawyer_ID) as num_lawyers,
       format(avg(lawyer.salary), 2) as avg_salary,
       sum(case when lawyer.title = 'partner' then 1 else 0 end) as num_partners,
       sum(case when lawyer.title = 'associate' then 1 else 0 end) as num_associates,
       count(distinct la.case_ID) as total_cases_covered
from lawyer_specialization ls
join lawyer on ls.lawyer_ID = lawyer.lawyer_ID
left join lawyer_assignment la on ls.lawyer_ID = la.lawyer_ID
group by ls.specialization
order by num_lawyers desc;