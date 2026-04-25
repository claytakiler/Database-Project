SELECT 
    c.status,
    COUNT(DISTINCT cl.client_ID) AS unique_corporate_clients,
    COUNT(c.case_ID) AS total_case_load,
    ROUND(CAST(COUNT(c.case_ID) AS FLOAT) / COUNT(DISTINCT cl.client_ID), 2) AS cases_per_client
FROM client cl
JOIN `case` c ON cl.client_ID = c.client_ID
WHERE cl.type = 'corporate'
GROUP BY c.status
HAVING COUNT(c.case_ID) > 0
ORDER BY total_case_load DESC;