-- promotes associates with 3 or more closed cases to partner

update lawyer
set title = 'partner'
where title = 'associate'
  and lawyer_id in (
      select lawyer_assignment.lawyer_id
      from lawyer_assignment
      join `case`on lawyer_assignment.case_id = `case`.case_id
      where `case`.status = 'closed'
      group by lawyer_assignment.lawyer_id
      having COUNT(*) >= 3
  );
