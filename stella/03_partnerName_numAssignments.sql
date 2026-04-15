-- get lawyer name, num_assignments (number of cases a given lawyer is working on) for all partners at the firm, even if a given partner is not currently assigned to any case.

select lawyer.name, (
    select count(*)
    from lawyer_assignment
    where lawyer_assignment.lawyer_id = lawyer.lawyer_id
    ) as num_assignments

from lawyer

where lawyer.title = 'partner'
order by num_assignments desc;
