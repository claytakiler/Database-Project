SELECT 
    la.lawyer_ID,
    c.case_ID,
    cl.client_ID,
    cl.type AS client_type
FROM lawyer_assignment la
JOIN `case` c ON la.case_ID = c.case_ID
JOIN client cl ON c.client_ID = cl.client_ID;