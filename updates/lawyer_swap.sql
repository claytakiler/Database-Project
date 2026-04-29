-- result set referenced by update
with assignment_update as (
    -- select case_ID & new lawyer_ID for update to assignment
    select
        lawyer_assignment.case_ID,
        (
            -- of eligible lawyers select lawyer with min lawyer_ID
            select min(lawyer.lawyer_ID)
            from
                -- lawyer_ID, salary and specialization all in one place
                lawyer join lawyer_specialization
                on lawyer.lawyer_ID = lawyer_specialization.lawyer_ID
            where
                -- replacement lawyer meets base criteria
                lawyer_specialization.specialization = 'corporate law'
                and lawyer.lawyer_ID <> 7
                and lawyer.salary between
                    (select salary from lawyer where lawyer_ID = 7) * 0.97
                    and (select salary from lawyer where lawyer_ID = 7) * 1.03
                -- lawyer isn't already assigned to case from outer query
                and not exists (
                        select *
                        from lawyer_assignment as lawyer_assignment2
                        where
                            lawyer_assignment2.case_ID = lawyer_assignment.case_ID
                            and lawyer_assignment2.lawyer_ID = lawyer.lawyer_ID
                )
        ) as replacement_lawyer
    from
        -- case_ID, client_ID and lawyer_ID all in one place
        lawyer_assignment join `case`
        on lawyer_assignment.case_ID = `case`.case_ID
    where
        -- records must have original lawyer & corporate client of interest
        lawyer_assignment.lawyer_ID = 7
        and `case`.client_ID = 7
    -- results are grouped by case
    group by lawyer_assignment.case_ID
)

-- apply update
update
    -- match case assignments to (case + replacement) on case_ID
    lawyer_assignment join assignment_update
    on lawyer_assignment.case_ID = assignment_update.case_ID
set
    -- reference replacement_lawyer for new lawyer_ID
    lawyer_assignment.lawyer_ID = assignment_update.replacement_lawyer
    where
        lawyer_assignment.lawyer_ID = 7
        and assignment_update.replacement_lawyer is not null;











        