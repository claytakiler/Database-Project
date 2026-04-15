update lawyer
set salary = salary * 
    case
        when lawyer.title = 'associate' then 1.03
        when lawyer.title = 'partner' then 1.05
    end
where (
    select count(*)
    from lawyer_assignment
    where lawyer_assignment.lawyer_id = lawyer.lawyer_id
) >= (
    select count(*) / 5.0
    from case
);
