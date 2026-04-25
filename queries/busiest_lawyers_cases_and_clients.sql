SELECT 
    la.lawyer_ID,
    (SELECT COUNT(*) 
     FROM lawyer_assignment 
     WHERE lawyer_ID = la.lawyer_ID) AS total_lawyer_assignments,
    c.case_ID,
    cl.client_ID,
    cl.type AS client_type
FROM lawyer_assignment la
JOIN `case` c ON la.case_ID = c.case_ID
JOIN client cl ON c.client_ID = cl.client_ID
WHERE cl.type = 'Individual'
  AND (SELECT COUNT(*) 
       FROM lawyer_assignment 
       WHERE lawyer_ID = la.lawyer_ID) = (
           SELECT MAX(assignment_count)
           FROM (
               SELECT COUNT(*) AS assignment_count
               FROM lawyer_assignment
               GROUP BY lawyer_ID
           ) AS counts
       );