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
