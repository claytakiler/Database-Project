select
lawyer.name,
lawyer.lawyer_ID,
	count(distinct ls.specialization) as num_specializations,
	count(distinct la.case_ID) as num_cases_assigned,
	group_concat(distinct ls.specialization order by ls.specialization separator ' | ') as specializations_list
from lawyer
join lawyer_specialization ls on lawyer.lawyer_ID = ls.lawyer_ID
left join lawyer_assignment la on lawyer.lawyer_ID = la.lawyer_ID
group by lawyer.lawyer_ID, lawyer.name, lawyer.title, lawyer.salary
having count(distinct ls.specialization) > 1
order by num_specializations desc, num_cases_assigned desc;
