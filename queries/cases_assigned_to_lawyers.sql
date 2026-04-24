SELECT 
    lawyer_assignment.lawyer_ID,
    lawyer.name AS lawyer_name,
    lawyer.title,
    COUNT(lawyer_assignment.case_ID) AS total_cases
   
FROM lawyer_assignment
INNER JOIN lawyer
    ON lawyer_assignment.lawyer_ID = lawyer.lawyer_ID
GROUP BY 
    lawyer_assignment.lawyer_ID,
    lawyer.name,
    lawyer.title
HAVING COUNT(lawyer_assignment.case_ID) > 1
ORDER BY total_cases DESC;