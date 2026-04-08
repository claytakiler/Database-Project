-- Query 1: Average salary by title (partner vs. associate)
SELECT
    lawyer.title,
    COUNT(*) AS num_lawyers,
    ROUND(AVG(lawyer.salary), 2) AS avg_salary,
    MIN(lawyer.salary) AS min_salary,
    MAX(lawyer.salary) AS max_salary
FROM lawyer
GROUP BY lawyer.title
ORDER BY avg_salary DESC;

-- Query 2: Partners earning above the firm-wide average salary
SELECT
    lawyer.lawyer_ID,
    lawyer.name,
    lawyer.salary
FROM lawyer
WHERE lawyer.title = 'partner'
AND lawyer.salary > (SELECT AVG(salary) FROM lawyer)
ORDER BY lawyer.salary DESC;

-- Query 3: Lawyers assigned to cases that are currently open or in trial
-- SELECT
--    lawyer.name,
--    lawyer.title,
--    `case`.case_ID,
--    `case`.title AS case_title,
--    `case`.status
--FROM lawyer
--JOIN lawyer_assignment la ON lawyer.lawyer_ID = la.lawyer_ID
--JOIN `case` ON la.case_ID = `case`.case_ID
--WHERE `case`.status IN ('open', 'in trial')
--ORDER BY lawyer.name, `case`.case_ID;
