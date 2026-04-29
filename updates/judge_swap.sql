-- result set referenced by update
with hearing_update as (
    select
        -- select relevant information for update
        hearing.case_ID,
        hearing.date_time,
        (
            -- select judge with lowest alphabetically ordered name
            select min(hearing2.judge)
            from hearing as hearing2
            where
              -- judges from the same courthouse that aren't the current judge
              hearing2.courthouse = hearing.courthouse
              and hearing2.judge <> hearing.judge
              and not exists (
                  -- judge has a conflicting hearing with current outer query hearing
                  select *
                  from hearing as hearing3
                  where
                    hearing3.judge = hearing2.judge
                    and hearing3.date_time = hearing.date_time
              )
        ) as new_judge
  
    from hearing
    where
      -- hearings subject to update
      hearing.judge = 'Fontenot'
      and date_time > '2026-03-01'
      and date_time < '2026-07-01'       
)

-- apply the update
update hearing join hearing_update on
    hearing.case_ID = hearing_update.case_ID
    and hearing.date_time = hearing_update.date_time
set hearing.judge = hearing_update.new_judge;