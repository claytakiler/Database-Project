SELECT
    lawyer.lawyer_ID,     
    COUNT(case_ID) AS total_cases 
FROM lawyer_assignment
GROUP BY lawyer_ID   
ORDER BY total_cases DESC;  
