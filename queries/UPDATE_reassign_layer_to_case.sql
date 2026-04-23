UPDATE lawyer_assignment
SET case_ID = 'NEW_CASE_ID'   
WHERE lawyer_ID = (
    
    SELECT lawyer_ID
    FROM lawyer_assignment
    WHERE case_ID = 'OLD_CASE_ID'   
);