update lawyer
set title = 'partner'
where title = 'associate'
  and lawyer_id in (
      select lawyer_id
      from lawyer_assignment
      group by lawyer_id
      having count(*) >= 3
  );
