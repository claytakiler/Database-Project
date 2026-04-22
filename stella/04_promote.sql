-- promotes associates with 3 or more closed cases to partner

update lawyer
set title = 'partner'
where
    title = 'associate'
    -- subquery gets IDs of lawyers with 3 or more closed case assignments
    and lawyer_id in (
      select lawyer_assignment.lawyer_id
      -- join assignments with cases to access case status
      from lawyer_assignment join `case` on lawyer_assignment.case_id = `case`.case_id
      -- keep only assignments to closed cases
      where `case`.status = 'closed'
      -- group assignments by lawyer
      group by lawyer_assignment.lawyer_id
      -- keep only lawyers with at least 3 closed case assignments
      having count(*) >= 3
  );
