SELECT
   lawyer_assignment.lawyer_ID, 
   COUNT(case_ID) AS total_cases 
FROM lawyer_assignment
GROUP BY lawyer_ID
HAVING COUNT(case_ID) > ( 
   SELECT AVG(case_count) 
   FROM ( 
      SELECT COUNT(*) AS case_count  
      FROM lawyer_assignment
      GROUP BY lawyer_ID 
   ) AS case_totals
) 
ORDER BY total_cases DESC; 
