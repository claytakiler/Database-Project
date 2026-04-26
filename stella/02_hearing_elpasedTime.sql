-- get (case) title, elapsed time (difference in time between most recent hearing and oldest hearing) for each case that has at least two hearings.
-- case_id determines title so it’s fine to not include case_id in the select.

select
    title,
    timestampdiff(day, min(hearing.timestamp), max(hearing.timestamp)) as elapsed_days

from
    `case` natural join hearing

group by case_id, title
having count(*) >= 2;
