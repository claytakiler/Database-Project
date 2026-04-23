-- Query 2: Partners earning above the firm-wide average salary
SELECT
    lawyer.lawyer_ID,
    lawyer.name,
    lawyer.salary
FROM lawyer
WHERE lawyer.title = 'partner'
AND lawyer.salary > (SELECT AVG(salary) FROM lawyer)
ORDER BY lawyer.salary DESC;
