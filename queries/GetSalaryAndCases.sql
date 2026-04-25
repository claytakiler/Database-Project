-- Get the name, salary, title, and number of cases closed or settled
-- Author: Clayton Houser
SELECT name, salary, lawyer.title, COUNT(lawyer_assignment.case_ID) AS closed_or_settled_cases FROM lawyer
INNER JOIN lawyer_assignment ON lawyer_assignment.lawyer_ID = lawyer.lawyer_ID
INNER JOIN `case` ON lawyer_assignment.case_ID = `case`.case_id
WHERE `case`.status = 'settled' or `case`.status = 'closed'
GROUP BY lawyer.lawyer_ID;