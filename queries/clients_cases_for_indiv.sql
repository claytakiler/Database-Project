SELECT COUNT(DISTINCT cl.client_ID) as total_individuals
FROM client cl
JOIN `case` c ON cl.client_ID = c.client_ID
WHERE cl.type = 'individual';